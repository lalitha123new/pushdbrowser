package in.ac.nimhans.service;

import java.io.File;
import java.io.FileWriter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
//db hederfiles
import in.ac.nimhans.dbService.dbObject;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

import in.ac.nimhans.model.Activity;
import in.ac.nimhans.model.CheckPoint;
import in.ac.nimhans.model.Link;
import in.ac.nimhans.model.Path;
import in.ac.nimhans.model.PracticePoint;
import in.ac.nimhans.model.Section;
import in.ac.nimhans.model.SectionData3;
import in.ac.nimhans.model.SessionStats;
import in.ac.nimhans.model.Workbook;
import in.ac.nimhans.model.Stats;
import in.ac.nimhans.model.User;


public class ExternalApiService {

	private static Connection connection = null;

	public ExternalApiService() {

		if(connection == null) 
			connection = dbObject.getInstance().Connect();
	}
	// creating users

	public List<Stats> getUserStats(String key) {
		// //System.out.println("cameto DHCLIST"+report_date);

		try {
			String sql = "SELECT * FROM `stats`";
			//System.out.println("sql   " + sql);
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			ResultSet result = pstatement.executeQuery();
			List<Stats> stats = new ArrayList<Stats>();
			
			while (result.next()) {

				int	user_id1 = result.getInt("user_id");
				String nextSession = result.getString("nextSession");
				int	activeSubSection = result.getInt("activeSubSection");
				int	noOfExercisesCompleted = result.getInt("noOfExercisesCompleted");
				int	prSectionId = result.getInt("prSectionId");
				int	currentSection = result.getInt("currentSection");
				int	noOfSectionsCompleted = result.getInt("noOfSectionsCompleted");
				int	remindersNeeded = result.getInt("remindersNeeded");
				int	currentSubSection = result.getInt("currentSubSection");
				int	noOfSubSectionsCompleted = result.getInt("noOfSubSectionsCompleted");
				int	noOfTimesLoggedIn = result.getInt("noOfTimesLoggedIn");
				int	activeSection = result.getInt("activeSection");
				String status = result.getString("status");
				String blockedSection = result.getString("blockedSection");
				String prSections = result.getString("prSections");
				int	currentOptionalSection = result.getInt("currentOptionalSection");
				int	currentOptionalSubSection = result.getInt("currentOptionalSubSection");
				
				Stats stats1 = new Stats(user_id1, nextSession,activeSubSection, noOfExercisesCompleted, prSectionId,
				         currentSection, noOfSectionsCompleted, remindersNeeded, currentSubSection, noOfSubSectionsCompleted,
				         noOfTimesLoggedIn, activeSection, status, 
				         blockedSection, prSections, currentOptionalSection, currentOptionalSubSection);
				stats.add(stats1);

			}
//System.out.println(stats);
			return stats;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
		
	
	
	@SuppressWarnings("null")
	public List<User> getUserinfo(String key) {
		// //System.out.println("cameto DHCLIST"+report_date);
		List<User> user = new ArrayList<User>();
		
		
		//sessionStats = null;
		try {
			String name = "", gender = "";
			String age = null;
            int userId = 0;
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
			String mailId = null;
			String lastPhoneCall = null;
			String nextCallDue = null;
			String mobileNumber;
			String fname;
			String loginTime;
			String logoutTime;
			String lastActivity;
			String timeSpent;
			String smiley;	
			int doctor_id=0;
			
			
			
			
			String sql = "SELECT *FROM `user_info`";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			ResultSet result1 = pstatement.executeQuery();
			while(result1.next()) {
				userId = result1.getInt("user_id");
				name = result1.getString("fname");
				age = Integer.toString(result1.getInt("age"));
				gender = result1.getString("gender");
				maritalStatus = result1.getString("maritalStatus");
				livingArrangement = result1.getString("livingArrangement");
				education = result1.getString("education");
				significantOther = result1.getString("significantOther");
				//mailId = result1.getString("mailId");
				mobileNumber = result1.getString("mobileNumber");
				fname = result1.getString("fname");
				//System.out.println("userId -- "+userId);
				
				
				String sql2 = "SELECT `email` FROM `users` WHERE `users_id` =?";
				//System.out.println("userI000d -- "+userId);
				PreparedStatement pstatement2;
				pstatement2 = connection.prepareStatement(sql2);
				pstatement2.setInt(1, userId);
				ResultSet result2 = pstatement2.executeQuery();
				////System.out.println("userId1 -- "+userId);
				if(result2.next()) {
					
					mailId = result2.getString("email");
					////System.out.println("userId2 -- "+userId);
					
					String sql3 = "SELECT * FROM `sessionstats` WHERE `users_id`=?";
					PreparedStatement pstatement3;
					pstatement3 = connection.prepareStatement(sql3);
					pstatement3.setInt(1, userId);
					ResultSet result3 = pstatement3.executeQuery();
					//SessionStats sessionObj = new SessionStats();
					ArrayList<SessionStats> sessionStats = new ArrayList<SessionStats>();
					while (result3.next()) {

						
						////System.out.println(result3.getTimestamp("lastActivity"));

						SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

						loginTime = dateFormat.format(result3.getTimestamp("loginTime"));
						if (result3.getTimestamp("logoutTime") != null) {
							logoutTime = dateFormat.format(result3.getTimestamp("logoutTime"));
						} else {
							logoutTime = "no data";
						}
						if (result3.getTimestamp("lastActivity") != null) {
							lastActivity = dateFormat.format(result3.getTimestamp("lastActivity"));
						} else {

							lastActivity = "no data";
						}

						timeSpent = result3.getString("timeSpent");
						smiley = result3.getString("smiley");

//						sessionObj.setLoginTime(loginTime);
//						sessionObj.setLogoutTime(logoutTime);
//						sessionObj.setLastActivity(lastActivity);
//						sessionObj.setTimeSpent(timeSpent);
//						sessionObj.setSmiley(smiley);
						SessionStats sessionObj1 = new SessionStats(loginTime,logoutTime,lastActivity,timeSpent,smiley);
						sessionStats.add(sessionObj1);
						
						//System.out.println(sessionStats);

					}
					
					User user1=new User(userId, name,mailId, gender, age, mobileNumber, nextSession, remindersNeeded,
							currentSection, noOfExercisesCompleted, currentSubSection, noOfSectionsCompleted,
							noOfTimesLoggedIn, sessionStats, maritalStatus, livingArrangement, education,
							significantOther, lastPhoneCall, nextCallDue,doctor_id);
					user.add(user1);
					
				}
									
				
				
				
			}		
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
