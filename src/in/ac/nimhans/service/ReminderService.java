package in.ac.nimhans.service;

import java.io.FileNotFoundException;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
//import org.project.IIITB.AppWellness.service.MailService.SMTPAuthenticator;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import in.ac.nimhans.dbService.dbObject;
import in.ac.nimhans.model.Path;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

public class ReminderService extends Thread {


private static Connection connection;
SMSServices smsservices = new SMSServices();

public ReminderService() {
 if(connection == null)
 connection = dbObject.getInstance().Connect();
}

private static final int FREQ = 5; // repeat every 10 mins
private static final int BLACKOUT_START = 22; // cannot sms after this time
            // at night
// (hrs)
private static final int BLACKOUT_END = 6; // cannot sms before this time in
           // the
// morning (hrs)
private static final int FIRST_NOTICE = 4 * 60;
private static final int SECOND_NOTICE = 30;
private final String PATH = Path.USER_PATH;

static void startService() {
 if (isRunning())
  return;
 alarm = new ReminderService();
 alarm.start();
 //System.out.println("Starting Reminder service");
}

private static boolean isRunning() {
 return ((alarm != null) && alarm.isAlive());
}

private static Thread alarm = null;

public void run() {
 try {
  while (true) {
   checkForReminders();
   Thread.sleep(FREQ * 60 * 1000);
  }
 } catch (InterruptedException e) {
  e.printStackTrace();
 } catch (JSONFileException e) {
  // TODO Auto-generated catch block
  e.printStackTrace();
 } catch (SQLException e) {
  // TODO Auto-generated catch block
  e.printStackTrace();
 }

}

private void sendReminder(int numReminders, String name, String mobileNumber, String nextSession) {
 //System.out.println("Send Reminder1: " + name + " " + mobileNumber + " " + nextSession);
 if ((mobileNumber == null) || mobileNumber.equals("") || !((mobileNumber.length() == 10) || (mobileNumber.length() == 12)))
  return;

 String mobMessage;
 if (numReminders == 2)
  mobMessage = "Hello! You have scheduled a session for yourself on PUSH-D on " + nextSession + " .";
 else
  mobMessage = "Hello! You have planned to devote time for PUSH-D after half an hour. Best wishes from PUSH-D team.";

 try {
  String encodedMsg = URLEncoder.encode(mobMessage, "UTF-8");
  String httpMessage = "http://www.smsgatewaycenter.com/library/send_sms_2.php?UserName=nimpus1&Password=vyecWa4c&Type=Individual&To="
    + mobileNumber + "&Mask=NIMHNS&Message=" + encodedMsg;

  //System.out.println("SMS-- "+httpMessage);
  CloseableHttpClient httpclient = HttpClients.createDefault();
  HttpGet httpget = new HttpGet(httpMessage);
  CloseableHttpResponse response = null;
  try {

   response = httpclient.execute(httpget);
   // //System.out.println(response.getStatusLine().getStatusCode());
   ////System.out.println(response.getStatusLine().getReasonPhrase());
   // //System.out.println(response.getStatusLine().toString());
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {
    response.close();
   } catch (IOException e) {
    e.printStackTrace();
   }
  }
 } catch (UnsupportedEncodingException e) {
  // TODO Auto-generated catch block
  e.printStackTrace();
 }

 /*
  *
 
 
 */

}

@SuppressWarnings("deprecation")
public void checkForReminders() throws JSONFileException, SQLException {
// //System.out.println("checking for reminders");
 
// sendReminder(2, "simha", "9010160431", "anytime");

 Date currentTime = new Date();
 int currentHour = currentTime.getHours();
 
  //System.out.println("checking for reminders-1 "+currentHour);
  //System.out.println("checking for reminders-2 "+BLACKOUT_START);
  //System.out.println("checking for reminders-3 "+BLACKOUT_END);
 
 if ((currentHour >= BLACKOUT_START) || (currentHour < BLACKOUT_END)) {
  // cannot send out messages
  //System.out.println("checking for reminders-4 ");
  return;
 }
 int BLACKOUT_LENGTH = BLACKOUT_END - BLACKOUT_START;
 if (BLACKOUT_LENGTH < 0)
  BLACKOUT_LENGTH += 24;

 // for each user
 // check their nextSession time
 // if not null and it is within the time diff of the relevant alarm send
 // sms
 // update number of reminders needed
 
 SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
 String sql = "SELECT * FROM `users` where users_id != 0";
 PreparedStatement pstatement=null;
 try {
 
 pstatement = dbObject.getInstance().Connect().prepareStatement(sql);
 //pstatement.setInt(1, Integer.parseInt(userId));
 ResultSet result1 = pstatement.executeQuery();
 ////System.out.println("error "+result1);
 while(result1.next()){
  ////System.out.println("checking for reminders-5 "+result1.getInt("users_id"));
            String n =  result1.getString("name");
            String id =  Integer.toString(result1.getInt("users_id"));
            String mode =  result1.getString("mode");
            String fn  =" ";
            String mobileNumber = " ";
            String user_email  = " ";
            //System.out.println(id);
            if ((mode != null) && mode.equals("active") && (result1.getInt("users_id") != 0)) {
             
             //Email Notification
             String sql9 = "SELECT `email` FROM `users` WHERE `users_id`=?";
   PreparedStatement pstatement9= null;
   try {
   pstatement9 = dbObject.getInstance().Connect().prepareStatement(sql9);
   pstatement9.setInt(1, Integer.parseInt(id));
   ResultSet result9 = pstatement9.executeQuery();
   
   if(result9.next()){
   
        user_email  = UserSecurityService.decrypt(result9.getString("email"));
       
       
   }
   
   }finally {
    if(pstatement9 != null) {
     pstatement9.close();
     
    }
   
   }
             
             //System.out.println("user_email  - "+user_email);
             
             
             //user_info
             String sql4 = "SELECT * FROM `user_info` WHERE `user_id`=?";
   PreparedStatement pstatement4 = null;
   try {
   
   pstatement4 = dbObject.getInstance().Connect().prepareStatement(sql4);
   pstatement4.setInt(1, Integer.parseInt(id));
   ResultSet result4 = pstatement4.executeQuery();
   
   if(result4.next()){
   
        fn  = result4.getString("fname");
        mobileNumber = result4.getString("mobileNumber");
       
   }
   }finally {
   
    if(pstatement4 != null) {
     pstatement4.close();
     
    }
   }
             
             String sql1 = "SELECT * FROM `stats` WHERE `user_id`=?";
   PreparedStatement pstatement1=null;
   try {
   
   pstatement1 = dbObject.getInstance().Connect().prepareStatement(sql1);
   pstatement1.setInt(1, Integer.parseInt(id));
   ResultSet result = pstatement1.executeQuery();
   
   if(result.next()){
       //System.out.println("date ---");
   
    String nextSession = result.getString("nextSession");
    //System.out.println("date -1-1-"+nextSession);
    String remindersNeeded = Integer.toString(result.getInt("remindersNeeded"));
    int numReminders = 0;
    if (remindersNeeded != null)
     numReminders = Integer.parseInt(remindersNeeded);
    ////System.out.println("mobMessage  "+nextSession+" mobMessage "+nextSession+"numReminders"+numReminders);
                         
    if (!(id.equals("0")) && (nextSession != null) && !(nextSession.equals(""))
      && (numReminders > 0)) {
     //System.out.println("numReminders  "+numReminders);
     
     Date nextSessionTime = format.parse(nextSession);

     long diff = nextSessionTime.getTime() - currentTime.getTime();
     

     long minutes = TimeUnit.MILLISECONDS.toMinutes(diff);
     // long hours = TimeUnit.MILLISECONDS.toHours(diff);

     //System.out.println("diff in mins " + minutes+" FIRST_NOTICE "+FIRST_NOTICE+" SECOND_NOTICE "+SECOND_NOTICE);
     
     boolean shouldSend = false;
     if (minutes > 0) {
      if (numReminders == 2) {
       if (minutes <= FIRST_NOTICE) {
        shouldSend = true;
       } else if ((nextSessionTime.getDay() != currentTime.getDay())
         && (minutes < (FIRST_NOTICE + (BLACKOUT_LENGTH * 60)))) {
        // overnight but not enough time in
        // morning
        // to
        // give notice
        // needs improvement
        shouldSend = true;
       }
      } else if ((numReminders >= 1) && (minutes <= SECOND_NOTICE)) {
       shouldSend = true;
      }

      if (shouldSend == true) {
       
       //System.out.println(" TRUE mobMessag1e  "+mobileNumber+" mobMessageuser_id "+id+"numReminders"+numReminders);
       
       //String fn = result1.getString("fname");
       //String mobileNumber = result1.getString("mobileNumber");
       

       //sendReminder(numReminders, fn, mobileNumber, nextSession);
       
       
       //if ((mobileNumber == null) || mobileNumber.equals("") || !((mobileNumber.length() == 10) || (mobileNumber.length() == 12)))
       //return;

       String mobMessage;
       String m_text1 ;
       String emaillink = "\n Push.d.nimhans@gmail.com";
       if (numReminders == 2) {
        mobMessage = "Hello! You have scheduled a session for yourself on PUSH-D on " + nextSession + " .";
       
        // m_text1 = "<div>Hi\n"
           m_text1 = "<div>Hello!\n"
                                   + ",</div><div>You have scheduled a session for yourself on PUSH-D on "+ nextSession +" We encourage you to use this scheduled time to attend  to your self-care. </div><br>"
                                   + "<br><div><br>In case you are not able to log in as planned, you can access PUSH-D at any other time by logging in with your username and password. But Please Remember: It is best to keep time aside and log in as you planned.</div><div><br>Thanks,</div><div>Push-D team<br></div><div><br>Please do not 'REPLY' directly to this email. If you have any query, send  an email to "
                                   + emaillink +  "</div>";
       
       }else {
        mobMessage = "Hello! You have planned to devote time for PUSH-D after half an hour. Best wishes from PUSH-D team.";
       
        //m_text1 = "<div>Hi\n"
        m_text1 = "<div>Hello!\n"
                                   + ",</div><div>You have scheduled a session for yourself on PUSH-D on "+ nextSession +"</div><br>"
                                   + "<br><div><br>In case you are not able to log in as planned, you can access PUSH-D at any other time by logging in with your username and password. But Please Remember: It is best to keep time aside and log in as you planned. </div><div><br>Thanks,</div><div>Push-D team<br></div><div><br>Please do not 'REPLY' directly to this email. If you have any query, send  an email to "
                                   + emaillink +  "</div>";
       }
       String mobNum = "";
       if(mobileNumber.equals("")) {
         mobNum = "";
        //System.out.println("decrypted MobileNumber-1-"+mobNum);
       
       }else {
         mobNum = UserSecurityService.decrypt(mobileNumber);
        //System.out.println("decrypted MobileNumber-2-"+mobNum);
       }
       
       //****** INACTIVE SMS AND EMAI FOR TEST SERVER****//
       //String sms = smsservices.sendSingleSMS("sindumg-pushd", "pushpushd@123" , mobMessage , "NIMHMS", mobNum,"34e65c89-baa0-44fb-ba70-7063171081de");
       //sendEmail(user_email, "Next login Reminder", m_text1);
       
       PreparedStatement pstatement3= null;
       String sql3  = "UPDATE `stats` SET `remindersNeeded` = ? WHERE `user_id`=? ";
       try {
       pstatement3 = connection.prepareStatement(sql3);
       pstatement3.setInt(1, (numReminders - 1));
       //pstatement2.setString(2, value);
       pstatement3.setInt(2, Integer.parseInt(id));
       int result3 = pstatement3.executeUpdate();
       }finally {
        if(pstatement3 != null) {
         pstatement3.close();
         
        }
       }
       
       
      }
     }
     
     
     
    }
   
   }
             
             }finally {
             
              if(pstatement1 != null) {
            pstatement1.close();
           
           }
             }
             
             
             
            }
           
 
 }
 } catch (Exception e) {
  ////System.out.println("Error in user " + n);
  e.printStackTrace();
 } finally {
 
  if(pstatement != null) {
   pstatement.close();
   
  }
 
 }
 
 

  }
 


//emailsemding for signup


public void sendEmail(String dest, String subject, String body) {
 ////System.out.println("hello its working"+dest+"    --- "+subject+" --"+body);
 //String d_password = "useforreminders";
 //String d_port = "587";
 
 //GMAIL SMTP
 String d_email = "nimhans.pushd@gmail.com";
 String d_host = "smtp.gmail.com";
    String d_port = "465";
   
 
 

 Properties props = new Properties();

 props.put("mail.smtp.user", d_email);
 props.put("mail.smtp.host", d_host);
 props.put("mail.smtp.port", d_port);
 props.put("mail.smtp.starttls.enable", "true");
 props.put("mail.smtp.auth", "true");
 props.put("mail.smtp.socketFactory.port", d_port);
 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
 props.put("mail.smtp.socketFactory.fallback", "false");
 
 
 SecurityManager security = System.getSecurityManager();
 
 try {

  Authenticator auth = new SMTPAuthenticator();
  Session session = Session.getInstance(props, auth);
  MimeMessage msg = new MimeMessage(session);
  msg.setContent(body, "text/html; charset=utf-8");
  msg.setSubject(subject);
  msg.setFrom(new InternetAddress(d_email));
  msg.addRecipient(Message.RecipientType.TO, new InternetAddress(dest));
  Transport.send(msg);
  //System.out.println("Mail Sent Sucessfully");

 } catch (Exception e) {
  e.printStackTrace();
  ////System.out.println("Mail Sent faild"+e);
 }
}

class SMTPAuthenticator extends javax.mail.Authenticator {

