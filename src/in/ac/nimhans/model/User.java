package in.ac.nimhans.model;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class User {
	private String mode;
	private String flag;
	private int id;
	private String name;
	private String fname;
	private String gender;
	private String age;
	private String password;
	private String mobileNumber;
	private String agreed;
	private String checkpoint;
	private int currentSection;
	private int sectionsCompleted;
	private int exercisesCompleted;
	private String nextSession;
	private int remindersNeeded;
	private int noOfExercisesCompleted;
	private int currentSubSection;
	private int noOfTimesLoggedIn;
	private int noOfSectionsCompleted;
	private ArrayList<SessionStats> sessionStats;
	private String maritalStatus;
	private String livingArrangement;
	private String education;
	private String significantOther;
	private String mailId;
	private String lastPhoneCall;
	private String nextCallDue;
	private String userCreationTime;
	private ArrayList<String> feedbacks;
	private ArrayList<String> notes;
	private String reginfo;
	private int doctor_id;
	
	public User() {
		
	}
	
	public User(int id, String name, String gender, String age, String flag, String mode, int doctor_id) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.setAge(age);
		this.flag= flag;
		this.mode=mode;
		this.doctor_id=doctor_id;
	}
	
	
	
	public User(int id, String name, String fname, String gender, String age, String agreed, String checkpoint) {
		super();
		this.id = id;
		this.name = name;
		this.fname = fname;
		this.setAgreed(agreed);
		this.setCheckpoint(checkpoint);
		this.gender = gender;
		this.setAge(age);
		this.flag="false";
	}
	
	
	public User(int id, String name, String mailId, String gender, String age, String mobileNumber,String nextSession,int remindersNeeded, int currentSection,
			int  noOfExercisesCompleted,int currentSubSection,int noOfSectionsCompleted,int noOfTimesLoggedIn ,
			ArrayList<SessionStats> sessionStats , String maritalStatus, String livingArrangement,
			String education,String significantOther,String  lastPhoneCall,String nextCallDue, int doctor_id){
		super();
		this.id = id;
		this.name = name;
		this.mailId = mailId;
		this.gender = gender;
		this.setAge(age);
		this.mobileNumber = mobileNumber;
		this.currentSection =currentSection;
		this.nextSession = nextSession;
		this.remindersNeeded = remindersNeeded;
		this.noOfExercisesCompleted = noOfExercisesCompleted;
		this.noOfSectionsCompleted = noOfSectionsCompleted ;
		this.currentSubSection = currentSubSection;
		this.noOfSectionsCompleted = noOfSectionsCompleted;
		this.noOfTimesLoggedIn = noOfTimesLoggedIn;
		this.setSessionStats(sessionStats);
		this.maritalStatus = maritalStatus;
		this.livingArrangement = livingArrangement;
		this.education = education;
		this.significantOther = significantOther;
		//this.mailId = mailId;
		this.lastPhoneCall = lastPhoneCall;
		this.nextCallDue = nextCallDue;
		this.flag="false";
		this.doctor_id=doctor_id;
	}
	
	public User(int id, String name, String gender, String age, String mobileNumber,String nextSession,int remindersNeeded, int currentSection,
			int  noOfExercisesCompleted,int currentSubSection,int noOfSectionsCompleted,int noOfTimesLoggedIn ,
			ArrayList<SessionStats> sessionStats , String maritalStatus, String livingArrangement,
			String education,String significantOther,String  lastPhoneCall,String nextCallDue){
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.setAge(age);
		this.mobileNumber = mobileNumber;
		this.currentSection =currentSection;
		this.nextSession = nextSession;
		this.remindersNeeded = remindersNeeded;
		this.noOfExercisesCompleted = noOfExercisesCompleted;
		this.noOfSectionsCompleted = noOfSectionsCompleted ;
		this.currentSubSection = currentSubSection;
		this.noOfSectionsCompleted = noOfSectionsCompleted;
		this.noOfTimesLoggedIn = noOfTimesLoggedIn;
		this.setSessionStats(sessionStats);
		this.maritalStatus = maritalStatus;
		this.livingArrangement = livingArrangement;
		this.education = education;
		this.significantOther = significantOther;
		//this.mailId = mailId;
		this.lastPhoneCall = lastPhoneCall;
		this.nextCallDue = nextCallDue;
		this.flag="false";
	}
	
	public User(int id, String name, String gender, String age, String mobileNumber,String nextSession,int remindersNeeded, int currentSection,
			int  noOfExercisesCompleted,int currentSubSection,int noOfSectionsCompleted,int noOfTimesLoggedIn ,
			ArrayList<SessionStats> sessionStats , String maritalStatus, String livingArrangement,
			String education,String significantOther,String  lastPhoneCall,String nextCallDue,int doctor_id){
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.setAge(age);
		this.mobileNumber = mobileNumber;
		this.currentSection =currentSection;
		this.nextSession = nextSession;
		this.remindersNeeded = remindersNeeded;
		this.noOfExercisesCompleted = noOfExercisesCompleted;
		this.noOfSectionsCompleted = noOfSectionsCompleted ;
		this.currentSubSection = currentSubSection;
		this.noOfSectionsCompleted = noOfSectionsCompleted;
		this.noOfTimesLoggedIn = noOfTimesLoggedIn;
		this.setSessionStats(sessionStats);
		this.maritalStatus = maritalStatus;
		this.livingArrangement = livingArrangement;
		this.education = education;
		this.significantOther = significantOther;
		//this.mailId = mailId;
		this.lastPhoneCall = lastPhoneCall;
		this.nextCallDue = nextCallDue;
		this.flag="false";
		this.doctor_id=doctor_id;
	}
	
	
	
	
	public String getMode()
	{
		return mode;
	}
	public void setMode(String mode)
	{
		this.mode=mode;
	}
	public String getFlag()
	{
		return flag;
	}
	public void setFlag(String flag)
	{
		this.flag=flag;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAgreed() {
		return agreed;
	}

	public void setAgreed(String agreed) {
		this.agreed = agreed;
	}

	public int getCurrentSection() {
		return currentSection;
	}

	public void setCurrentSection(int currentSection) {
		this.currentSection = currentSection;
	}

	public String getCheckpoint() {
		return checkpoint;
	}

	public void setCheckpoint(String checkpoint) {
		this.checkpoint = checkpoint;
	}

	public int getSectionsCompleted() {
		return sectionsCompleted;
	}

	public void setSectionsCompleted(int sectionsCompleted) {
		this.sectionsCompleted = sectionsCompleted;
	}

	public int getExercisesCompleted() {
		return exercisesCompleted;
	}

	public void setExercisesCompleted(int exercisesCompleted) {
		this.exercisesCompleted = exercisesCompleted;
	}

	public String getNextSession() {
		return nextSession;
	}

	public void setNextSession(String nextSession) {
		this.nextSession = nextSession;
	}

	public int getRemindersNeeded() {
		return remindersNeeded;
	}

	public void setRemindersNeeded(int remindersNeeded) {
		this.remindersNeeded = remindersNeeded;
	}
	
	public int getNoOfExercisesCompleted() {
		return noOfExercisesCompleted;
	}

	public void setNoOfExercisesCompleted(int noOfExercisesCompleted) {
		this.noOfExercisesCompleted = noOfExercisesCompleted;
	}

	public int getCurrentSubSection() {
		return currentSubSection;
	}

	public void setCurrentSubSection(int currentSubSection) {
		this.currentSubSection = currentSubSection;
	}

	public int getNoOfTimesLoggedIn() {
		return noOfTimesLoggedIn;
	}

	public void setNoOfTimesLoggedIn(int noOfTimesLoggedIn) {
		this.noOfTimesLoggedIn = noOfTimesLoggedIn;
	}

	public int getNoOfSectionsCompleted() {
		return noOfSectionsCompleted;
	}

	public void setNoOfSectionsCompleted(int noOfSectionsCompleted) {
		this.noOfSectionsCompleted = noOfSectionsCompleted;
	}

	
	public ArrayList<String> getfeedbacks() {
		return feedbacks;
	}
	
	public void setfeedback(String feedback) {
		
		this.feedbacks.add(feedback);
	}
	
	public String getReginfo() {
		return reginfo;
	}
	
	public void setReginfo(String reginfo) {
		
		this.reginfo = reginfo;
	}
	
	public ArrayList<String> getnotes() {
		return notes;
	}
	
	public void setnote(String note) {
		
		this.notes.add(note);
	}
	
	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getLivingArrangement() {
		return livingArrangement;
	}

	public void setLivingArrangement(String livingArrangement) {
		this.livingArrangement = livingArrangement;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getSignificantOther() {
		return significantOther;
	}

	public void setSignificantOther(String significantOther) {
		this.significantOther = significantOther;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getLastPhoneCall() {
		return lastPhoneCall;
	}

	public void setLastPhoneCall(String lastPhoneCall) {
		this.lastPhoneCall = lastPhoneCall;
	}

	public String getNextCallDue() {
		return nextCallDue;
	}

	public void setNextCallDue(String nextCallDue) {
		this.nextCallDue = nextCallDue;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public ArrayList<SessionStats> getSessionStats() {
		return sessionStats;
	}

	public void setSessionStats(ArrayList<SessionStats> sessionStats) {
		this.sessionStats = sessionStats;
	}

	public String getUserCreationTime() {
		return userCreationTime;
	}

	public void setUserCreationTime(String userCreationTime) {
		this.userCreationTime = userCreationTime;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
	public int getDoctor_id() {
		return doctor_id;
	}

	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	
}
