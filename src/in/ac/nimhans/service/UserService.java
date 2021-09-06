package in.ac.nimhans.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;

import com.google.api.client.util.DateTime;
import com.google.common.io.BaseEncoding;

//db hederfiles
import in.ac.nimhans.dbService.dbObject;
import java.sql.*;
import java.util.*;

import in.ac.nimhans.model.Doctor;
import in.ac.nimhans.model.LoginResponse;
import in.ac.nimhans.model.Path;
import in.ac.nimhans.model.PushdNotes;
import in.ac.nimhans.model.SessionStats;
import in.ac.nimhans.model.UsageStats;
import in.ac.nimhans.model.User;
import in.ac.nimhans.service.UserSecurityService;

public class UserService {

	private static Connection connection = null;

	public UserService() {

		if(connection == null) 
			connection = dbObject.getInstance().Connect();
	}

	// private ArrayList<User> currentUsers = new ArrayList<>();
	private final String PATH = Path.USER_PATH;
	private final String PATH_Signup = Path.SIGNUP_PATH;
	ReminderService reminderService = new ReminderService();
	// creating users

	// NewUser REGISTRATION - used for both self-registration and admin
	// registration
	public int createNewUser(String email, String name1, String password ,String str) {
		int result = 0;
		int verNum = 0;
		String name=name1.toLowerCase();
		int candidateId = -1; // invalid user by default
		ResultSet rs = null;
		
		
		String newEmail = UserSecurityService.encrypt(email);
		
		String newName = UserSecurityService.encrypt(name);
		
		//System.out.println("encrypetdPassword--"+newEmail);
		
		
	

		try {

			String salt = UserSecurityService.getNewSalt();
			String hashedPwd = UserSecurityService.pwdHash(password, salt);
			System.out.println("userINPUT-Password- "+hashedPwd);
			
			String sql1 = "SELECT `users_id` FROM `users` WHERE `email`=?";
			// System.out.println("sql "+sql1);
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setString(1, newEmail);
			ResultSet result1 = pstatement1.executeQuery();

			if(result1.next()) {

				verNum = result1.getInt("users_id");

			}
			if (verNum == 0) {

				PreparedStatement pstatement;
				String sql = "INSERT INTO `users`(`name`, `password`, `mode`, `email`,`self_registration`,`key_1`) VALUES (?,?,?,?,?,?)";
				pstatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				pstatement.setString(1, newName);
				pstatement.setString(2, hashedPwd);
				pstatement.setString(3, "Active");
				pstatement.setString(4, newEmail);
				if(str.equals("false"))
				pstatement.setString(5, "false");
				else
				pstatement.setString(5, "true");
				
				pstatement.setString(6, salt);
				// **
				// should also initialize mode, flag etc, unless these can be
				// set to default values in db

				result = pstatement.executeUpdate();

				if (result == 1) {
					rs = pstatement.getGeneratedKeys();
					if (rs.next()) {
						candidateId = rs.getInt(1);

						System.out.println("candidateId  " + candidateId);
					}

				}
				System.out.println("came  " + verNum);
			} else {
				System.out.println("came  inactive");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("came12  " + verNum);

		return candidateId;

	}

	// used to create a new user by admin.
	// Should this also be used by self-registration using data from first
	// form??
	public User addUser(User user, boolean newUserId) {

		// create a new user and then update data fields
		int userId;
		
		if(newUserId) {
			String str1="false";
			userId = createNewUser(user.getMailId(), user.getName(), user.getPassword(),str1);
		} else {
			userId = user.getId();
			
			
			
		}
		
		if (userId == -1) {
			return null;
		} else { // valid user
			
			System.out.println("working");
			user.setId(userId);
			

			try {

				
				updateUser(user, true);
				
				 /* System.out.println("insert user data into user table  " + userId); 
				  PreparedStatement pstatement1; 
				  String sql1 = "INSERT INTO `user_info` (`user_id`, `checkpoint`, `fname`, `livingArrangement`, `education`, `gender`, `mobileNumber`, `significantOther`, `age`, `maritalStatus`, `agreed`) VALUES (?,?,?,?,?,?,?,?,?,?,?)"; 
				  pstatement1 = connection.prepareStatement(sql1);
				  pstatement1.setInt(1, userId); 
				  pstatement1.setString(2,"false"); 
				  pstatement1.setString(3, user.getFname());
				  pstatement1.setString(4, user.getLivingArrangement());
				  pstatement1.setString(5, user.getEducation());
				  pstatement1.setString(6, user.getGender());
				  String mobNum = UserSecurityService.encrypt(user.getMobileNumber());
				  pstatement1.setString(7, mobNum);
				//  pstatement1.setString(8, user.getMailId());
				  pstatement1.setString(8, user.getSignificantOther());
				  if(user.getAge().equals("")) {
				  pstatement1.setInt(9, 0);
				  }else {
					  pstatement1.setInt(9, Integer.parseInt(user.getAge())); 
					  
				  }
				  pstatement1.setString(10, user.getMaritalStatus());
				  pstatement1.setString(11, "false"); 
				  int result1 = pstatement1.executeUpdate();
				  
				  
				  System.out.println("Second table user_INFO " + result1);*/
				 

				// states entry for user first time
				int result2 = 0;
				PreparedStatement pstatement2;
				String sql2 = "INSERT INTO `stats` (`user_id`, `activeSubSection`, `noOfExercisesCompleted`, `prSectionId`, `currentSection`, `noOfSectionsCompleted`, `remindersNeeded`, `currentSubSection`, `noOfSubSectionsCompleted`, `noOfTimesLoggedIn`, `activeSection`, `status`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
				pstatement2 = connection.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);
				pstatement2.setInt(1, userId);
				pstatement2.setInt(2, 0);
				pstatement2.setInt(3, 0);
				pstatement2.setInt(4, 0);
				pstatement2.setInt(5, 0);
				pstatement2.setInt(6, 0);
				pstatement2.setInt(7, 0);
				pstatement2.setInt(8, 0);
				pstatement2.setInt(9, 0);
				pstatement2.setInt(10, 0);
				pstatement2.setInt(11, 0);
				pstatement2.setString(12, "true");

				result2 = pstatement2.executeUpdate();

				System.out.println("3rd table states table user_INFO " + result2);

				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		return user;
	}

	// update info of existing user
	public void updateUser(User user, boolean firstTime) {
		// System.out.println("Updating " + user);

		int userId = user.getId();

		try {
			String sql1 ="";
			PreparedStatement pstatement1;
			if(firstTime) {
			//INSERT	
				//INSERT
			      sql1 = "INSERT INTO `user_info` (`user_id`, `checkpoint`, `fname`, `livingArrangement`, `education`, `gender`, `mobileNumber`, `significantOther`, `age`, `maritalStatus`, `agreed`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			     
			      pstatement1 = connection.prepareStatement(sql1);
			    pstatement1.setInt(1, userId);
			    pstatement1.setString(2,"false");
			    pstatement1.setString(3, user.getFname());
			    pstatement1.setString(4, user.getLivingArrangement());
			    pstatement1.setString(5, user.getEducation());
			    pstatement1.setString(6, user.getGender());
			    String mobNum = UserSecurityService.encrypt(user.getMobileNumber());
			    pstatement1.setString(7, mobNum);
			  //  pstatement1.setString(8, user.getMailId());
			    pstatement1.setString(8, user.getSignificantOther());
			   
			    if(user.getAge() == "") {
			    	pstatement1.setInt(9, 0);
			     //pstatement1.setInt(9, Integer.parseInt(user.getAge()));  
			    }else {
			     //pstatement1.setInt(9, 0);
			     pstatement1.setInt(9, Integer.parseInt(user.getAge()));
			    }
			   
			    pstatement1.setString(10, user.getMaritalStatus());
			    pstatement1.setString(11, "false");
			    int result1 = pstatement1.executeUpdate();
			 
			  } else {
			   
			    sql1 = "UPDATE `user_info` SET `livingArrangement`=?,`education`=?,`gender`=?,`mobileNumber`=?,`significantOther`=?,`age`=?,`maritalStatus`=? WHERE `user_id`=?";
			    pstatement1 = connection.prepareStatement(sql1);
			    pstatement1.setString(1, user.getLivingArrangement());
			    pstatement1.setString(2, user.getEducation());
			    pstatement1.setString(3, user.getGender());
			    String mobNum = UserSecurityService.encrypt(user.getMobileNumber());
			    pstatement1.setString(4, mobNum);
			    pstatement1.setString(5, user.getSignificantOther());
			    pstatement1.setInt(6, Integer.parseInt(user.getAge()));
			    pstatement1.setString(7, user.getMaritalStatus());
			    pstatement1.setInt(8, userId);
			   // pstatement1.setInt(9,user.getDoctor_id());
			    int result1 = pstatement1.executeUpdate();
			 
			  //update password
			    if(user.getPassword() != null) {
			     
			      setPassword(userId, user.getPassword());
			      
			     
			    }
			   
			    //update doctor assign
			        String sql2 = "UPDATE `users` SET `doctor_id` = ? WHERE `users_id` = ?";
			        PreparedStatement pstatement2 = connection.prepareStatement(sql2);
			        pstatement2.setInt(1,user.getDoctor_id());
			        pstatement2.setInt(2, userId);
			        int result2 = pstatement2.executeUpdate();
			        
			        
			      //begin code to update user_doctor table
			        try {
						int user_doctor_id = 0;
						String sql = "SELECT MAX(`user_doctor_id`) as `user_doctor_id` FROM `user_doctor` WHERE `user_id`=?";
						PreparedStatement pstatement;
						pstatement = connection.prepareStatement(sql);
						pstatement.setInt(1, userId);
						
						ResultSet result = pstatement.executeQuery();
						while (result.next()) {
							user_doctor_id = result.getInt("user_doctor_id");
						}
			        Date date= new Date();
					long time = date.getTime();
					Timestamp start_date = new Timestamp(time);
					
					
					
					
					//incomplete code to update the end_date
					/*int mode1=0;
					String sql3 = "UPDATE `user_doctor` SET `mode` = ?,`end_date` = ? WHERE `user_id` = ?";
			        PreparedStatement pstatement3 = connection.prepareStatement(sql3);
			        pstatement3.setInt(1,userId);
			        pstatement3.setInt(2, mode1);
			        pstatement3.setTimestamp(3, start_date);
			        int result3 = pstatement3.executeUpdate();*/
					
			        int mode2 = 1;
			        String sql4 = "INSERT INTO `user_doctor` (`user_id`, `doctor_id`,`mode`,`start_date`) VALUES (?,?,?,?) ";
			        PreparedStatement pstatement4 = connection.prepareStatement(sql4);
			        pstatement4.setInt(1,userId);
			        pstatement4.setInt(2, user.getDoctor_id());
			        pstatement4.setInt(3, mode2);
			        pstatement4.setTimestamp(4, start_date);
			        
			        
			        int result4 = pstatement4.executeUpdate();
			        } catch (Exception e) {
						e.printStackTrace();
					}
			        //end of new code
			    
			    
//			     String sql2 = "UPDATE `users` SET `password` = ? WHERE `users_id` = ?";
//			     PreparedStatement pstatement2 = connection.prepareStatement(sql2);
//			        pstatement2.setString(1, user.getLivingArrangement());
//			        pstatement2.setInt(2, userId);
//			        int result2 = pstatement2.executeUpdate();
			
			
			  }


			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User getUser(int userId, boolean detailsNeeded) {

		// JSONParser parser = new JSONParser();
		User user = null;
		System.out.println("UR Method : get detailsNeeded  "+detailsNeeded);
		try {

			// String currentSection;
			String name = "", gender = "";

			String age = null;

			int currentSection = 0;
			String nextSession = null;
			int remindersNeeded = 0;
			int noOfExercisesCompleted = 0;
			int currentSubSection = 0;
			int noOfTimesLoggedIn = 0;
			int noOfSectionsCompleted = 0;
			String maritalStatus;
			String livingArrangement;
			String education;
			String significantOther;
			String mailId=null;
			String lastPhoneCall = null;
			String nextCallDue = null;
			String mobileNumber;
			String fname;
			// String gender;

			String loginTime;
			String logoutTime;
			String lastActivity;
			String timeSpent;
			String smiley;
			int doctor_id=0;

			// view dataBase
			String sql = "SELECT *FROM `user_info` WHERE `user_id`=?";
			System.out.println("UR Method : get UserDetails , UserId= get Services");

			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, userId);
			ResultSet result1 = pstatement.executeQuery();

			if (result1.next()) {

				// in user_info table
				name = result1.getString("fname");
				age = Integer.toString(result1.getInt("age"));
				gender = result1.getString("gender");
				maritalStatus = result1.getString("maritalStatus");
				livingArrangement = result1.getString("livingArrangement");
				education = result1.getString("education");
				significantOther = result1.getString("significantOther");
				

				//getting email
				   String sql12 = "SELECT *FROM `users` WHERE `users_id`=?";
				   PreparedStatement pstatement12;
				   pstatement12 = connection.prepareStatement(sql12);
				   pstatement12.setInt(1, userId);
				   ResultSet result12 = pstatement12.executeQuery();
				   if (result12.next()) {
				   
				   
				    String email_id ="";
				    doctor_id= result12.getInt("doctor_id");
				   
				    if(result12.getString("email") != null) {
				     email_id = UserSecurityService.decrypt(result12.getString("email"));
				     
				     }else {
				      email_id = "Not provided";
				     
				     }
				    mailId = email_id;
				   } 
				
				String mobNum ="";
				if(result1.getString("mobileNumber") != null) {
				 mobNum = UserSecurityService.decrypt(result1.getString("mobileNumber"));
				}
				mobileNumber = mobNum;
				fname = result1.getString("fname");
				String checkpoint = result1.getString("checkpoint");
				String agreed = result1.getString("agreed");

				if (detailsNeeded == false) {
					System.out.println("inside");
					user = new User(userId, name, fname, gender, age, agreed, checkpoint);
				} else {
					System.out.println("outside");
					// not in user_info table
					ArrayList<SessionStats> sessionStats = new ArrayList<SessionStats>();
					String sql1 = "SELECT * FROM `stats` WHERE `user_id`=?";
					System.out.println(sql1);
					PreparedStatement pstatement1;
					pstatement1 = connection.prepareStatement(sql1);
					pstatement1.setInt(1, userId);
					ResultSet result = pstatement1.executeQuery();
					if (result.next()) {
						
						currentSection = result.getInt("currentSection");
						nextSession = Integer.toString(result.getInt("nextSession"));
						remindersNeeded = result.getInt("remindersNeeded");
						noOfExercisesCompleted = result.getInt("noOfExercisesCompleted");
						currentSubSection = result.getInt("currentSubSection");
						noOfTimesLoggedIn = result.getInt("noOfTimesLoggedIn");
						noOfSectionsCompleted = result.getInt("noOfSectionsCompleted");
						String sql2 = "SELECT * FROM `sessionstats` WHERE `users_id`=?";
						PreparedStatement pstatement2;
						pstatement2 = connection.prepareStatement(sql2);
						pstatement2.setInt(1, userId);
						ResultSet result2 = pstatement2.executeQuery();

						while (result2.next()) {

							SessionStats sessionObj = new SessionStats();
							System.out.println(result2.getTimestamp("lastActivity"));

							SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

							loginTime = dateFormat.format(result2.getTimestamp("loginTime"));
							if (result2.getTimestamp("logoutTime") != null) {
								logoutTime = dateFormat.format(result2.getTimestamp("logoutTime"));
							} else {
								logoutTime = "no data";
							}
							if (result2.getTimestamp("logoutTime") != null) {
								lastActivity = dateFormat.format(result2.getTimestamp("lastActivity"));
							} else {

								lastActivity = "no data";
							}
							
							
							if (result2.getTimestamp("logoutTime") != null) {
							//time difference calculations
							SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
							Date d1 = null;
							Date d2 = null;
							d1 = format.parse(format.format(result2.getTimestamp("loginTime")));
							d2 = format.parse(format.format(result2.getTimestamp("lastActivity")));
							Long diff = d2.getTime() - d1.getTime();
							Long diffMinutes = diff / (60 * 1000) % 60;
							Long diffHours = diff / (60 * 60 * 1000) % 24;
							Long diffDays = diff / (24 * 60 * 60 * 1000);
							String timediff = null;
							if((diffHours > 0)) {
								//long mins_new= 
								int mins_new = (int) (diffMinutes % 60);
								System.out.println("mins_new  "+mins_new);
								
								timediff=diffHours+" hours "+mins_new+" mins";
								
							}else {
								
								//int mins_new = 130 % 60;
								//System.out.println("mins_new  "+mins_new);
								
								timediff="0 hours "+diffMinutes+" mins";
							}

							timeSpent = timediff;
							//System.out.println("time------"+timeSpent);
							
							}else {
								
								timeSpent = "NO DATA";
							}
							//timeSpent = diff.toString();
							
							smiley = result2.getString("smiley");

							sessionObj.setLoginTime(loginTime);
							sessionObj.setLogoutTime(logoutTime);
							sessionObj.setLastActivity(lastActivity);
							sessionObj.setTimeSpent(timeSpent);
							sessionObj.setSmiley(smiley);

							sessionStats.add(sessionObj);

						}
						System.out.println("1"+user);
						user = new User(userId, name,mailId, gender, age, mobileNumber, nextSession, remindersNeeded,
								currentSection, noOfExercisesCompleted, currentSubSection, noOfSectionsCompleted,
								noOfTimesLoggedIn, sessionStats, maritalStatus, livingArrangement, education,
								significantOther,lastPhoneCall, nextCallDue,doctor_id);
						user.setFname(fname);
					}
					System.out.println("2"+user);
					user = new User(userId, name,mailId, gender, age, mobileNumber, nextSession, remindersNeeded,
							currentSection, noOfExercisesCompleted, currentSubSection, noOfSectionsCompleted,
							noOfTimesLoggedIn, sessionStats, maritalStatus, livingArrangement, education,
							significantOther, lastPhoneCall, nextCallDue,doctor_id);
					user.setFname(fname);
				}
				System.out.println("3"+user);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
System.out.println("4"+user);
		return user;
	}

	public List<User> getAllUsers() {
		ArrayList<User> users = new ArrayList<>();
		try {
			 System.out.println("sql query");
			String sql = "SELECT `users_id`,`name`, `mode`,`flag`,`doctor_id` FROM `users`";
			// System.out.println("sql " + sql);
			ResultSet result1 = executeDbQuery(sql);


			
			  String name = ""; int id; String flag = ""; String mode = "";
			  String gender = ""; String age = ""; int doctor_id;
			  
			  while (result1.next()) { 
				  String sql1 = "SELECT `gender`,`age` FROM `user_info` WHERE `user_id`=" + result1.getInt("users_id"); 
				  
				  // System.out.println("sql "+sql1);
			  PreparedStatement pstatement1; pstatement1 =
			  connection.prepareStatement(sql1); 
			  ResultSet result2 = pstatement1.executeQuery(); 
			  
			  if (result2.next()) { 

			gender = result2.getString("gender");
			  age = Integer.toString(result2.getInt("age")); }
			  id = result1.getInt("users_id"); 
			  name = UserSecurityService.decrypt(result1.getString("name")) ; 
			  mode = result1.getString("mode"); 
			  flag = result1.getString("flag");
			  doctor_id = result1.getInt("doctor_id");
			  
			  
			  User user = new User(id, name, gender, age, flag, mode,doctor_id);
			  System.out.println("doctor_id- "+doctor_id);
			  users.add(user);
			  }
			 
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return users;
	}

	

	// login and logout

	public LoginResponse login(String name, String password, String app_type) {
		// dataBase code
		//ReminderService reminderService = new ReminderService();
		//reminderService.emailWithAttachment();
		System.out.println("user trying to login in "+app_type);
		LoginResponse response = new LoginResponse();
		try {
			String newEmail = UserSecurityService.encrypt(name);
			
			
			System.out.println("encrypetd-Admin-"+UserSecurityService.encrypt("admin"));
			System.out.println("decrypt"+UserSecurityService.decrypt(newEmail));
			
           //passwordEncy
			String salt ="";
			
			String sql5 = "SELECT `key_1` FROM `users` WHERE `name`= ?";
			PreparedStatement pstatement5;
			pstatement5 = connection.prepareStatement(sql5);
			pstatement5.setString(1, newEmail);
			ResultSet result5 = pstatement5.executeQuery();
				if (result5.next()) {
					salt = result5.getString("key_1");	
				}
			
			
			String hashedPwd = UserSecurityService.pwdHash(password, salt);
			
			System.out.println("hashedPwd--"+hashedPwd);
			
			String sql = "SELECT `users_id`,`mode`,`reg_form_status`,`self_registration` FROM `users` WHERE `name`= ? and `password`= ?";

			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setString(1, newEmail);
			pstatement.setString(2, hashedPwd);
			ResultSet result2 = pstatement.executeQuery();
			
			//newTestUser start
			//updateing Test User
//			if (result2.next()) {
//
//			  int user_id1 = result2.getInt("users_id");
//			  
//			  System.out.println("user_id outside--"+user_id1);
//			  
//			  if(user_id1 == 30) {
//				
//				  System.out.println("user_id inside--"+user_id1);
//				  
//			  String sql7 = "UPDATE `stats` SET `activeSubSection` = '0',`currentSection` = '1',`noOfSectionsCompleted` = '0',`noOfSubSectionsCompleted` = '0',`activeSection` = '1' WHERE `user_id` = ?";  
//     	      PreparedStatement pstatement7;
//     	      pstatement7 = connection.prepareStatement(sql7);
//     	      pstatement7.setInt(1, user_id1);
//			  int result7 = pstatement7.executeUpdate();
//			   
//			  }
//			  
//			}
			
			
			//newTestUser END		

			int user_id;
			String mode="";
			int self_reg_status =0;
			String self_registration="";
			System.out.println("user_id inside-234-"+self_reg_status);
			if (result2.next()) {

				user_id = result2.getInt("users_id");
				mode = result2.getString("mode");
				self_reg_status =result2.getInt("reg_form_status");
				self_registration=result2.getString("self_registration");
				
				System.out.println("user_id inside-1-"+user_id); 
				//newTestUser start
				 if(user_id == 79) {	
					 
				       
					  String sql7 = "UPDATE `stats` SET `activeSubSection` = 0,`currentSection` = 1,`noOfSectionsCompleted` = 0,`noOfExercisesCompleted` = 0,`noOfSubSectionsCompleted` = 0,`activeSection` = 1,`currentSubSection`= 0 WHERE `user_id` = ?";  
		     	      PreparedStatement pstatement7;
		     	      pstatement7 = connection.prepareStatement(sql7);
		     	      pstatement7.setInt(1, user_id);
					  int result7 = pstatement7.executeUpdate();
					  
					  
					  String sql8 = "DELETE FROM `depressed_res` WHERE `user_id` = 79";  
   	        	      PreparedStatement pstatement8;
   	        	      pstatement8 = connection.prepareStatement(sql8);
   	 			      int result8 = pstatement8.executeUpdate();
					  
					  String sql9 = "DELETE FROM `section_feedback` WHERE `users_id` = 79";  
   	        	      PreparedStatement pstatement6;
   	        	      pstatement6 = connection.prepareStatement(sql9);
   	 			      int result6 = pstatement6.executeUpdate();
					  
					  String sql10 = "DELETE FROM `sections` WHERE `user_id` = 79";  
   	        	      PreparedStatement pstatement9;
   	        	      pstatement9 = connection.prepareStatement(sql10);
   	 			      int result10 = pstatement9.executeUpdate();
					  
					  
					  
					  
					  System.out.println("--1--"+result7);
				   
				  }
				 //auto_test_user
				 
				 if(user_id >= 109 && user_id <= 118) {
					 
					 int cur_sec=0;
					 int act_sec=0;
					 if(user_id==109) {
						 
						  cur_sec=1;
						  act_sec=1; 
						 
					 }else if(user_id==110) {
						 
						 cur_sec=2;
						  act_sec=2; 
					 }else if(user_id==111) {
						 
						 cur_sec=3;
						  act_sec=3; 
					 }else if(user_id==112) {
						 
						 cur_sec=4;
						  act_sec=4; 
					 }else if(user_id==113) {
						 
						 cur_sec=5;
						  act_sec=5; 
					 }else if(user_id==114) {
						 
						 cur_sec=6;
						  act_sec=6; 
					 }else if(user_id==115) {
						 
						 cur_sec=7;
						  act_sec=7; 
					 }else if(user_id==116) {
						 
						 cur_sec=8;
						  act_sec=8; 
					 }else if(user_id==117) {
						 
						 cur_sec=9;
						  act_sec=9; 
					 }else if(user_id==118) {
						 
						  cur_sec=10;
						  act_sec=10; 
					 }
					 
					 
					 String sql7 = "UPDATE `stats` SET `activeSubSection` = 0,`currentSection` = ?,`noOfSectionsCompleted` = 0,`noOfExercisesCompleted` = 0,`noOfSubSectionsCompleted` = 0,`activeSection` = ?,`currentSubSection`= 0 WHERE `user_id` = ?";  
		     	      PreparedStatement pstatement7;
		     	      pstatement7 = connection.prepareStatement(sql7);
		     	      pstatement7.setInt(1, cur_sec);
		     	     pstatement7.setInt(2, act_sec);
		     	      pstatement7.setInt(3, user_id);
					  int result7 = pstatement7.executeUpdate();
					  
					  
					  String sql8 = "DELETE FROM `depressed_res` WHERE `user_id` = ?";  
  	        	      PreparedStatement pstatement8;
  	        	      pstatement8 = connection.prepareStatement(sql8);
  	        	      pstatement8.setInt(1, user_id);
  	 			      int result8 = pstatement8.executeUpdate();
					  
					  String sql9 = "DELETE FROM `section_feedback` WHERE `users_id` = ?";  
  	        	      PreparedStatement pstatement6;
  	        	      pstatement6 = connection.prepareStatement(sql9);
  	        	      pstatement6.setInt(1, user_id);
  	 			      int result6 = pstatement6.executeUpdate();
					  
					  String sql10 = "DELETE FROM `sections` WHERE `user_id` = ?";  
  	        	      PreparedStatement pstatement9;
  	        	      pstatement9 = connection.prepareStatement(sql10);
  	        	      pstatement9.setInt(1, user_id);
  	 			      int result10 = pstatement9.executeUpdate();
					   	
					 
				 }
				 
				 
				//newTestUser END	
				
				
				
				System.out.println("self_reg_status  "+self_reg_status+"--self_registration "+self_registration);
				if ((user_id != 0) && (mode.equals("active"))) { // only for non-admin
					
					// System.out.println("its working " + user_id);
					  setUser_activeStatus(user_id);
					
					java.util.Date date = new java.util.Date();
					Timestamp timstamp = new Timestamp(date.getTime());

					// int us_id= getPrimayId(id);

					int stats_id1 = 0;

					PreparedStatement pstatement1;
					String sql1 = "SELECT `stats_id` FROM `stats` WHERE `user_id`= ?";
					pstatement1 = connection.prepareStatement(sql1);
					pstatement1.setInt(1, user_id);
					ResultSet result = pstatement1.executeQuery();

					while (result.next()) {
						stats_id1 = result.getInt("stats_id");
					}

					System.out.println("insert logintime and update sessiontatsTable  _ " + stats_id1);
					
					String sql2 = "INSERT INTO `sessionstats` (`stats_id`, `users_id`, `loginTime`, `timeSpent`, `smiley`,`app_type`) VALUES (?,?,?,?,?,?)";

					PreparedStatement pstatement2;
					pstatement2 = connection.prepareStatement(sql2);
					pstatement2.setInt(1, stats_id1);
					pstatement2.setInt(2, user_id);
					pstatement2.setTimestamp(3, timstamp);
					pstatement2.setString(4, "");
					pstatement2.setString(5, "");
					if(app_type.equals("Desktop Browser")) {
						
						pstatement2.setInt(6, 1);
						
					}else if(app_type.equals("Mobile Browser")){
						
						pstatement2.setInt(6, 2);
						
					}else if(app_type.equals("MobileApp")) {
						
						pstatement2.setInt(6, 3);
						
					}else {
						
						pstatement2.setInt(6, 4);//could't find any app type
						
					}
					
					
					pstatement2.executeUpdate();
					
					//email_reminderNotification UPDATE here
					  String sql4 = "UPDATE `stats` SET `email_remindersNeeded` = '0' WHERE `user_id` = ?";  
   	        	      PreparedStatement pstatement4;
   	        	      pstatement4 = connection.prepareStatement(sql4);
   	        	      pstatement4.setInt(1, user_id);
   	        	      //pstatement4.setInt(1, user_id);
   	 			      int result4 = pstatement4.executeUpdate();
					
						if((self_registration.equals("true")) && (self_reg_status == 0)) {
							
							response.setId("not@@##" + user_id);
							
						}else {
							response.setId("ok@@##" + user_id);
						}
					
					// updateLastActivity1();
				}else if(user_id == 0 &&mode.equals("active")) {
					
					response.setId("0");
					
				}else {
					
					response.setId("inactiveUser");
					
				}
				

			} else {

				response.setId("invalid");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return response;
		
	}

	public LoginResponse adminLogin(String name, String password, String app_type) throws SQLException, NoSuchAlgorithmException, InvalidKeySpecException {
		
		/*System.out.print("admin11111-----1");
		String newName = UserSecurityService.encrypt(name);
		String salt="";
		String sql5 = "SELECT `key_1` FROM `users` WHERE `name`= ?";
		PreparedStatement pstatement5;
		pstatement5 = connection.prepareStatement(sql5);
		pstatement5.setString(1, newName);
		ResultSet result5 = pstatement5.executeQuery();
			if (result5.next()) {
				salt = result5.getString("key_1");	
			}
		
		
		String hashedPwd = UserSecurityService.pwdHash(password, salt);*/
		
		LoginResponse result = login(name, password, app_type);
		String id = result.getId();
		System.out.print("admin"+id);

		if (!(id.equals("invalid"))) {
			if (id.equals(result.getAdminId())) {
				System.out.print("admin11"+id);
				ReminderService.startService(); // we shoudl do this with a
												// script at start time
			} else {
				result.setId("invalid");
			}
		}
		return result;
	}
	

	public void logout(int userId) {

		// ***
		// update in db
		// updateLastActivity(userObject);
		
		Date date= new Date();
		long time = date.getTime();
		Timestamp ts = new Timestamp(time);
		
		System.out.println("sessionstats logout time" + ts);
		try {
			int sessionStats_id1 = 0;
			String sql = "SELECT MAX(`sessionStats_id`) as `sessionStats_id` FROM `sessionstats` WHERE `users_id`=?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, userId);
			ResultSet result = pstatement.executeQuery();
			while (result.next()) {
				sessionStats_id1 = result.getInt("sessionStats_id");
			}

			
			String sql1 = "UPDATE `sessionstats` SET `logoutTime` = ? WHERE `sessionstats`.`sessionStats_id` = ?";
			System.out.println(sql1);
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setTimestamp(1, ts);
			pstatement1.setInt(2, sessionStats_id1);

			pstatement1.executeUpdate();
			
			updateLastActivity(userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// User overall details and stats

	public User getUserStats(String userId) {
		// What all stats should be returned??

		User user = new User();
		try {

			// Object obj = parser.parse(new FileReader(PATH + userId +
			// "/stats.json"));
			// JSONObject jsonObject = (JSONObject) obj;

			String sql = "SELECT `noOfSectionsCompleted`,`noOfExercisesCompleted`,`userCreationTime` FROM `stats` WHERE `user_id`=?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, Integer.parseInt(userId));
			ResultSet result1 = pstatement.executeQuery();

			// String review = "";
			if (result1.next()) {

				user.setSectionsCompleted(result1.getInt("noOfSectionsCompleted"));
				user.setExercisesCompleted(result1.getInt("noOfExercisesCompleted"));
				//user.setUserCreationTime(Integer.toString(result1.getInt("userCreationTime")));
				user.setUserCreationTime(result1.getString("userCreationTime"));

			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}

	public void setUserStats(User user) {

		try {
			String sql1 = "SELECT `noOfSectionsCompleted`,`noOfExercisesCompleted` FROM `stats` WHERE `user_id`=?";
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);	
			pstatement1.setInt(1, user.getId());
			ResultSet result = pstatement1.executeQuery();
			while(result.next()){	
			
				user.setSectionsCompleted(result.getInt("noOfSectionsCompleted"));     
				user.setExercisesCompleted(result.getInt("noOfExercisesCompleted"));
				
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
	}

	// User Info updates

	public void setPassword(int userId, String value) {
		// ***
		// write to db
		try {
			
			//passwordEncy
			String salt = UserSecurityService.getNewSalt();
			String hashedPwd = UserSecurityService.pwdHash(value, salt);
			
			PreparedStatement pstatement3;
			//String sql3  = "UPDATE `stats` SET `activeSection` = ?,`activeSubSection` =? WHERE `user_id`=?";
			String sql3  = "UPDATE `users` SET `password` = ? ,`key_1`= ? WHERE `users`.`users_id` = ?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setString(1, hashedPwd);
			pstatement3.setString(2, salt);
			//pstatement3.setString(2, value);
			pstatement3.setInt(3, userId);
			pstatement3.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setNextSession(int userId, String nextDate, String nextTime) {

		

		StringTokenizer strTok = new StringTokenizer(nextTime, " : ");
		int h = Integer.parseInt(strTok.nextToken());
		String m = strTok.nextToken();
		String a = strTok.nextToken();
		
		nextTime = h + ":" + m + " " + a;

		try {
			
			System.out.println("we are updatimg nextSession value here"+ nextDate + " " + nextTime);
			PreparedStatement pstatement3;
			String sql3  = "UPDATE `stats` SET `nextSession` = ?,`remindersNeeded` =? WHERE `user_id`=?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setString(1, "" + nextDate + " " + nextTime);
			pstatement3.setInt(2, 2);
			pstatement3.setInt(3, userId);
			int result3 = pstatement3.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void saveResponse(int user_id,int screener_flag, String responce) {
		 
		 try {
		  System.out.println("checking userid"+user_id);
		  PreparedStatement pstatement1;
		  String sql1 = "INSERT INTO `depressed_res` (`responce`,`user_id`,`screener_flag`) VALUES (?,?,?);";
		  System.out.println("checking nnn userid"+user_id);
		  pstatement1 = connection.prepareStatement(sql1);
		  //pstatement1.setInt(1,userId);
		  pstatement1.setString(1,responce);
		  pstatement1.setInt(2,user_id);
		  pstatement1.setInt(3,screener_flag);
		  int result1 = pstatement1.executeUpdate();
		  //UPDATE `users` SET `screener_flag`= 2 WHERE `users_id`=?
		  PreparedStatement pstatement3;
		  String sql3  = "UPDATE `users` SET `screener_flag`= ? WHERE `users_id`=?";
		  pstatement3 = connection.prepareStatement(sql3);
		  pstatement3.setInt(1,screener_flag);
		  pstatement3.setInt(2, user_id);
		  int result3 = pstatement3.executeUpdate();
		 
		 
		 } catch (Exception e) {
		  e.printStackTrace();
		 }
		 
		}

	public File getResponseFile() {
		File file = new File(PATH + "response.csv");
		return file;
	}

	public void setFeedback(int userId, int sectionId, int subsectionId, String feedback) {

		// ***
		// Should be written to the db <userId, sectionId, subsectionId,
		// feedback>

		/*
		 * try { String path = PATH + userId + "/sections/section" + sectionId +
		 * "/subsection" + subsectionId + "/feedback.json"; //JSONObject
		 * jsObject = (JSONObject) new JSONParser().parse(new FileReader(path));
		 * 
		 * JSONObject jsObject = JSONFile.readJSON(path);
		 * 
		 * jsObject.put("feedback", feedback); FileWriter file = new
		 * FileWriter(path); file.write(jsObject.toJSONString());
		 * //System.out.println("Successfully Copied JSON Object to File...");
		 * //System.out.println("\nJSON Object: " + jsObject); file.close(); }
		 * catch (Exception e) { e.printStackTrace(); }
		 */
	}

	public User getFeedback(int userId, int sectionId, int subsectionId) {

		return null;

		// ***

		// should just retrieve it from the db

		/*
		 * User link = new User(); try { //obj = parser.parse(new
		 * FileReader(Path.USER_PATH + userId + "/sections/section" + sectionId
		 * + "/subsection" // + subsectionId + "/feedback.json")); // JSONObject
		 * jsonobject = (JSONObject) obj;
		 * 
		 * JSONObject jsonobject = JSONFile.readJSON(Path.USER_PATH + userId +
		 * "/sections/section" + sectionId + "/subsection" + subsectionId +
		 * "/feedback.json"); feedback = (String) jsonobject.get("feedback");
		 * link.setFname(feedback); } catch (Exception e) { e.printStackTrace();
		 * }
		 * 
		 * return link;
		 */

	}

	public void addfeedback(int userId, String value) {
		// **
		// add to db

		try {
			System.out.println("calling fun name is addfeedback");
			PreparedStatement pstatement3;
			String sql3  = "UPDATE `stats` SET `feedbacks`=? WHERE `user_id`=?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setString(1, value);
			//pstatement3.setString(2, 2);
			pstatement3.setInt(2, userId);
			int result3 = pstatement3.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User getSummary(int userId, int sectionId) throws SQLException {
		// ***
		// get from db
		
		//need to write
		String Summary = ""; 
		String review = "";
		User link = new User();
		
		String sql1 = "SELECT `review`,`summary` FROM `section_feedback` WHERE `users_id`=? and `section_id`= ?";
		PreparedStatement pstatement1;
		pstatement1 = connection.prepareStatement(sql1);	
		pstatement1.setInt(1, userId);
		pstatement1.setInt(2, sectionId);
		ResultSet result = pstatement1.executeQuery();
		while(result.next()){	
		
			Summary=result.getString("summary");
			review=result.getString("review");
			link.setFname(Summary);					
			link.setName(review);
		}
		
		
		return link;
		
	}

	public List<User> getAllSummary(int userId) throws SQLException {
		User user = new User();
		ArrayList<User> summary = new ArrayList<User>();
		for (int i = 1; i < 11; i++) {
			user = getSummary(userId, i);
			summary.add(user);
		}
		return summary;
	}

	public void setStatus(int userId, String value) {
		
		System.out.println("value------"+value);
		try {
			// JSONObject jsObject = (JSONObject) new JSONParser()
			// .parse(new FileReader(Path.USER_PATH + userId + "/stats.json"));
			String sql = "SELECT * FROM `stats` WHERE `user_id`=?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, userId);
			ResultSet result1 = pstatement.executeQuery();
			if (result1.next()) {
				int sid = result1.getInt("currentSection");
				int ssid = result1.getInt("currentSubSection");
				int asid = result1.getInt("activeSection");
				int assid = result1.getInt("activeSubSection");
				if (sid == asid && ssid == assid) {

					PreparedStatement pstatement2;
					String sql2 = "UPDATE `stats` SET `status`= ? WHERE `user_id`=?";
					pstatement2 = connection.prepareStatement(sql2);
					pstatement2.setString(1, value);
					pstatement2.setInt(2, userId);

					pstatement2.executeUpdate();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void setFlag(int userId, String value) {
        try {
			
			PreparedStatement pstatement3;
			String sql3  = "UPDATE `users` SET `flag` = ? WHERE `users_id`= ?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setString(1, value);
			//pstatement3.setString(2, value);
			pstatement3.setInt(2, userId);
			int result3 = pstatement3.executeUpdate();
			
			System.out.println("it came to setFlag  1133-"+value);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void setSmiley(int userId, String value) {
		try {
			int sessionStats_id1 = 0;
			String sql = "SELECT MAX(`sessionStats_id`) as `sessionStats_id` FROM `sessionstats` WHERE `users_id`=?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, userId);
			ResultSet result = pstatement.executeQuery();
			while (result.next()) {
				sessionStats_id1 = result.getInt("sessionStats_id");
			}

			System.out.println("sessionstats" + value);
			String sql1 = "UPDATE `sessionstats` SET `smiley` = ? WHERE `sessionstats`.`sessionStats_id` = ?";
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setString(1, value);
			pstatement1.setInt(2, sessionStats_id1);

			pstatement1.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addnote(int userId, String value) {
		try {
			
			PreparedStatement pstatement3;
			String sql3  = "UPDATE `stats` SET `notes` = ?,`activeSubSection` =? WHERE `user_id`=?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setString(1, value);
			//pstatement3.setString(2, value);
			pstatement3.setInt(2, userId);
			int result3 = pstatement3.executeUpdate();
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setMode(int userId, String value) {

		 // ***
		// add to db
		if(value.equals("INACTIVE")) {
			
			try {
				
				PreparedStatement pstatement3;
				String sql3  = "UPDATE `doctor` SET `mode` = ? WHERE `doctor_id`= ?";
				pstatement3 = connection.prepareStatement(sql3);
				pstatement3.setString(1, value);
				pstatement3.setInt(2, userId);
				int result3 = pstatement3.executeUpdate();
				
				

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(value.equals("ACTIVE")){
			
		try {
				
				PreparedStatement pstatement3;
				String sql3  = "UPDATE `doctor` SET `mode` = ? WHERE `doctor_id`= ?";
				pstatement3 = connection.prepareStatement(sql3);
				pstatement3.setString(1, value);
				pstatement3.setInt(2, userId);
				int result3 = pstatement3.executeUpdate();
				
				

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
		Date date= new Date();
		long time = date.getTime();
		Timestamp ts = new Timestamp(time);

		try {
			
			PreparedStatement pstatement3;
			String sql3  = "UPDATE `users` SET `mode` = ? WHERE `users_id`= ?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setString(1, value);
			//pstatement3.setString(2, value);
			pstatement3.setInt(2, userId);
			int result3 = pstatement3.executeUpdate();
			
			if(value.equals("active")) {
				
				PreparedStatement pstatement4;
				String sql4  = "UPDATE `stats` SET `userCreationTime` = ? WHERE `user_id` = ?";
				pstatement4 = connection.prepareStatement(sql4);
				pstatement4.setTimestamp(1, ts);
				pstatement4.setInt(2, userId);
				int result4 = pstatement4.executeUpdate();
				
			}
			
			 
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	}

	public void setAgreed(String userId) {

		
		try {
			
			PreparedStatement pstatement1;
			String sql1 = "UPDATE `user_info` SET `agreed` = ? WHERE `user_id`=?";
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setString(1, "true");
			pstatement1.setInt(2, Integer.parseInt(userId));
			int result1 = pstatement1.executeUpdate();

			System.out.println("set aggred true first time for user" + result1);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public static void updateLastActivity1(int userId) {
		// updates the latest session with the current time as time of last
		// activity
		try {
			
			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Date currentTime = new Date();
			Date date= new Date();
			long time = date.getTime();
			Timestamp ts = new Timestamp(time);
			
			
			String sql1 = "SELECT `sessionStats_id`,`loginTime` FROM `sessionstats` WHERE `users_id`=? ORDER BY `sessionStats_id` DESC LIMIT 0,1";
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);	
			pstatement1.setInt(1, userId);
			ResultSet result = pstatement1.executeQuery();
			while(result.next()){	
				
				Date logInTime = result.getDate("loginTime");
				long diff = currentTime.getTime() - logInTime.getTime();// as given
				long minutes = TimeUnit.MILLISECONDS.toMinutes(diff);
				long hours = TimeUnit.MILLISECONDS.toHours(diff);
				
				PreparedStatement pstatement3;
				String sql3  = "UPDATE `sessionstats` SET `lastActivity`= ?, timeSpent = ? WHERE `sessionStats_id`=?";
				pstatement3 = connection.prepareStatement(sql3);
				pstatement3.setTimestamp(1, ts);
				pstatement3.setString(2, hours + " hrs " + (minutes - (hours * 60)) + " mins");
				pstatement3.setInt(3, result.getInt("sessionStats_id"));
				int result3 = pstatement3.executeUpdate();
				    					
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
//new last activity code which has minimized on 20th june 2019
	
	public static void updateLastActivity(int userId) {
		try {
			
			Date date= new Date();
			long time = date.getTime();
			Timestamp ts = new Timestamp(time);
			String sql1 = "SELECT `sessionStats_id`,`loginTime` FROM `sessionstats` WHERE `users_id`=? ORDER BY `sessionStats_id` DESC LIMIT 0,1";
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);	
			pstatement1.setInt(1, userId);
			ResultSet result = pstatement1.executeQuery();
			while(result.next()){
				
				PreparedStatement pstatement3;
				String sql3  = "UPDATE `sessionstats` SET `lastActivity`= ? WHERE `sessionStats_id`=?";
				pstatement3 = connection.prepareStatement(sql3);
				pstatement3.setTimestamp(1, ts);
				pstatement3.setInt(2, result.getInt("sessionStats_id"));
				int result3 = pstatement3.executeUpdate();
				    		
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	

	public int verfiyEmail(String email) throws ParseException, UnsupportedEncodingException {
		System.out.println("hello its working123456");

		ReminderService reminderService = new ReminderService();

		// JSONObject fpass = (JSONObject) new JSONParser().parse(email);

		String m_to = email;

		// String email1 = BaseEncoding.base64().encode(m_to.getBytes("UTF-8"));

		String email1 = UserSecurityService.encrypt(email);
		//System.out.println("decrypt"+UserSecurityService.decrypt(newEmail));

		String query = "select users_id from users where email='" + email1 + "';";
		int id = 0;
		// Statement pstatement;

		try {
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(query);
			// pstatement.setString(1, sectionId);
			ResultSet rs = pstatement.executeQuery();

			while (rs.next()) {

				id = rs.getInt("users_id");
			}
			////System.out.println("aaaaa" + id);
			if (id == 0) {
				//System.out.println("aaaaa111" + id);
				String m_subject = "Registration for Push-D App";
				//String emaillink = "\n<a href='wellbeing.flourish.nimhans@gmail.com'>wellbeing.flourish.nimhans@gmail.com</a>";
				String emaillink = "\n<a href='Push.d.nimhans@gmail.com'>Push.d.nimhans@gmail.com</a>";
				String encoded = new String(Base64.getEncoder().encode(m_to.getBytes()));
				// String encoded = email;
				String m_text = "<div>Hello,</div><div>You have initiated registration  process for Nimhans Push-D App.</div><div>Please click on the  link to  complete registration.<br></div><br>"
						+ "<a href= '" + PATH_Signup + "signup2.html?email=" + encoded + "'> " + PATH_Signup
						+ "signup2.html?email=" + encoded + "</a>"
						+ "<br><div><br>Thanks,</div><div>Push-D App team<br></div><div><br>Please do not 'REPLY' directly to this email. If you have any query, send  an email to "
						+ emaillink + "</div>";
				// String m_text = "some text";

				 reminderService.sendEmail(email, m_subject, m_text);
				
				//reminderService.sendEmail_nimhans(email, m_subject, m_text);
				
				return id;
			} else {
         // System.out.println("email already exits");
				return id;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return id;
	}

	private ResultSet executeDbQuery(String cmd) {

		try {
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(cmd);
			ResultSet result = pstatement.executeQuery();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	
	
	//pushdNotes
		public int setPushdNotes(String data,int userId) {

			int result1 = 0;
			try {
				
				PreparedStatement pstatement1;
				String sql1 = "INSERT INTO `pushd_notes` (`users_id`, `notes`,`read_flag`) VALUES (?,?,?);";
				pstatement1 = connection.prepareStatement(sql1);
				pstatement1.setInt(1,userId);
				pstatement1.setString(2,data);
				pstatement1.setInt(3,1);
				result1 = pstatement1.executeUpdate();
				
				System.out.println("pushdNotes post "+userId+"-----"+data);

				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result1;
		}
	
	
		public ArrayList<PushdNotes> getPushdNotes(int userId) {

			//int result1 = 0;
			//PushdNotes pushdNotes = new PushdNotes();
			ArrayList<PushdNotes> pushdNotes = new ArrayList<PushdNotes>();
			
			try {
				
				PreparedStatement pstatement1;
				String sql1 = "SELECT * FROM `pushd_notes` WHERE `users_id`=?";
				pstatement1 = connection.prepareStatement(sql1);
				pstatement1.setInt(1,userId);
				ResultSet result1 = pstatement1.executeQuery();
				while (result1.next()) {

					PushdNotes pushdNotes1 = new PushdNotes();
					
					pushdNotes1.setTime(result1.getTimestamp("created_at"));
					pushdNotes1.setUser_id(result1.getInt("users_id"));
					pushdNotes1.setNotes(result1.getString("notes"));
					

					pushdNotes.add(pushdNotes1);
					
				   
				}
				
				  System.out.println(pushdNotes);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return pushdNotes;
		}
	
		
		
		
	public User setUser_reg_Info(int form_id,User user) {
			try {
		
				//here we are checking user_reg_form data if already exits or not to remove from database and insert new data
				if(form_id == 1) {
					String sql5 = "SELECT * FROM `user_reg_info` WHERE `user_id`=?";
					PreparedStatement pstatement5;
					pstatement5 = connection.prepareStatement(sql5);
					pstatement5.setInt(1, user.getId());
					ResultSet result5 = pstatement5.executeQuery();
					if(result5.next()) {
						
					//deleted incomplete reg data
							String sql6="DELETE FROM `user_reg_info` WHERE `user_id`=?";
							PreparedStatement pstatement6;
							pstatement6 = connection.prepareStatement(sql6);
							pstatement6.setInt(1, user.getId());
							boolean result6 = pstatement6.execute();
							
					//deleted stat data DELETE FROM `stats` WHERE `user_id`=9976
							String sql7="DELETE FROM `stats` WHERE `user_id`=?";
							PreparedStatement pstatement7;
							pstatement7 = connection.prepareStatement(sql7);
							pstatement7.setInt(1, user.getId());
							boolean result7 = pstatement7.execute();
							
					}
				}
				
			if(form_id == 1) {
			 PreparedStatement pstatement1; 
			  String sql1 = "INSERT INTO `user_info` (`user_id`, `checkpoint`, `fname`, `livingArrangement`, `education`, `gender`, `mobileNumber`, `significantOther`, `age`, `maritalStatus`, `agreed`) VALUES (?,?,?,?,?,?,?,?,?,?,?)"; 
			  pstatement1 = connection.prepareStatement(sql1);
			  pstatement1.setInt(1, user.getId()); 
			  pstatement1.setString(2,"false"); 
			  pstatement1.setString(3, user.getFname());
			  pstatement1.setString(4, user.getLivingArrangement());
			  pstatement1.setString(5, user.getEducation());
			  pstatement1.setString(6, user.getGender());
			  String mobNum = UserSecurityService.encrypt(user.getMobileNumber());
			  pstatement1.setString(7, mobNum);
			//  pstatement1.setString(8, user.getMailId());
			  pstatement1.setString(8, user.getSignificantOther());
			  pstatement1.setInt(9, Integer.parseInt(user.getAge()));
			  pstatement1.setString(10, user.getMaritalStatus());
			  pstatement1.setString(11, "false"); 
			  int result1 = pstatement1.executeUpdate();
			  
			  
			  System.out.println("Second table user_INFO " + result1);
			 

			// states entry for user first time
			int result2 = 0;
			PreparedStatement pstatement2;
			String sql2 = "INSERT INTO `stats` (`user_id`, `activeSubSection`, `noOfExercisesCompleted`, `prSectionId`, `currentSection`, `noOfSectionsCompleted`, `remindersNeeded`, `currentSubSection`, `noOfSubSectionsCompleted`, `noOfTimesLoggedIn`, `activeSection`, `status`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			pstatement2 = connection.prepareStatement(sql2);
			pstatement2.setInt(1, user.getId());
			pstatement2.setInt(2, 0);
			pstatement2.setInt(3, 0);
			pstatement2.setInt(4, 0);
			pstatement2.setInt(5, 0);
			pstatement2.setInt(6, 0);
			pstatement2.setInt(7, 0);
			pstatement2.setInt(8, 0);
			pstatement2.setInt(9, 0);
			pstatement2.setInt(10, 0);
			pstatement2.setInt(11, 0);
			pstatement2.setString(12, "true");

			result2 = pstatement2.executeUpdate();
			}
			
			int result3 = 0;
			PreparedStatement pstatement3;
			String sql3 = "INSERT INTO `user_reg_info` (`user_id`, `reg_form_num`, `response`) VALUES (?,?,?);";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setInt(1, user.getId());
			pstatement3.setInt(2, form_id);
			pstatement3.setString(3, user.getReginfo());
			result3 = pstatement3.executeUpdate();
			if(form_id == 4) {
				int result4 = 0;
				PreparedStatement pstatement4;
			    String sql4 ="UPDATE `users` SET `reg_form_status` = '1' WHERE `users_id` = ?";
			    pstatement4 = connection.prepareStatement(sql4);
				pstatement4.setInt(1, user.getId());
				result4 = pstatement4.executeUpdate();
				
			}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
				
			return user;
		}
	
	//checking user registration time for make it active/inactive
	@SuppressWarnings("deprecation")
	public int setUser_activeStatus(int user_id) {
		 int diffdays = 0;
		try {
			
			 //currentTime
			 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
			 LocalDateTime now1 = LocalDateTime.now();  
    
			String sql1 = "SELECT `userCreationTime` FROM `stats` WHERE `user_id` = ?";
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);	
			pstatement1.setInt(1, user_id);
			ResultSet result = pstatement1.executeQuery();
			String	userCreationTime = null;
			 int year1 = 0;
			 int month1 = 0;
			 int day1 = 0;
			
			while(result.next()){	
			
			  userCreationTime=result.getString("userCreationTime");
			  //2018-10-05 12:39:55
			
			 
			  String[] str1= userCreationTime.split("-");
			  String[] str2= str1[2].split(" ");
			  year1= Integer.parseInt(str1[0]);
			  month1=Integer.parseInt(str1[1]);
			  day1=Integer.parseInt(str2[0]);
			 
			}
			
			LocalDate endofCentury = LocalDate.of(year1,month1,day1);
			LocalDate now = LocalDate.now();
			 
			Period diff = Period.between(endofCentury, now);
			diffdays = diff.getDays();
			System.out.printf("Difference is %d years, %d months and %d days old",
			                    diff.getYears(), diff.getMonths(), diff.getDays());
			if((diff.getDays() > 14) && (diff.getDays() < 60) ) {
				
			    System.out.println("This user hasbeen register on 14 > dat < 60: "+diff.getDays());	
			    //have to show Screener
			   // return 1;
			  
			}else if((diff.getMonths() == 2) && (diff.getDays() > 1) ){
				//have to inactive user here
				
				System.out.println("this user---- is inactive"+user_id);
				
				setMode(user_id, "Inactive");
				
			}
			
			
			/*else if((diff.getMonths() == 2) && (diff.getDays() > 1)) {
				
				System.out.println("this user has to re-register");
				
                  try {
					
					PreparedStatement pstatement2;
					String sql2 = "UPDATE `users` SET `password` = ? WHERE users_id = ?";
					pstatement2 = connection.prepareStatement(sql1);
					//pstatement2.setString(1,password);
					pstatement2.setInt(2,user_id);
					int result1 = pstatement2.executeUpdate();
					
					System.out.println("this user has to re-register "+result1);

					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}*/
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return diffdays;	
	}
	
	//forgot passowrd service method
	public int forgotPassword(String email) throws ParseException, UnsupportedEncodingException {

       // JSONObject fpass = (JSONObject) new JSONParser().parse(forgot);
        ReminderService reminderService = new ReminderService();

       // String m_to = (String) fpass.get("email");
        String m_to = UserSecurityService.encrypt(email);
        
       // String email1 = BaseEncoding.base64().encode(m_to.getBytes("UTF-8"));
        String email1 = email;

        String query = "select users_id,name from users where email='" + m_to + "';";
        int id = 0;
        String uname = null;
        PreparedStatement pstatement2;
        try {

          //  stmt = conn.createStatement();
            pstatement2 = connection.prepareStatement(query);
            ResultSet rs = pstatement2.executeQuery(query);
            while (rs.next()) {

                id = rs.getInt("users_id");
                
                uname = UserSecurityService.decrypt(rs.getString("name"));
            }
            System.out.println("uname=" + uname);
            if (id == 0) {

                return id;
            } else {
              //  byte[] uname1 = BaseEncoding.base64().decode(uname);
                String m_subject = "Reset password - Pushd App";
                //String emaillink = "\n<a href='wellbeing.flourish.nimhans@gmail.com'>wellbeing.flourish.nimhans@gmail.com</a>";
                String emaillink = "\n<a href='Push.d.nimhans@gmail.com'>Push.d.nimhans@gmail.com</a>";
                String encoded = new String(Base64.getEncoder().encode(email1.getBytes()));
                //String encoded = m_to;
                String m_text = "<div>Hi\n" +uname
                        + ",</div><div>You recently requested to reset your password for Pushd App account. Click on the link  below to reset it.<br> This password reset is only valid for next 24 hours. </div><br>"
                        + "<a href= '" + PATH_Signup + "forgot.html?email=@"+encoded+"'> " + PATH_Signup
                        + "/web/forgot.html?email="+encoded+"</a>"
                        + "<br><div><br>Thanks,</div><div>Push-D team<br></div><div><br>Please do not 'REPLY' directly to this email. If you have any query, send  an email to "
                        + emaillink + "</div>";

                reminderService.sendEmail(email1, m_subject, m_text);
                return id;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return id;

    }
	
	
	
//updatePassword
public int updatepassword(String email1,String password) {
               String email = UserSecurityService.encrypt(email1);
				int result1 = 0;
				try {
					//passwordEncy
					String salt = UserSecurityService.getNewSalt();
					String hashedPwd = UserSecurityService.pwdHash(password, salt);
					
					PreparedStatement pstatement1;
					String sql1 = "UPDATE `users` SET `password` = ?,`key_1` = ? WHERE email = ?";
					pstatement1 = connection.prepareStatement(sql1);
					pstatement1.setString(1,hashedPwd);
					pstatement1.setString(2,salt);
					pstatement1.setString(3,email);
					result1 = pstatement1.executeUpdate();
					
					System.out.println("updatepassword 1655 post "+email+"-----"+hashedPwd);

					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return result1;
	}


public int getScreenStatusService(int userid) {
	
	int screener_flag = 0;
	
	try {
		
		PreparedStatement pstatement1;
		String sql1 = "SELECT `screener_flag` FROM `users` WHERE `users_id`="+userid;
		pstatement1 = connection.prepareStatement(sql1);
		System.out.println("getScreenStatusService "+sql1);
		//pstatement1.setInt(1,userid);
        ResultSet rs = pstatement1.executeQuery(sql1); //9987
        
        while(rs.next()) {
        	
            
        	screener_flag=rs.getInt("screener_flag");	
        	System.out.println("getScreenStatusService 1655 post "+screener_flag);
        }
			
	} catch (Exception e) {
		e.printStackTrace();
	}
	return screener_flag;
}


//site visits
public int getSitevisits(int usage_stats_id,int ned) {
	
	int screener_flag = 0;
	String sql1 = "";
	try {
		if(ned==1) {
		 sql1 = "UPDATE `usage_stats` SET `website_visits_count` = `website_visits_count` + 1 WHERE `usage_stats_id` = ?";
		}else {
			
	    sql1 = "UPDATE `usage_stats` SET `registration_request_count` = `registration_request_count` + 1 WHERE `usage_stats_id` = ?";
		}
		System.out.println(sql1);
		PreparedStatement pstatement1;
		pstatement1 = connection.prepareStatement(sql1);
		pstatement1.setInt(1, usage_stats_id);
		pstatement1.executeUpdate();
			
	} catch (Exception e) {
		e.printStackTrace();
	}
	return screener_flag;
}

//next login reminders

public int nextLoginReminder() throws ParseException {
	
	int screener_flag = 0;
	//SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
	
	try {
		String sql = "SELECT * FROM `users` where users_id != 0 ";
		PreparedStatement pstatement;
		pstatement = dbObject.getInstance().Connect().prepareStatement(sql);	
		//pstatement.setInt(1, Integer.parseInt(userId));
		ResultSet result1 = pstatement.executeQuery();
		
		while(result1.next()){	
			 
            //String n =  result1.getString("name");
            String id =  Integer.toString(result1.getInt("users_id"));
            String mode =  result1.getString("mode");	
            String email = UserSecurityService.decrypt(result1.getString("email"));
            System.out.println(id);
            if ((mode != null) && mode.equals("active") && (result1.getInt("users_id") != 0)) {
            	//user_info
            	
            	
            	String sql1 = "SELECT * FROM `stats` where user_id = ?";
        		PreparedStatement pstatement1;
        		pstatement1 = dbObject.getInstance().Connect().prepareStatement(sql1);
        		//if(Integer.parseInt(id) != 0)
        		pstatement1.setInt(1, Integer.parseInt(id));
        		//pstatement.setInt(1, Integer.parseInt(userId));
        		ResultSet result2 = pstatement1.executeQuery();
        		while(result2.next()){	
        			    int currentSection =  result2.getInt("currentSection");
        	            String nextSession =  result2.getString("nextSession");
        	            
        	          
        	            
        	          //if user not suspended session  
        	         if(nextSession != null) {
        	            	
        	            	
        	            
        	            
        	            System.out.println("HHHHHHH((((((--- "+nextSession+"---Integer.parseInt(id)---"+Integer.parseInt(id));
        	            int email_remindersNeeded =  result2.getInt("email_remindersNeeded");
        	            
        	           // DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  29-01-2019 9:00 PM
        	            
        	            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm a");
        	            LocalDateTime now = LocalDateTime.now();  
        	            String date23 = dtf.format(now);
        	            System.out.println(dtf.format(now)); 
        	            Date date = null;
        	          //  String string = "Oct 19, 2017 9:15:12 PM";
        	        	 DateFormat inFormat = new SimpleDateFormat( "dd-MM-yyyy HH:mm a");
        	        	 date = inFormat.parse(nextSession);
        	        	 
        	        	 DateFormat outFormat = new SimpleDateFormat( "dd-MM-yyyy HH:mm a");
        	        	 String myDate = outFormat.format(date);
        	        	 
        	        	 Date date1 = outFormat.parse(myDate);
        	        	 long millis = date1.getTime();
        	        	 
        	        	 Date date11 = outFormat.parse(date23);
        	        	 long millis1 = date11.getTime();
        	        	 
        	        	 long diff = millis1 - millis;
        	        	 
        	        	 long minutes = (diff / 1000) / 60;
        	        	 long hur = minutes/60;
        	        	 
        	        	 System.out.println(hur);
        	        	 
        	        	 if((hur <= 1)  && (email_remindersNeeded == 0) && (currentSection < 11)) {
        	        		 
        	        		// System.out.println("---dif--- "+hur);  
        	        		 
        	        		 String m_subject = "Your PUSH-D plan";
        	                 //String emaillink = "\n<a href='wellbeing.flourish.nimhans@gmail.com'>wellbeing.flourish.nimhans@gmail.com</a>";
        	                
        	                 //String encoded = m_to;
        	                 String m_text = "<div>Dear User\r\n </div>"+ 
        	                 		"<div> This is  a gentle  reminder.\r\n</div>" + 
        	                 		"<div> You have planned  to work on PUSH-D  sections   today   at"+nextSession+"\r\n \r\n</div>" + 
        	                 		"<div> TEAM PUSH-D \r\n</div>" + 
        	                 		"<div>Make  yourself a priority once in a while. It's  not selfish, it's  necessary. Karen A. Baquiran\r\n</div>" + 
        	                 		"<div>(If  you wish  to unsubscribe from  email prompt  service, please send  a  mail to push.d.nimhans@gmail.com . Please mention  in  the  subject  line  \"Unsubscribe  from reminder mails\")</div>";
        	                 
        	                 String m_text1 = "<div>Hi\n" +email+"/n"
        	                         + ",</div><div>Hello! You have scheduled a session for yourself on PUSH-D on "+ nextSession +"</div><br>"
        	                         + "<a href= '" + PATH_Signup + "index.jsp>PUSHD</a>"
        	                         + "<br><div><br>Thanks,</div><div>Push-D team<br></div><div><br>Please do not 'REPLY' directly to this email. If you have any query, send  an email to "
        	                         + "</div>";

        	        	 //  reminderService.sendEmail(email, m_subject, m_text  );
        	        	   System.out.println("email-- "+email+" ---m_subject--- "+m_subject);
        	                 
        	        	  String sql4 = "UPDATE `stats` SET `email_remindersNeeded` = '1' WHERE `user_id` = ?";  
        	        	  PreparedStatement pstatement4;
        	        	  pstatement4 = connection.prepareStatement(sql4);
        	        	  pstatement4.setInt(1, Integer.parseInt(id));
        	 			  int result4 = pstatement4.executeUpdate();
        	 			  
        	        	 	 
        	        	 }else {
        	        		 
        	        		 System.out.println("no reminder required (or) already sent for "+hur);  
        	        	 }
        	        	 
        	         }else {
      	            	
        	        	 System.out.println("This user close app without logout--"+id);
      	            }
     	 			  
        	        	
        	            
        	            //System.out.println("email_remindersNeeded- "+email_remindersNeeded+" nextSession- "+nextSession+" currentSection- "+currentSection);
        	            
        			
        		}
            	
            	
            	
            	
				}
            		
            		
         	
            	
            }
			
	} catch (Exception e) {
		e.printStackTrace();
	}
	return screener_flag;
}


	
//usage stats for admin
public UsageStats usageStats() {
	
	
	UsageStats respoce1=null;
	
	 int website_visits_count = 0;
	 int registration_request_count = 0;
	 int registrated_users = 0;
	 int Noflogins = 0;
	 int NofloginsByDesktop = 0;
	 int NofloginsByMobiBrowser = 0;
	 int NofloginsByApp = 0;
	 int completedAllSections = 0;
	 int NotcompletedAllSections = 0; 
	
   try {
		
	    
	   
		PreparedStatement pstatement1;
		String sql1 = "SELECT * FROM `usage_stats`";
		pstatement1 = connection.prepareStatement(sql1);
		System.out.println("getScreenStatusService "+sql1);
		//pstatement1.setInt(1,userid);
        ResultSet rs = pstatement1.executeQuery(sql1); 
        
       
        while(rs.next()) {
        	
          website_visits_count = rs.getInt("website_visits_count");
   		  registration_request_count = rs.getInt("registration_request_count");
   		 
        }
        
        
        //userCount
        String sql = "SELECT COUNT(`users_id`) as `registrated_users` FROM `users`";
        PreparedStatement pstatement2;
		pstatement2 = connection.prepareStatement(sql);
        ResultSet rs1 = pstatement2.executeQuery(sql); 
        while(rs1.next()) {
        	
        	registrated_users =  rs1.getInt("registrated_users")-1;
        }
        
        String sql4 =" SELECT COUNT(`sessionStats_id`) as Noflogins FROM `sessionstats`";
        PreparedStatement pstatement3;
		pstatement3 = connection.prepareStatement(sql4);
        ResultSet rs2 = pstatement3.executeQuery(sql4); 
        while(rs2.next()) {
        	
        	Noflogins =  rs2.getInt("Noflogins");
        }
        
        String sql5 =" SELECT COUNT(`sessionStats_id`) as NofloginsByDesktop  FROM `sessionstats` WHERE `app_type`= 1";
        PreparedStatement pstatement4;
		pstatement4 = connection.prepareStatement(sql5);
        ResultSet rs3 = pstatement4.executeQuery(sql5); 
        while(rs3.next()) {
        	
        	NofloginsByDesktop =  rs3.getInt("NofloginsByDesktop");
        }
        
        String sql6 =" SELECT COUNT(`sessionStats_id`) as NofloginsByMobiBrowser FROM `sessionstats` WHERE `app_type`= 2";
        PreparedStatement pstatement5;
		pstatement5 = connection.prepareStatement(sql6);
        ResultSet rs4 = pstatement5.executeQuery(sql6); 
        while(rs4.next()) {
        	
        	NofloginsByMobiBrowser =  rs4.getInt("NofloginsByMobiBrowser");
        }
        
        
        String sql7 =" SELECT COUNT(`sessionStats_id`) as NofloginsByApp FROM `sessionstats` WHERE `app_type`= 3";
        PreparedStatement pstatement6;
		pstatement6 = connection.prepareStatement(sql7);
        ResultSet rs5 = pstatement6.executeQuery(sql7); 
        while(rs5.next()) {
        	
        	NofloginsByApp =  rs5.getInt("NofloginsByApp");
        }
        
        
        String sql9 = "SELECT COUNT(`stats_id`) as completedAllSections FROM `stats` WHERE `currentSection` > 11";
        PreparedStatement pstatement7;
		pstatement7 = connection.prepareStatement(sql9);
        ResultSet rs6 = pstatement7.executeQuery(sql9); //9987
        while(rs6.next()) {
        	
        	completedAllSections =  rs6.getInt("completedAllSections");
        }
        
        String sql10 = "SELECT COUNT(`stats_id`) as NotcompletedAllSections FROM `stats` WHERE `currentSection` < 11";
        PreparedStatement pstatement8;
		pstatement8 = connection.prepareStatement(sql10);
        ResultSet rs7 = pstatement8.executeQuery(sql10); //9987
        while(rs7.next()) {
        	
        	NotcompletedAllSections =  rs7.getInt("NotcompletedAllSections");
        }
        
        respoce1	= new UsageStats( website_visits_count,  registration_request_count,  registrated_users,  Noflogins,  NofloginsByDesktop,  NofloginsByMobiBrowser,  NofloginsByApp,  completedAllSections,  NotcompletedAllSections);  
        
        
        
			
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return respoce1;
}

//getSelfRegUserInfo to get self registred users info

public UsageStats getSelfRegUserInfo(int userid) {
	
	
	UsageStats reg_details=null;
	String reg_form1 = "";
	String reg_form2 = "";
	String reg_form3 = "";
	String reg_form4 = "";
	String reg_cmp_time = "";
	
	String scr_date = "";
	String scr_responce = "";
	
	String scr_date1 = "";
	String scr_responce1 = "";
	
	int user_id = 0;
	//UsageStats(String reg_form1,String reg_form2,String reg_form3,String reg_form4)
	try {
		
		PreparedStatement pstatement1;
		String sql1 = "SELECT `user_id`,`reg_form_num`,`created_at`,`response` FROM `user_reg_info` WHERE `user_id`="+userid;
		pstatement1 = connection.prepareStatement(sql1);
        ResultSet rs = pstatement1.executeQuery(sql1); //9987
        
        while(rs.next()) {
        	user_id=rs.getInt("user_id");
        	
        	//screener
        	
        	
        	reg_cmp_time=rs.getString("created_at");
        	if(rs.getInt("reg_form_num")==1) {
        		reg_form1 = rs.getString("response");
        	}else if(rs.getInt("reg_form_num")==2){
        		reg_form2 = rs.getString("response");
        	}else if(rs.getInt("reg_form_num")==3){
        		reg_form3 = rs.getString("response");
        		
        	}else if(rs.getInt("reg_form_num")==4){
        		
        		reg_form4 = rs.getString("response");
        	}
            
        }
        
        PreparedStatement pstatement2;
		String sql2 = "SELECT `responce`,`created_at`,`user_id` FROM `depressed_res` WHERE `user_id`="+userid;
		pstatement2 = connection.prepareStatement(sql2);
        ResultSet rs1 = pstatement2.executeQuery(sql2); //9987
        int r = 0;
        while(rs1.next()) {
        	if(r == 0) {
        		
        		
            	scr_responce = rs1.getString("responce");
        		scr_date = rs1.getString("created_at");
            	System.out.println("rest-00-"+r+" uid--"+userid);
        	}else {
        		scr_responce1 = rs1.getString("responce");
        		scr_date1 = rs1.getString("created_at");
            	System.out.println("rest-11-"+r+" uid--"+userid);
        		
        	}
        	
        	
        	
        	r++;
        	
        }
			
        System.out.println("scr_date1-_"+scr_date1+"  scr_date1--"+scr_date1+"  scr_responce1--"+scr_responce1+"  scr_responce1--"+scr_responce1+" uid--"+userid);
         reg_details =new UsageStats(user_id,reg_form1,reg_form2,reg_form3,reg_form4,reg_cmp_time,scr_date,scr_responce,scr_date1,scr_responce1);
        
	} catch (Exception e) {
		e.printStackTrace();
	}
	return reg_details;
}

public List<UsageStats> getAllSelfRegUserInfo() {
	
	ArrayList<UsageStats> reg_details = new ArrayList<>();
	
	int user_id = 0;
	//UsageStats(String reg_form1,String reg_form2,String reg_form3,String reg_form4)
	try {
		
		PreparedStatement pstatement1;
		//String sql1 = "SELECT `user_id` FROM `user_reg_info` GROUP BY `user_id`";
		String sql1 = "SELECT `user_id` FROM `user_reg_info`  where `reg_form_num` = 4 GROUP BY `user_id`";
		pstatement1 = connection.prepareStatement(sql1);
        ResultSet rs = pstatement1.executeQuery(sql1); //9987
        
        while(rs.next()) {
        	
        	user_id = rs.getInt("user_id");
        	
            
        	  UsageStats reg_details1 = getSelfRegUserInfo(user_id);
        	
        	 reg_details.add(reg_details1);  
        }
			
       System.out.println(reg_details);
        
             
	} catch (Exception e) {
		e.printStackTrace();
	}
	return reg_details;
}

//to check new reminders form pushd Notes
public int pushdStatus(int user_id) {
	int countOfMesg = 0;
	try {
		
		String sql1 = "SELECT COUNT(`read_flag`) as `countMessages` FROM `pushd_notes` WHERE `users_id`=? and read_flag=1";
		PreparedStatement pstatement1;
		pstatement1 = connection.prepareStatement(sql1);	
		pstatement1.setInt(1, user_id);
		ResultSet result = pstatement1.executeQuery();
		if(result.next()){	
		
			countOfMesg=result.getInt("countMessages");
			
		}
	
	} catch (Exception e) {
		e.printStackTrace();
		return 0;
	}
	
	return countOfMesg;
}

//TODO Auto-generated method stub
public void updatepushdNotes(int userId) {
		
	try {
		PreparedStatement pstatement2;
		String sql2 = "UPDATE `pushd_notes` SET `read_flag` = 0 WHERE `users_id` = ?";
		pstatement2 = connection.prepareStatement(sql2);
		pstatement2.setInt(1, userId);
		int result2 = pstatement2.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	
	
	
}

public List<Doctor> getDoctorList() {
	// toGet doctor data
	
   
   ArrayList<Doctor> dr1 = new ArrayList<>();
try {
		
		String sql1 = "SELECT * FROM `doctor`";
		PreparedStatement pstatement1;
		pstatement1 = connection.prepareStatement(sql1);	
		ResultSet result = pstatement1.executeQuery();
		while(result.next()){	
		
			String doctor_name=result.getString("doctor_name");
			String email=result.getString("email");
			int doctor_id=result.getInt("doctor_id");
			String phone=result.getString("phone");
			String mode = result.getString("mode");
			Doctor dr =new Doctor(doctor_id, doctor_name, email, phone, mode);
			
			dr1.add(dr);
			
		}
		
		System.out.println("doctor----"+dr1);
	
	} catch (Exception e) {
		e.printStackTrace();
		//return 0;
	}
	
	
	
	return dr1;
}


public ArrayList<Integer> getUnlockSectonData(int userId) throws SQLException {
	// TODO Auto-generated method stub
	System.out.println("ODO Auto-generated method stub");
	
	ArrayList<Integer> pushdUnlockedSection = new ArrayList<Integer>();
	String sql1 = "SELECT DISTINCT `section_id` as `sec_id` FROM `sections` WHERE `user_id` =?";
	PreparedStatement pstatement1;
	pstatement1 = connection.prepareStatement(sql1);	
	pstatement1.setInt(1, userId);
	ResultSet result = pstatement1.executeQuery();
	//String sec_id="";
	while(result.next()){	
	
		 pushdUnlockedSection.add(result.getInt("sec_id"));
		
		
	}
	//System.out.println("?-?"+pushdUnlockedSection);
	return pushdUnlockedSection;
}

public int getModeOfScreener(int userId) {
	// to get mode of screener
	int getModeOfScreener = 0;
try {
		
		String sql1 = "SELECT `screener_flag` FROM `users` where users_id = ?";
		PreparedStatement pstatement1;
		pstatement1 = connection.prepareStatement(sql1);
		pstatement1.setInt(1, userId);
		ResultSet result = pstatement1.executeQuery();
		if(result.next()){	
		
			getModeOfScreener = result.getInt("screener_flag");
			
		}
		
		
	
	} catch (Exception e) {
		e.printStackTrace();
		//return 0;
	}
	
	
	return getModeOfScreener;
}


//add new doctor
public int createNewDoctor(String doctor_name,String username, String psw, String email,String phone) {
	
	PreparedStatement pstatement;
	java.util.Date date = new java.util.Date();
	Timestamp timstamp = new Timestamp(date.getTime());
	int result = 0;
	
	
	
	String mode = "ACTIVE";
	try {
		String sql = "INSERT INTO `doctor` (`doctor_name`, `doctor_details`, `psw`, `email`,`phone`, `createdAt`,`mode`) VALUES (?,?,?,?,?,?,?)";
		
		pstatement = connection.prepareStatement(sql);
		pstatement.setString(1, doctor_name);
		pstatement.setString(2, username);
		pstatement.setString(3, psw);
		pstatement.setString(4, email);
		pstatement.setString(5, phone);
		pstatement.setTimestamp(6, timstamp);
		pstatement.setString(7, mode);
	    result = pstatement.executeUpdate();
		
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return 0;
	
}

public int doctorLogin(String name, String psw, String app_type) {
	
	// dataBase code
	//ReminderService reminderService = new ReminderService();
	//reminderService.emailWithAttachment();
	//System.out.println("user trying to login in "+app_type);
	
	PreparedStatement pstatement;
	int doctor_id = 0;
	String mode="";
	
	
	
	try {
			
			String sql1 = "SELECT `doctor_id`,`mode` FROM `doctor` where doctor_details = ? and psw=?";
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setString(1, name);
			pstatement1.setString(2, psw);
			ResultSet result = pstatement1.executeQuery();

			  
			if(result.next()){	
			
				
				mode = result.getString("mode");
				if(mode.equals("ACTIVE")) {
					doctor_id = result.getInt("doctor_id");
					
					
				}else {
					doctor_id = -1;
				}
				
				
			}
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
		
	return doctor_id;
	
}
	
}