 public PasswordAuthentication getPasswordAuthentication() {
	 		String d_email = "nimhans.pushd@gmail.com";
            //String d_password = "nimhans@123#";
	 		//String d_password = "tbktpvinadrpjkiw";
	 		String d_password = "anntokzouuedkyaa";
	 		
  return new PasswordAuthentication(d_email, d_password);
 }
}



//sending email with section forms to user
public void emailWithAttachment(int user_id) throws SQLException{
 
 int currentSection = 0;
 int currentSubSection = 0;
 String sql = "SELECT `currentSection`,`currentSubSection` FROM `stats` WHERE `user_id`=?";
 PreparedStatement pstatement;
 try {
  pstatement = connection.prepareStatement(sql);
  pstatement.setInt(1, user_id);
  ResultSet result = pstatement.executeQuery();

  if (result.next()) {
    currentSection = result.getInt("currentSection");
    currentSubSection = result.getInt("currentSubSection");
 
  }
 } catch (SQLException e1) {
  // TODO Auto-generated catch block
  e1.printStackTrace();
 }
 
 if((currentSection == 3) && (currentSubSection == 1)) {
 
  // Recipient's email ID needs to be mentioned.
       String to = "";
       
       
       String sql1 = "SELECT `email` FROM `users` WHERE `users_id`=?";
   PreparedStatement pstatement1;
   pstatement1 = connection.prepareStatement(sql1);
   pstatement1.setInt(1, user_id);
   ResultSet result1 = pstatement1.executeQuery();

   if (result1.next()) {
   
     to = UserSecurityService.decrypt(result1.getString("email"));
     
   }
       
       

       // Sender's email ID needs to be mentioned
      	String from = "nimhans.pushd@gmail.com";
       final String username = "nimhans.pushd@gmail.com";//change accordingly
       //final String password = "nimhans@123#";//change accordingly
       //final String password = "tbktpvinadrpjkiw";
       final String password = "anntokzouuedkyaa";
       
      

       String host =  "smtp.gmail.com";

         Properties props = new Properties();
         props.put("mail.smtp.user", to);
   props.put("mail.smtp.host", host);
   props.put("mail.smtp.port", "465");
   props.put("mail.smtp.starttls.enable", "true");
   props.put("mail.smtp.auth", "true");
   props.put("mail.smtp.socketFactory.port", "465");
   props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
   props.put("mail.smtp.socketFactory.fallback", "false");

       // Get the Session object.
       Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
             protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
             }
          });

       try {
          // Create a default MimeMessage object.
          Message message = new MimeMessage(session);

          // Set From: header field of the header.
          message.setFrom(new InternetAddress(from));

          // Set To: header field of the header.
          message.setRecipients(Message.RecipientType.TO,
             InternetAddress.parse(to));

          // Set Subject: header field
          message.setSubject("PUSH-D Essential Sections Forms");

          // Create the message part
          BodyPart messageBodyPart = new MimeBodyPart();

          // Now set the actual message
          messageBodyPart.setText("Hi,\r\n" +
            "\r\n" +
            "Here  are  a few  blank  forms  that  are  related  to  some  of  the essential  sections of PUSH-D (section 3 to 7) .You can download  and  store  these  forms for typing/print  and use  them.\r\n" +
            "\r\n" +
            "\r\n" +
            "Please note that these  forms  will make  sense  only  when  you  reach  the relevant  sections on PUSH-D- app/website. Besides these, there  are other  forms that you will be required to fill as well as exercises that  you will get to complete  in  the various essential  sections of PUSH-D. You will find  these forms in PUSH-D essential sections where you can fill and save them online. \r\n" +
            "\r\n" +
            "You can also  re-look  at  these filled  forms   or create  new  versions  in  your  workbook. Please note  that      workbook  is  currently  available  only on the browser version of PUSH-D. Even if you are using mobile app, you can still access workbook in web browser version. We recommend you to use browser version on a desktop or a laptop. \r\n" +
            "\r\n" +
            "In addition,  it may be useful  to  also download and record   your  thoughts  in some of these  exercises  offline  on a  day to day basis , either on saved soft copies or on printed copies.  So, please download and use them  as  and  when  you reach  the relevant  sections.\r\n" +
            "\r\n" +
            "Best  wishes\r\n" +
            "\r\n" +
            "PUSH-D Team");

          // Create a multipar message
          Multipart multipart = new MimeMultipart();

          // Set text message part
          multipart.addBodyPart(messageBodyPart);

          // Part two is attachment
          addAttachment(multipart, Path.Files_PATH+"Section3-Activate.docx");
          addAttachment(multipart, Path.Files_PATH+"section4DealingWithDepressiveThoughts.docx");
          addAttachment(multipart, Path.Files_PATH+"SECTION5ManagingExcessiveWorries.docx");
          addAttachment(multipart, Path.Files_PATH+"section6LearnSelf-Compassion.docx");
          addAttachment(multipart, Path.Files_PATH+"section7Strengthen self-soothing.docx");
         

          // Send the complete message parts
          message.setContent(multipart);

          // Send message
          Transport.send(message);

          //System.out.println("Sent message successfully with Attachments....");
   
       } catch (MessagingException e) {
       // System.exit(0);
          throw new RuntimeException(e);
         
       } finally {
       
        //System.out.println("finally block");
       }
 
 }else {
 
 
  //System.out.println("we sent email to this usser "+user_id+" alresdy");
 }

   }
 
 
//adding multiple files as attachments
private static void addAttachment(Multipart multipart, String filename) throws MessagingException
 {
     DataSource source = new FileDataSource(filename);
     BodyPart messageBodyPart = new MimeBodyPart();        
     messageBodyPart.setDataHandler(new DataHandler(source));
     messageBodyPart.setFileName(filename);
     multipart.addBodyPart(messageBodyPart);
 }


//NIMHANS-EMAIL
public void sendEmail_nimhans(String dest, String subject, String body) {
 
   String host="10.11.3.20";
   final String user="pushd@nimhans.edu.in";//change accordingly
   final String password="pushd@1234";//change accordingly
   
   String to=dest;//change accordingly

    //Get the session object
    Properties props = new Properties();
    props.put("mail.smtp.host",host);
    props.put("mail.smtp.auth", "true");
   
    Session session = Session.getDefaultInstance(props,
     new javax.mail.Authenticator() {
       protected PasswordAuthentication getPasswordAuthentication() {
  return new PasswordAuthentication(user,password);
       }
     });

    //Compose the message
     try {
      MimeMessage message = new MimeMessage(session);
      message.setFrom(new InternetAddress(user));
      message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
      message.setSubject(subject);
      message.setText(body);
     
     //send the message
      Transport.send(message);

      //System.out.println("message sent successfully..NIMHANS.");
 
      } catch (MessagingException e) {e.printStackTrace();}
 
 
 
}
 
 
 
}