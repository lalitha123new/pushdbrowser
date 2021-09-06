package in.ac.nimhans.service;

import java.io.File;
import java.io.FileWriter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
//db hederfiles
import in.ac.nimhans.dbService.dbObject;
import java.sql.*;
import java.util.*;

import in.ac.nimhans.model.Activity;
import in.ac.nimhans.model.CheckPoint;
import in.ac.nimhans.model.Link;
import in.ac.nimhans.model.Path;
import in.ac.nimhans.model.PracticePoint;
import in.ac.nimhans.model.Section;
import in.ac.nimhans.model.SectionData3;
import in.ac.nimhans.model.Workbook;

public class UserSectionService {

	private static Connection connection = null;
	private final String PATH = Path.USER_PATH;
		
	public UserSectionService() {

		if(connection == null)
			connection = dbObject.getInstance().Connect();
	}
	
	public Section setBaseLine(List<String> check, int userId) {
		// System.out.println("\tUS Method : setBaseLine " + userId);
		try {

			Section section = new Section();
			section.setPrSectionIds(new ArrayList<Integer>());
			section.setPrSectionNames(new ArrayList<String>());

			PreparedStatement pstatement1;
			String sql1 = "UPDATE `user_info` SET `checkpoint` = ? WHERE `user_id`=?";
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setString(1, "true");
			pstatement1.setInt(2, userId);

			pstatement1.executeUpdate();

			String[] files = { "sectionInfo.json", "optionalSectionInfo.json" };
			String str = "";
			for (String file : files) {

				JSONArray jsArray = JSONFile.readJSONArray(Path.SECTION_PATH + file);

				for (int i = 0; i < jsArray.size(); i++) {
					JSONObject jsObject = (JSONObject) jsArray.get(i);
					String id = (String) jsObject.get("sectionId");
					for (String string : check) {
						if (string.equals(id)) {
							str += string + ",";
							section.getPrSectionIds().add(Integer.parseInt(id));
							section.getPrSectionNames().add((String) jsObject.get("sectionName"));
						}
					}
				}
			}
			//System.out.println("Prsection String-- " + str);
			PreparedStatement pstatement2;
			String sql2 = "UPDATE `stats` SET `prSections` = ?, `currentSection` = ? ,`currentSubSection` = ? ,`activeSection` = ?,`activeSubSection` = ?,`status` = ?,`noOfExercisesCompleted` = ? WHERE `user_id`=?";
			pstatement2 = connection.prepareStatement(sql2);

			pstatement2.setString(1, str);
			pstatement2.setInt(2, 1);
			pstatement2.setInt(3, 0);
			pstatement2.setInt(4, 1);
			pstatement2.setInt(5, 0);
			pstatement2.setString(6, "true");
			pstatement2.setInt(7, 1);
			pstatement2.setInt(8, userId);

			pstatement2.executeUpdate();
			return section;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Section Navigation
	
	public void getCurrentSection(Section section, int userId, boolean essentialSection) {
		// esentialSection set to false if called for OptionalSections
		
		// System.out.println("\tUS Method : getCurrentSection , UserId=" + userId);
		try {
			int sectionId;
			getCurrentSubSection(section, userId, essentialSection);
			if(essentialSection) {
				sectionId = section.getCurrentSection();
			} else {
				sectionId = section.getCurrentOptionalSection();
			}
			sectionId--;
			if (sectionId != 0) {
				String sql = "SELECT `review`,`summary`  FROM `section_feedback` WHERE `users_id` = ? AND `section_id` = ?";
				PreparedStatement pstatement;
				pstatement = connection.prepareStatement(sql);
				pstatement.setInt(1, userId);
				pstatement.setInt(2, sectionId);
				ResultSet result1 = pstatement.executeQuery();
				if (result1.next()) {
					section.setReview(result1.getString("review"));
					section.setSummary(result1.getString("summary"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			section = null;
		}
	}
	
	public Section getCurrentSubSection(Section section, int userId, boolean essentialSection) {

		// System.out.println("\tUS Method : getCurrentSubSection , UserId=" + userId);
		try {
			String sql = "SELECT * FROM `stats` WHERE `user_id`=?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, userId);
			ResultSet result1 = pstatement.executeQuery();

			if(result1.next()) {
				int activeSection = result1.getInt("activeSection");
				if (essentialSection) {
					section.setCurrentSection(result1.getInt("currentSection")); // CHECK
					section.setCurrentSubSection(result1.getInt("currentSubSection"));
					section.setActiveSection(activeSection);
					section.setActiveSubSection(result1.getInt("activeSubSection"));

					section.setCurrentOptionalSection(result1.getInt("currentOptionalSection"));
					section.setCurrentOptionalSubSection(result1.getInt("currentOptionalSubSection"));
				} else {
					section.setCurrentOptionalSection(activeSection);
					section.setCurrentOptionalSubSection(result1.getInt("activeSubSection"));
				}
				
				String prSections = result1.getString("prSections");
				String prSection = "false";
				String str[] = prSections.split(",");
				List<String> al = Arrays.asList(str);		
				for (String s : al) {
					int id = Integer.parseInt(s);
					if (id == activeSection) {
						prSection = "true";
						break;
					}
				}
				section.setPrSection(prSection);
				
				return section;
			}else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Section viewSection(int userId, int sectionId) {
		// set this as the section being viewed

		Section section = null;
		try {

			PreparedStatement pstatement3;
			String sql3 = "UPDATE `stats` SET `activeSection` = ?,`activeSubSection` =? WHERE `user_id`=?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setInt(1, sectionId);
			pstatement3.setInt(2, 0);
			pstatement3.setInt(3, userId);
			pstatement3.executeUpdate();

			String sql1 = "SELECT * FROM `stats` WHERE `user_id`=?";
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setInt(1, userId);
			ResultSet result = pstatement1.executeQuery();

			if (result.next()) {
				section = new Section();
				section.setActiveSection(sectionId);
				section.setActiveSubSection(0);
				System.out.println("setCurrent Section"+result.getInt("currentSection"));
				section.setCurrentSection(result.getInt("currentSection"));
				section.setCurrentSubSection(result.getInt("currentSubSection"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return section;
	}

	public Section getNextSection(int userId, int sectionId, int subSectionId) {

		System.out.println("\tUS Method : getNextSubSection , UserId=" +userId + ", SubSection=" + subSectionId+"--section_id--"+sectionId);
		
		ReminderService RService = new ReminderService();

		Section section = new Section();

		try {

			String sql = "SELECT * FROM `stats` WHERE `user_id`=?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, userId);
			ResultSet result1 = pstatement.executeQuery();

			int exercisesCompleted = 0;
			String status = "";
			if (result1.next()) {

				exercisesCompleted = result1.getInt("noOfExercisesCompleted");
				status = result1.getString("status");
			}

			JSONObject jsonObject;
			JSONArray jsonArray;

			// String exercisesCompleted = (String)userObject.get("noOfExercisesCompleted");

			if (subSectionId != 0) {
				String path = Path.SECTION_PATH + "section" + sectionId + "/subsection" + subSectionId
						+ "/subsection.json";

				JSONObject jsObject;
				JSONArray jsArray;
				String exerciseNo = "";
				if ((sectionId == 3) && (subSectionId == 2)) {
					jsArray = JSONFile.readJSONArray(path);
					jsObject = (JSONObject) jsArray.get(jsArray.size() - 1);
				} else {
					jsObject = JSONFile.readJSON(path);
				}
				exerciseNo = (String) jsObject.get("exerciseNo");

				PreparedStatement pstatement1;
				String sql1 = "UPDATE `stats` SET `noOfSubSectionsCompleted` = ?, noOfExercisesCompleted = ? WHERE `user_id`=?";
				pstatement1 = connection.prepareStatement(sql1);
				pstatement1.setInt(1, subSectionId);
				if (exerciseNo != null)
					pstatement1.setInt(2, Integer.parseInt(exerciseNo));
				else
					pstatement1.setInt(2, exercisesCompleted);
				pstatement1.setInt(3, userId);
				pstatement1.executeUpdate();

			}
			section.setSectionId(sectionId);
			section.setCurrentSection(sectionId);
			section.setCurrentSubSection(subSectionId);
			section.setActiveSection(sectionId);
			section.setActiveSubSection(subSectionId);

			int nextSection;
			int nextSubSection;

			if (status.equals("true") || (subSectionId == 0)) {
				nextSection = sectionId;
				nextSubSection = subSectionId + 1;
				System.out.println("true--"+sectionId+"--nextSubSection--"+nextSubSection);
			} else {
				nextSection = sectionId;
				nextSubSection = subSectionId;
			}

			jsonArray = JSONFile.readJSONArray(Path.SECTION_PATH + "sectionInfo.json");

			String subSectionName = "";

			for (int i = 0; i < jsonArray.size(); i++) {

				jsonObject = (JSONObject) jsonArray.get(i);
				String id = (String) jsonObject.get("sectionId");

				if (id.equals("" + section.getSectionId())) {

					section.setSectionName((String) jsonObject.get("sectionName"));
					int noOfSubSection = Integer.parseInt((String) jsonObject.get("noOfSubSections"));
					// System.out.println("nextSubSection=" + nextSubSection + "
					// noOfSubSections=" + noOfSubSection);
					if (noOfSubSection < nextSubSection) {
						nextSection++;
						nextSubSection = 0;
					} else if ((sectionId == 3) && (subSectionId == 2)) {
						nextSubSection = subSectionId + 2;

					} else if ((sectionId == 3) && (subSectionId == 6)) {
						nextSection++;
						nextSubSection = 0;

					}

					if (nextSubSection == 0) {
						subSectionName = "section";
						// userObject.put("noOfSectionsCompleted", sectionId);
						// userObject.put("noOfSubSectionsCompleted", "0");
						PreparedStatement pstatement2;
						String sql2 = "UPDATE `stats` SET `noOfSectionsCompleted` = ?, noOfSubSectionsCompleted = ? WHERE `user_id`=?";
						pstatement2 = connection.prepareStatement(sql2);
						pstatement2.setInt(1, sectionId);
						pstatement2.setInt(2, 0);
						pstatement2.setInt(3, userId);

						pstatement2.executeUpdate();

					} else {

						jsonArray = JSONFile
								.readJSONArray(Path.SECTION_PATH + "section" + nextSection + "/subSectionInfo.json");

						for (int j = 0; j < jsonArray.size(); j++) {

							jsonObject = (JSONObject) jsonArray.get(j);
							int ssid = Integer.parseInt((String) jsonObject.get("subSectionId"));

							if (ssid == nextSubSection) {

								subSectionName = getSubSectionName(sectionId, ssid);
								// System.out.println("SubSection1: " +
								// subSectionName);

								if (subSectionName.equals("")) {
									subSectionName = (String) jsonObject.get("subSectionName");

									// System.out.println("SubSection1: " +
									// subSectionName);

									if (subSectionName.equals("Summarizing") || subSectionName.indexOf("Tool") >= 0) {
										subSectionName = "toolbox";
									} else if (subSectionName.indexOf("Knowledge") >= 0) {
										subSectionName = "knowledge2";
									} else if (subSectionName.indexOf("Demo") >= 0) {
										subSectionName = "demo";
									} else if (subSectionName.indexOf("Video") >= 0
											|| subSectionName.indexOf("letter") >= 0) {
										subSectionName = "video";
									} else if (subSectionName.indexOf("Practice") >= 0) {
										subSectionName = "practice1";
									}
									// System.out.println("Sub Section Name : "
									// + subSectionName);
									break;
								}
							}
						}
						break;
					}
				}
			}

			section.setValues(subSectionName, "" + nextSection, "" + nextSubSection);
			
			System.out.println("last---currentSubSection "+subSectionName+"---" + nextSection+"---" + nextSubSection);

			PreparedStatement pstatement3;
			String sql3 = "UPDATE `stats` SET `activeSection` = ?, activeSubSection = ?, `currentSection` = ?, currentSubSection = ? ,status=?WHERE `user_id`=?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setInt(1, nextSection);
			pstatement3.setInt(2, nextSubSection);
			if (nextSection == 11) {
				pstatement3.setInt(3, 11);
				pstatement3.setInt(4, 0);
			} else {
				System.out.println("Setting cUrreny Setion---"+nextSection);
				if(nextSection == 3) {
					//sending email with attachements
					RService.emailWithAttachment(userId);		
				}
				pstatement3.setInt(3, nextSection);
				pstatement3.setInt(4, nextSubSection);
			}
			pstatement3.setString(5, "false");
			pstatement3.setInt(6, userId);
			pstatement3.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return section;
	}

	public Section viewNextSection(int userId, int sectionId, int subSectionId) {

		// System.out.println("\tUS Method : viewNextSection , UserId=" + userId
		// + ", SubSection=" + subSectionId);

		// JSONParser parser = new JSONParser();

		Section section = new Section();

		try {

			// Object obj;
			JSONObject jsonObject;
			JSONArray jsonArray;

			// obj = parser.parse(new FileReader(PATH + userId +
			// "/stats.json"));
			// JSONObject userObject = (JSONObject) obj;

			// JSONObject userObject = JSONFile.readJSON(PATH + userId +
			// "/stats.json");
			String sql = "SELECT * FROM `stats` WHERE `user_id`=?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, userId);
			// pstatement.setInt(1, Integer.parseInt(userId));
			ResultSet result1 = pstatement.executeQuery();

			String exercisesCompleted = "";

			if (result1.next()) {

				exercisesCompleted = Integer.toString(result1.getInt("noOfExercisesCompleted"));
				result1.getString("status");
			}

			// String exercisesCompleted = (String)
			// userObject.get("noOfExercisesCompleted");

			if (subSectionId != 0) {
				// obj = parser.parse(new FileReader(
				// Path.SECTION_PATH + "section" + sectionId + "/subsection" +
				// subSectionId + "/subsection.json"));
				JSONObject jsObject;
				JSONArray jsArray;
				String exerciseNo = "";
				if ((sectionId == 3) && (subSectionId == 2)) {
					// jsArray = (JSONArray) obj;
					jsArray = JSONFile.readJSONArray(Path.SECTION_PATH + "section" + sectionId + "/subsection"
							+ subSectionId + "/subsection.json");
					jsObject = (JSONObject) jsArray.get(jsArray.size() - 1);
				} else {
					// jsObject = (JSONObject) obj;
					jsObject = JSONFile.readJSON(Path.SECTION_PATH + "section" + sectionId + "/subsection"
							+ subSectionId + "/subsection.json");
				}
				exerciseNo = (String) jsObject.get("exerciseNo");
				// System.out.println(exerciseNo);
				// if (exerciseNo != null)
				// userObject.put("noOfExercisesCompleted", exerciseNo);
				// else
				// userObject.put("noOfExercisesCompleted", exercisesCompleted);

				PreparedStatement pstatement1;
				String sql1 = "UPDATE `stats` SET `noOfSubSectionsCompleted` = ?, noOfExercisesCompleted = ? WHERE `user_id`=?";
				pstatement1 = connection.prepareStatement(sql1);
				pstatement1.setInt(1, subSectionId);
				if (exerciseNo != null)
					pstatement1.setInt(2, Integer.parseInt(exerciseNo));
				else
					pstatement1.setInt(2, Integer.parseInt(exercisesCompleted));
				pstatement1.setInt(3, userId);
				pstatement1.executeUpdate();

			}
			section.setSectionId(sectionId);

			// obj = parser.parse(new FileReader(Path.SECTION_PATH +
			// "sectionInfo.json")); // List
			// of
			// sections
			// jsonArray = (JSONArray) obj;

			jsonArray = JSONFile.readJSONArray(Path.SECTION_PATH + "sectionInfo.json");
			int nextSection = sectionId;
			int nextSubSection = subSectionId + 1;
			String subSectionName = "";

			for (int i = 0; i < jsonArray.size(); i++) {

				jsonObject = (JSONObject) jsonArray.get(i);
				String id = (String) jsonObject.get("sectionId");

				if (id.equals("" + section.getSectionId())) {

					section.setSectionName((String) jsonObject.get("sectionName"));
					int noOfSubSection = Integer.parseInt((String) jsonObject.get("noOfSubSections"));
					// System.out.println("nextSubSection=" + nextSubSection + "
					// noOfSubSections=" + noOfSubSection);
					if (noOfSubSection < nextSubSection) {
						nextSection++;
						nextSubSection = 0;
					}

					if (nextSubSection == 0) {
						subSectionName = "section";

						PreparedStatement pstatement2;
						String sql2 = "UPDATE `stats` SET `noOfSectionsCompleted` = ? WHERE `user_id`=?";
						pstatement2 = connection.prepareStatement(sql2);
						pstatement2.setInt(1, sectionId);

						pstatement2.setInt(2, userId);
						pstatement2.executeUpdate();

						// userObject.put("noOfSectionsCompleted", sectionId);
					} else {
						// obj = parser.parse(
						// new FileReader(Path.SECTION_PATH + "section" +
						// nextSection + "/subSectionInfo.json"));
						// jsonArray = (JSONArray) obj;

						jsonArray = JSONFile
								.readJSONArray(Path.SECTION_PATH + "section" + nextSection + "/subSectionInfo.json");
						for (int j = 0; j < jsonArray.size(); j++) {

							jsonObject = (JSONObject) jsonArray.get(j);
							int ssid = Integer.parseInt((String) jsonObject.get("subSectionId"));

							if (ssid == nextSubSection) {

								subSectionName = getSubSectionName(sectionId, ssid);
								// System.out.println("SubSection1: " +
								// subSectionName);

								if (subSectionName.equals("")) {
									subSectionName = (String) jsonObject.get("subSectionName");

									// System.out.println("SubSection1: " +
									// subSectionName);

									if (subSectionName.equals("Summarizing") || subSectionName.indexOf("Tool") >= 0) {
										subSectionName = "toolbox";
									} else if (subSectionName.indexOf("Knowledge") >= 0) {
										subSectionName = "knowledge2";
									} else if (subSectionName.indexOf("Demo") >= 0) {
										subSectionName = "demo";
									} else if (subSectionName.indexOf("Video") >= 0
											|| subSectionName.indexOf("letter") >= 0) {
										subSectionName = "video";
									} else if (subSectionName.indexOf("Practice") >= 0) {
										subSectionName = "practice1";
									}
									// System.out.println("Sub Section Name : "
									// + subSectionName);
									break;
								}
							}
						}
						break;
					}
				}
			}

			section.setValues(subSectionName, "" + nextSection, "" + nextSubSection);

			// userObject.put("activeSection", "" + nextSection);
			// userObject.put("activeSubSection", "" + nextSubSection);

			PreparedStatement pstatement3;
			String sql3 = "UPDATE `stats` SET `activeSection` = ?, activeSubSection = ? WHERE `user_id`=?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setInt(1, nextSection);
			pstatement3.setInt(2, nextSubSection);
			pstatement3.setInt(3, userId);
			pstatement3.executeUpdate();

			// needto check
			// updateLastActivity(userObject);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return section;
	}

	public Section optionalNextSubSection(int userId, int sectionId, int subSectionId) {
		Section section = new Section();

		try {
			JSONObject jsonObject;
			JSONArray jsonArray;
			if ((subSectionId != 0)) {
				// obj = parser.parse(new FileReader(
				// Path.SECTION_PATH + "section" + sectionId + "/subsection" +
				// subSectionId + "/subsection.json"));
				JSONObject jsObject;
				JSONArray jsArray;
				String path = Path.SECTION_PATH + "section" + sectionId + "/subsection" + subSectionId
						+ "/subsection.json";

				if ((sectionId == 3) && (subSectionId == 2)) {
					jsArray = JSONFile.readJSONArray(path);
					jsObject = (JSONObject) jsArray.get(jsArray.size() - 1);
				} else {
					jsObject = JSONFile.readJSON(path);

				}
			}
			section.setSectionId(sectionId);

			jsonArray = JSONFile.readJSONArray(Path.SECTION_PATH + "optionalSectionInfo.json");
			int nextSection = sectionId;
			int nextSubSection = subSectionId + 1;

			String subSectionName = "";

			for (int i = 0; i < jsonArray.size(); i++) {

				jsonObject = (JSONObject) jsonArray.get(i);
				String id = (String) jsonObject.get("sectionId");

				if (id.equals("" + section.getSectionId())) {

					section.setSectionName((String) jsonObject.get("sectionName"));
					int noOfSubSection = Integer.parseInt((String) jsonObject.get("noOfSubSections"));
					// System.out.println("nextSubSection=" + nextSubSection + "
					// noOfSubSections=" + noOfSubSection);
					if (noOfSubSection < nextSubSection) {
						nextSection++;
						nextSubSection = 0;
					}
					// System.out.println("hi"+ nextSection);

					if (nextSubSection == 0) {
						subSectionName = "section";

						if (nextSection == 19)
							nextSection = 11;
						// userObject.put("noOfSectionsCompleted", sectionId);
					} else {
						// obj = parser.parse(
						// new FileReader(Path.SECTION_PATH + "section" +
						// nextSection + "/subSectionInfo.json"));
						// jsonArray = (JSONArray) obj;

						jsonArray = JSONFile
								.readJSONArray(Path.SECTION_PATH + "section" + nextSection + "/subSectionInfo.json");
						for (int j = 0; j < jsonArray.size(); j++) {

							jsonObject = (JSONObject) jsonArray.get(j);
							int ssid = Integer.parseInt((String) jsonObject.get("subSectionId"));

							if (ssid == nextSubSection) {

								subSectionName = getSubSectionName(sectionId, ssid);

								if (subSectionName.equals("")) {
									subSectionName = (String) jsonObject.get("subSectionName");

									// System.out.println("SubSection1: " +
									// subSectionName);
									if (subSectionName.indexOf("Discovery") >= 0) {
										subSectionName = "discovery";
									} else if (subSectionName.equals("Summarizing")
											|| subSectionName.indexOf("Tool") >= 0) {
										subSectionName = "toolbox";
									} else if (subSectionName.indexOf("Knowledge") >= 0) {
										subSectionName = "knowledge2";
									} else if (subSectionName.indexOf("Demo") >= 0) {
										subSectionName = "demo";
									} else if (subSectionName.indexOf("Video") >= 0
											|| subSectionName.indexOf("letter") >= 0) {
										subSectionName = "video";
									} else if (subSectionName.indexOf("Check") >= 0) {
										subSectionName = "check";
									} else if (subSectionName.indexOf("Practice") >= 0) {
										subSectionName = "practice1";
									}

								}
								break;
							}

						}
						break;
					}
				}
			}

			section.setValues("optional/" + subSectionName, "" + nextSection, "" + nextSubSection);
			
			PreparedStatement pstatement3;
			String sql3  = "UPDATE `stats` SET `activeSection`=?,`activeSubSection`=? WHERE `user_id`=?";
			pstatement3 = connection.prepareStatement(sql3);
			pstatement3.setInt(1, nextSection);
			pstatement3.setInt(2, nextSubSection);
			pstatement3.setInt(3, userId);
			int result3 = pstatement3.executeUpdate();
			

//			userObject.put("activeSection", "" + nextSection);
//			userObject.put("activeSubSection", "" + nextSubSection);
//			
//			//UserService.updateLastActivity(userObject);
//
//			try {
//				FileWriter file = new FileWriter(PATH + userId + "/stats.json");
//				file.write(userObject.toJSONString());
//				// System.out.println("Successfully Copied JSON Object to
//				// File...");
//				// System.out.println("\nJSON Object: " + userObject);
//				file.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return section;
	}

	private String getSubSectionName(int sid, int ssid) {

		if ((sid == 3 && ssid == 4)) {
			return "check3";
		} else if ((sid == 5 && ssid == 7) || (sid == 7 && ssid == 4) || (sid == 8 && ssid == 5)
				|| (sid == 9 && ssid == 4)) {
			return "commit";
		} else if ((sid == 3 && ssid == 3)) {
			return "practice10";
		} else if ((sid == 2 && ssid == 1) || (sid == 2 && ssid == 2)) {
			return "letter";
		} else if ((sid == 1 && ssid == 1)) {
			return "discovery3";
		} else if ((sid == 10 && ssid == 2)) {
			return "discovery5";
		} else if ((sid == 9 && ssid == 2)) {
			return "discovery7";
		} else if ((sid == 6 && ssid == 1)) {
			return "discovery8";
		} else if ((sid == 5 && ssid == 3)) {
			return "demo";
		} else if ((sid == 7 && ssid == 2) || (sid == 5 && ssid == 5) || (sid == 6 && ssid == 5)
				|| (sid == 6 && ssid == 7) || (sid == 8 && ssid == 2) || (sid == 16 && ssid == 1)
				|| (sid == 18 && ssid == 1)) {
			return "knowledge2";
		} else if ((sid == 9 && ssid == 5)) {
			return "knowledge3";
		} else if ((sid == 1 && ssid == 5) || (sid == 3 && ssid == 1) || (sid == 4 && ssid == 1)) {
			return "knowledge4";
		} else if ((sid == 4 && ssid == 4)) {
			return "practice2";
		} else if ((sid == 3 && ssid == 6) || (sid == 6 && ssid == 4)) {
			return "practice4";
		} else if ((sid == 4 && ssid == 7) || (sid == 5 && ssid == 6) || (sid == 5 && ssid == 7)
				|| (sid == 6 && ssid == 6) || (sid == 8 && ssid == 4) || (sid == 11 && ssid == 5)) {
			return "practice6";
		} else if ((sid == 4 && ssid == 6) || (sid == 5 && ssid == 8) || (sid == 7 && ssid == 5)) {
			return "practice7";
		} else if ((sid == 5 && ssid == 4)) {
			return "practice8";
		} else if (sid == 3 && ssid == 2) {
			return "practice11";
		} else if (sid == 6 && ssid == 8) {
			return "practice12";
		} else if ((sid == 16 && ssid == 3)) {
			return "practice13";
		} else if ((sid == 17 && ssid == 3)) {
			return "practice14";
		} else if ((sid == 3 && ssid == 7)) {
			return "practice15";
		} else if ((sid == 9 && ssid == 3)) {
			return "tool2";
		} else if ((sid == 3 && ssid == 5) || (sid == 6 && ssid == 3) || (sid == 7 && ssid == 3)
				|| (sid == 11 && ssid == 2) || (sid == 11 && ssid == 3) || (sid == 11 && ssid == 4)
				|| (sid == 16 && ssid == 2)) {
			return "tool3";
		} else if ((sid == 13 && ssid == 2)) {
			return "tool4";
		} else if ((sid == 7 && ssid == 2)) {
			return "tool5";
		} else if ((sid == 14 && ssid == 2)) {
			return "tool6";
		}
		return "";

	}

	public String resetSection(int userId) {

		try {
			String sql = "SELECT `currentSubSection` FROM `stats` WHERE `user_id`=?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, userId);
			ResultSet result = pstatement.executeQuery();

			if (result.next()) {
				int currentSubSection = result.getInt("currentSubSection");
				int b = currentSubSection - 1;
				if (b >= 0) {
					PreparedStatement pstatement1;
					String sql1 = "UPDATE `stats` SET `currentSubSection` = ? WHERE `user_id`=?";
					pstatement1 = connection.prepareStatement(sql1);
					System.out.println("setting current sub sction - "+b);
					pstatement1.setInt(1, b);
					pstatement1.setInt(2, userId);
					int result1 = pstatement1.executeUpdate();
				//	System.out.println("reset current section" + result1);
				//	System.out.println("reset current section" + currentSubSection);

					// Do we need to update noOfSubSectionsCompleted??
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	//new code for reset section to users
	public String resetSectionForUser(int userId) {

		try {
			
			
			//System.out.println("user_id inside--"+user_id); 
		    String sql7 = "UPDATE `stats` SET `activeSubSection` = 0,`currentSection` = 1,`noOfSectionsCompleted` = 0,`noOfExercisesCompleted` = 0,`noOfSubSectionsCompleted` = 0,`activeSection` = 1,`currentSubSection`= 0 WHERE `user_id` = ?";  
   	        PreparedStatement pstatement7;
   	        pstatement7 = connection.prepareStatement(sql7);
   	        pstatement7.setInt(1, userId);
		    int result7 = pstatement7.executeUpdate();
			  
			  
			  String sql8 = "DELETE FROM `depressed_res` WHERE `user_id` = ?";  
     	      PreparedStatement pstatement8;
     	      pstatement8 = connection.prepareStatement(sql8);
     	      pstatement8.setInt(1, userId);
			  int result8 = pstatement8.executeUpdate();
			  
			  String sql9 = "DELETE FROM `section_feedback` WHERE `users_id` = ?";  
     	      PreparedStatement pstatement6;
     	      pstatement6 = connection.prepareStatement(sql9);
     	      pstatement6.setInt(1, userId);
			  int result6 = pstatement6.executeUpdate();
			  
			  String sql10 = "DELETE FROM `sections` WHERE `user_id` = ?";  
     	      PreparedStatement pstatement9;
     	      pstatement9 = connection.prepareStatement(sql10);
     	      pstatement9.setInt(1, userId);
			  int result10 = pstatement9.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	
	

	public void lockSections(int userId, String lock) {

		try {

			PreparedStatement pstatement1;
			String sql1 = "UPDATE `stats` SET `blockedSection` = ? WHERE `user_id` = ?";
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setString(1, lock);
			pstatement1.setInt(2, userId);
			pstatement1.executeUpdate();

			//System.out.println("update block1111 sections" + lock);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<String> getlockSection(int userId) {

		try {
			List<String> array = new ArrayList<String>();
			String blockedSection = "";
			String sql = "SELECT `blockedSection` FROM `stats` WHERE `user_id`=?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setInt(1, userId);
			ResultSet result = pstatement.executeQuery();
			while (result.next()) {

				blockedSection = result.getString("blockedSection");
				array.add(blockedSection);

			}
		//	System.out.println("yes Stats" + blockedSection);

			return array;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public void setSectionReview(int userId, int sectionId, int value) {

		// System.out.println("\tUS Method : setSectionReview");

		String temp = "";
		switch (value) {
		case 1:
			temp = "I did not use this";
			break;
		case 2:
			temp = "I tried using it";
			break;
		case 3:
			temp = "I will try to use this";
			break;
		case 4:
			temp = "I used it and it was somewhat helpful";
			break;
		case 5:
			temp = "I used it and it was quite helpful";
		}

		try {

			/*
			 * File file = new File(PATH + userId + "/sections/section" +
			 * sectionId + "/section.json"); file.createNewFile(); FileWriter
			 * fileWriter = new FileWriter(file);
			 */
			
			PreparedStatement pstatement1;
			String sql1  = "UPDATE `section_feedback` SET `review` = ? WHERE `users_id`=? and section_id = ?";
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setString(1, temp);
			pstatement1.setInt(2, userId);
			pstatement1.setInt(3, sectionId);
			int result = pstatement1.executeUpdate();
			
			
//			JSONObject jsonobject;
//
//			File f = new File(PATH + userId + "/sections/section" + sectionId + "/section.json");
//			if (f.exists() && !f.isDirectory()) {
//				// Object obj = new JSONParser()
//				// .parse(new FileReader(PATH + userId + "/sections/section" +
//				// sectionId + "/section.json"));
//				// jsonobject = (JSONObject) obj;
//
//				jsonobject = JSONFile.readJSON(PATH + userId + "/sections/section" + sectionId + "/section.json");
//
//			} else {
//				File file = new File(PATH + userId + "/sections/section" + sectionId + "/section.json");
//				file.createNewFile();
//				jsonobject = new JSONObject();
//			}
//
//			jsonobject.put("review", temp);
//
//			try {
//				FileWriter file = new FileWriter(PATH + userId + "/sections/section" + sectionId + "/section.json");
//				file.write(jsonobject.toJSONString());
//				// System.out.println("Successfully Copied JSON Object to
//				// File...");
//				// System.out.println("\nJSON Object: " + jsonobject);
//				file.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}

			/*
			 * fileWriter.write(jsonobject.toJSONString()); fileWriter.close();
			 * //System.out.println("Successfully Copied JSON Object to File..."
			 * ); System.out.println("\nJSON Object: " + jsonobject);
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setSectionSummary(int i, int sectionId, String summary) {

		// System.out.println("\tUS Method : setSectionSummary");

		try {
			PreparedStatement pstatement2;
			String sql2 = "INSERT INTO `section_feedback` (`users_id`, `section_id`, `summary`) VALUES (?,?,?)";
			pstatement2 = connection.prepareStatement(sql2);
			pstatement2.setInt(1, i);
			pstatement2.setInt(2, sectionId);
			pstatement2.setString(3, summary);

			pstatement2.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Workbook Activities

	public Workbook getCheckPoint3Workbook(String userId, String sectionId, String subSectionId) {

		//System.out.println("for 3.4 service ----" + sectionId + "  subSectionId  " + subSectionId);

		Workbook workbook = new Workbook();
		workbook.setCheckPoints(new ArrayList<CheckPoint>());

		try {

			String sql = "SELECT `response`,`version_id` FROM `sections` WHERE `user_id`=? and `section_id` = ? and `sub_section_id`= ?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setString(1, userId);
			pstatement.setString(2, sectionId);
			pstatement.setString(3, subSectionId);
			ResultSet result = pstatement.executeQuery();
			CheckPoint checkPoint;
			while (result.next()) {
			  System.out.println(result.getString("response"));
				checkPoint = new CheckPoint();
				checkPoint.setData(new ArrayList<String>());
				checkPoint.setVersion(Integer.toString(result.getInt("version_id")));
				checkPoint.getData().add(result.getString("response"));
				// practicePoint.setSection_id(Integer.toString(sectionId));
				// practicePoint.setData(result.getString("response");
				workbook.getCheckPoints().add(checkPoint);
			}
			
			System.out.println("userId---"+userId+"sectionId"+sectionId+"---subSectionId---"+subSectionId+""+workbook.getCheckPoints());
			

			// System.out.println("\tUS Method_SIMHA : getCheckPoint3Workbook
			// userId=" + userId + " sectionId=" + sectionId + " subSectionId="
			// + subSectionId);
			// JSONArray jsonArray = new JSONArray();
			// JSONArray jsArray;
			// JSONObject jsonObject;
			//
			// Workbook workbook = new Workbook();
			// workbook.setCheckPoints(new ArrayList<CheckPoint>());
			//
			// try {
			//
			// //JSONParser jsonParser = new JSONParser();
			// String path = PATH + userId + "/sections/section" + sectionId +
			// "/subsection" + subSectionId
			// + "/subsection.json";
			// //Object obj = jsonParser.parse(new FileReader(path));
			//
			// //jsonArray = (JSONArray) obj;
			//
			// jsonArray = JSONFile.readJSONArray(path);
			//
			// CheckPoint checkPoint;
			//
			// for (int i = 0; i < jsonArray.size(); i++) {
			// jsonObject = (JSONObject) jsonArray.get(i);
			//
			// checkPoint = new CheckPoint();
			// checkPoint.setData(new ArrayList<String>());
			//
			// checkPoint.setVersion((String) jsonObject.get("version"));
			// jsArray = new JSONArray();
			//
			// String type[] = { "data" };
			//
			// for (int l = 0; l < type.length; l++) {
			//
			// jsArray = (JSONArray) jsonObject.get(type[l]);
			//
			// for (int j = 0; j < jsArray.size(); j++) {
			// checkPoint.getData().add((String) jsArray.get(j));
			// }
			// }
			//
			// workbook.getCheckPoints().add(checkPoint);
			// }
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return workbook;
	}

	public Workbook getWorkbookLinks(int userId) {

		Workbook workbook = new Workbook();
		try {
			Link link = new Link();
			Section section = new Section();
			getCurrentSubSection(section, userId, true);
			int sectionId = section.getCurrentSection();
			int subSectionId = section.getCurrentSubSection();
			link.setsId("" + sectionId);
			link.setSsId("" + subSectionId);

			workbook.setLink(link);
			// JSONParser parser = new JSONParser();
			// Object obj = parser.parse(new FileReader(Path.SECTION_PATH +
			// "workbookLinks.json"));
			// JSONArray jsonArray = (JSONArray) obj;

			JSONArray jsonArray = JSONFile.readJSONArray(Path.SECTION_PATH + "workbookLinks.json");

			JSONObject jsonObject;
			JSONArray jsArray;
			JSONObject jsObject;
			String str = "";
			workbook.setLinks(new ArrayList<String>());
			for (int i = 0; i < jsonArray.size(); i++) {
				jsonObject = (JSONObject) jsonArray.get(i);
				
				
				
				int sId = Integer.parseInt((String) jsonObject.get("sId"));
				
				if (sectionId > sId) {
					
					jsArray = (JSONArray) jsonObject.get("links");
					for (int j = 0; j < jsArray.size(); j++) {
						jsObject = (JSONObject) jsArray.get(j);
						int ssId = Integer.parseInt((String) jsObject.get("ssId"));
						str = (String) jsObject.get("str");
						workbook.getLinks().add("sections/" + sId + "/subsections/" + ssId + "/" + str);
					}
				} else if (sectionId == sId) {
					
					jsArray = (JSONArray) jsonObject.get("links");
					for (int j = 0; j < jsArray.size(); j++) {
						jsObject = (JSONObject) jsArray.get(j);
						int ssId = Integer.parseInt((String) jsObject.get("ssId"));
						if (subSectionId >= ssId) {
							str = (String) jsObject.get("str");
							workbook.getLinks().add("sections/" + sId + "/subsections/" + ssId + "/" + str);
						}
					}
				}
			}
		} catch (Exception e) {
			return null;
		}
		return workbook;
	}

	public Workbook getPracticePoint3Workbook(String userId, String sectionId, String subSectionId) {

		// System.out.println("\tUS Method : getPracticePoint3Workbook");
		JSONArray jsonArray = new JSONArray();
		JSONArray jsArray;
		JSONObject jsonObject;
		JSONObject jsObject;

		Workbook workbook = new Workbook();
		workbook.setPracticePoints(new ArrayList<PracticePoint>());

		try {

			// JSONParser jsonParser = new JSONParser();
			String path = PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
					+ "/subsection.json";
			// Object obj = jsonParser.parse(new FileReader(path));
			// jsonArray = (JSONArray) obj;

			jsonArray = JSONFile.readJSONArray(path);

			Activity activity;

			PracticePoint practicePoint;

			for (int i = 0; i < jsonArray.size(); i++) {
				jsonObject = (JSONObject) jsonArray.get(i);

				practicePoint = new PracticePoint();
				// practicePoint.setActivities(new ArrayList<Activity>());
				practicePoint.setMastery_oriented(new ArrayList<Activity>());
				practicePoint.setPleasurable(new ArrayList<Activity>());
				practicePoint.setMeaningful(new ArrayList<Activity>());
				practicePoint.setPlanner(new ArrayList<Activity>());

				practicePoint.setVersion((String) jsonObject.get("version"));
				jsArray = new JSONArray();

				String type[] = { "pleasurable", "meaningful", "mastery-oriented" };

				for (int l = 0; l < type.length; l++) {
					// System.out.println(type[l]);
					jsArray = (JSONArray) jsonObject.get(type[l]);

					for (int j = 0; j < jsArray.size(); j++) {
						jsObject = (JSONObject) jsArray.get(j);

						activity = new Activity();
						activity.setActivity((String) jsObject.get("activity"));
						activity.setFrequency((String) jsObject.get("frequency"));
						activity.setScale((String) jsObject.get("scale"));
						// activity.setType((String) jsObject.get("type"));

						if (l == 0)
							practicePoint.getPleasurable().add(activity);
						else if (l == 1)
							practicePoint.getMeaningful().add(activity);
						else if (l == 2)
							practicePoint.getMastery_oriented().add(activity);
						// practicePoint.getActivities().add(activity);
					}
				}

				jsArray = new JSONArray();
				jsArray = (JSONArray) jsonObject.get("planner");

				for (int j = 0; j < jsArray.size(); j++) {
					jsObject = (JSONObject) jsArray.get(j);

					activity = new Activity();
					activity.setActivity((String) jsObject.get("activity"));
					activity.setType((String) jsObject.get("type"));
					activity.setDay((String) jsObject.get("day"));

					practicePoint.getPlanner().add(activity);
				}

				workbook.getPracticePoints().add(practicePoint);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return workbook;
	}

	public Workbook getPracticePoint4Workbook(String userId, String sectionId, String subSectionId) {

		// System.out.println("\tUS Method : getPracticePoint4Workbook");

		Workbook workbook = new Workbook();
		workbook.setPracticePoints(new ArrayList<PracticePoint>());

		try {

			String sql = "SELECT `response`,`version_id` FROM `sections` WHERE `user_id`=? and `section_id` = ? and `sub_section_id`= ?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setString(1, userId);
			pstatement.setString(2, sectionId);
			pstatement.setString(3, subSectionId);
			ResultSet result = pstatement.executeQuery();
			PracticePoint practicePoint;
			while (result.next()) {
				// System.out.println(result.getString("response"));
				practicePoint = new PracticePoint();
				practicePoint.setData(new ArrayList<String>());
				practicePoint.setVersion(Integer.toString(result.getInt("version_id")));
				practicePoint.getData().add(result.getString("response"));
				// practicePoint.setSection_id(Integer.toString(sectionId));
				// practicePoint.setData(result.getString("response");
				workbook.getPracticePoints().add(practicePoint);
			}
			//

			// JSONParser jsonParser = new JSONParser();
			// String path = PATH + userId + "/sections/section" + sectionId +
			// "/subsection" + subSectionId
			// + "/subsection.json";
			// System.out.println(path);
			//
			// JSONArray jsonArray = new JSONArray();
			// JSONArray jsArray;
			// JSONObject jsonObject;
			// //Object obj = jsonParser.parse(new FileReader(path));
			// //jsonArray = (JSONArray) obj;
			// System.out.println("coming to here json");
			// jsonArray = JSONFile.readJSONArray(path);
			// System.out.println("jsonArray"+jsonArray);
			// PracticePoint practicePoint;
			//
			// for (int i = 0; i < jsonArray.size(); i++) {
			// jsonObject = (JSONObject) jsonArray.get(i);
			//
			// practicePoint = new PracticePoint();
			// practicePoint.setData(new ArrayList<String>());
			//
			// practicePoint.setVersion((String) jsonObject.get("version"));
			// jsArray = new JSONArray();
			//
			// String type[] = { "data" };
			//
			// System.out.println("type "+type);
			//
			// for (int l = 0; l < type.length; l++) {
			//
			// jsArray = (JSONArray) jsonObject.get(type[l]);
			//
			// for (int j = 0; j < jsArray.size(); j++) {
			// practicePoint.getData().add((String) jsArray.get(j));
			// }
			// }
			//
			// workbook.getPracticePoints().add(practicePoint);
			// }
			//

			System.out.println(workbook);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return workbook;
	}

	public void setWeeklyPlanner(String userId, String sectionId, String subSectionId, List<String> arr, int version) {
		// System.out.println("\tUS Method : setWeeklyPlanner");
		JSONArray jsonArray = new JSONArray();
		// JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = new JSONObject();
		// Object obj;
		String type = "";
		String day = "";
		try {
			// obj = jsonParser.parse(new FileReader(PATH + userId +
			// "/sections/section" + sectionId + "/subsection"
			// + subSectionId + "/subsection.json"));
			// jsonArray = (JSONArray) obj;

			jsonArray = JSONFile.readJSONArray(PATH + userId + "/sections/section" + sectionId + "/subsection"
					+ subSectionId + "/subsection.json");

			JSONArray jsArray;
			JSONObject jsObject;
			for (int i = 0; i < jsonArray.size(); i++) {
				jsonObject = (JSONObject) jsonArray.get(i);
				if (version == Integer.parseInt((String) jsonObject.get("version"))) {
					jsArray = (JSONArray) jsonObject.get("planner");
					for (String string : arr) {
						StringTokenizer st = new StringTokenizer(string, "_");
						String v1 = st.nextToken();
						String v2 = st.nextToken();
						String v3 = st.nextToken();
						switch (v2) {
						case "p":
							type = "Pleasurable";
							break;
						case "m":
							type = "Meaningful";
							break;
						case "mo":
							type = "Mastery-Oriented";
							break;
						}
						switch (v3) {
						case "1":
							day = "Monday";
							break;
						case "2":
							day = "Tuesday";
							break;
						case "3":
							day = "Wednesday";
							break;
						case "4":
							day = "Thursday";
							break;
						case "5":
							day = "Friday";
							break;
						case "6":
							day = "Saturday";
							break;
						case "7":
							day = "Sunday";
							break;
						}
						jsObject = new JSONObject();
						jsObject.put("activity", v1);
						jsObject.put("type", type);
						jsObject.put("day", day);

						jsArray.add(jsObject);
					}
					jsonObject.put("planner", jsArray);
				}
				jsonArray.set(i, jsonObject);
			}
			try {
				FileWriter fileWriter = new FileWriter(PATH + userId + "/sections/section" + sectionId + "/subsection"
						+ subSectionId + "/subsection.json");
				fileWriter.write(jsonArray.toJSONString());
				fileWriter.close();
			} catch (Exception e) {
				e.printStackTrace();
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Section Activities
	
	public int setPracticePoint3New(String userId, String sectionId, String subSectionId, JSONArray jsonArray2,
			String type) {

		JSONArray jsonArray;
		// Object obj = null;

		try {
			// jsonParser = new JSONParser();
			// obj = jsonParser.parse(new FileReader(PATH + userId +
			// "/sections/section" + sectionId + "/subsection"
			// + subSectionId + "/subsection.json"));

			jsonArray = JSONFile.readJSONArray(PATH + userId + "/sections/section" + sectionId + "/subsection"
					+ subSectionId + "/subsection.json");

		} catch (Exception e) {
			File file = new File(PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
					+ "/subsection.json");
			try {

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("version", "1");
				jsonObject.put("pleasurable", new JSONArray());
				jsonObject.put("meaningful", new JSONArray());
				jsonObject.put("mastery-oriented", new JSONArray());
				jsonObject.put(type, jsonArray2);
				jsonObject.put("planner", new JSONArray());

				jsonArray = new JSONArray();
				jsonArray.add(jsonObject);

				file.createNewFile();
				FileWriter fileWriter = new FileWriter(file);
				fileWriter.write(jsonArray.toJSONString());
				fileWriter.close();
				return 1;
			} catch (Exception e1) {
				e1.printStackTrace();
				return 0;
			}
		}

		// jsonArray = (JSONArray) obj;
		JSONObject jsonObject;
		int version = 0;
		for (int j = 0; j < jsonArray.size(); j++) {
			jsonObject = (JSONObject) jsonArray.get(j);
			version = Integer.parseInt((String) jsonObject.get("version"));
		}
		version++;

		jsonObject = new JSONObject();
		jsonObject.put("version", "" + version);
		jsonObject.put("pleasurable", new JSONArray());
		jsonObject.put("meaningful", new JSONArray());
		jsonObject.put("mastery-oriented", new JSONArray());
		jsonObject.put(type, jsonArray2);
		jsonObject.put("planner", new JSONArray());

		jsonArray.add(jsonObject);

		try {
			FileWriter fileWriter = new FileWriter(PATH + userId + "/sections/section" + sectionId + "/subsection"
					+ subSectionId + "/subsection.json");
			fileWriter.write(jsonArray.toJSONString());
			fileWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return version;
	}

	public int setPracticePoint3Continue(String userId, String sectionId, String subSectionId, JSONArray jsonArray2,
			String type, int version) {

		// System.out.println("US : setPracticePoint3Continue");
		int temp = 0;
		try {

			// JSONParser jsonParser = new JSONParser();
			// Object obj = jsonParser.parse(new FileReader(PATH + userId +
			// "/sections/section" + sectionId + "/subsection"
			// + subSectionId + "/subsection.json"));
			// JSONArray jsonArray = (JSONArray) obj;

			JSONArray jsonArray = JSONFile.readJSONArray(PATH + userId + "/sections/section" + sectionId + "/subsection"
					+ subSectionId + "/subsection.json");

			JSONArray jsonArray3 = new JSONArray();
			JSONObject jsonObject;
			for (int j = 0; j < jsonArray.size(); j++) {
				jsonObject = (JSONObject) jsonArray.get(j);
				temp = Integer.parseInt((String) jsonObject.get("version"));

				if (temp == version) {
					jsonArray3 = new JSONArray();
					for (int i = 0; i < jsonArray2.size(); i++) {
						jsonArray3.add(jsonArray2.get(i));
					}
					jsonObject.put(type, jsonArray3);
					// jsonArray3.add(jsonArray2);
				}
				jsonArray.set(j, jsonObject);
			}
			try {
				FileWriter fileWriter = new FileWriter(PATH + userId + "/sections/section" + sectionId + "/subsection"
						+ subSectionId + "/subsection.json");
				fileWriter.write(jsonArray.toJSONString());
				fileWriter.close();
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return temp;
	}

	public Workbook setPracticePoint3(String userId, String sectionId, String subSectionId, int pageNo,
			List<String> act, List<String> freq, List<Integer> scale, int version) {

		// System.out.println("\tUS Method : setPracticePoint3");
		int flag = 0;
		Workbook workbook = new Workbook();
		try {

			JSONArray jsonArray2 = new JSONArray();

			String frequency = "";

			int i = 0;
			String type = "";
			switch (pageNo) {
			case 1:
				type = "pleasurable";
				break;
			case 2:
				type = "meaningful";
				break;
			case 3:
				type = "mastery-oriented";
				break;
			}
			for (String string : act) {

				for (int j = 0; j < freq.size(); j++) {
					StringTokenizer st = new StringTokenizer(freq.get(j), "_");
					int v1 = Integer.parseInt(st.nextToken());
					int v2 = Integer.parseInt(st.nextToken());
					if (v1 == i + 1) {
						switch (v2) {
						case 1:
							frequency = "Daily";
							break;
						case 2:
							frequency = "A Few Times a Week";
							break;
						case 3:
							frequency = "Once a Week";
							break;
						case 4:
							frequency = "Less Than Once a Week";
							break;
						}
						break;
					}
				}

				JSONObject jsonObject2 = new JSONObject();
				jsonObject2.put("activity", string);
				jsonObject2.put("frequency", frequency);
				jsonObject2.put("scale", "" + scale.get(i));
				jsonArray2.add(jsonObject2);
				i++;
			}
			if (version == 0)
				flag = setPracticePoint3New(userId, sectionId, subSectionId, jsonArray2, type);
			else
				flag = setPracticePoint3Continue(userId, sectionId, subSectionId, jsonArray2, type, version);

			workbook.setVersion(flag);
		} catch (Exception e) {
			// setPracticePoint3New(userId, sectionId, subSectionId, jsonArray);
			e.printStackTrace();
			workbook.setVersion(0);
			return workbook;
		}
		return workbook;
	}

	public Workbook getPotentialList(String userId, String sectionId, String subSectionId) {

		System.out.println("\tUS Method : getPotentialList" + sectionId + "hhhhh" + subSectionId);

		JSONArray jsonArray = new JSONArray();
		JSONArray jsArray;
		JSONObject jsonObject;
		JSONObject jsObject;

		Workbook workbook = new Workbook();
		workbook.setPracticePoints(new ArrayList<PracticePoint>());

		try {

			// JSONParser jsonParser = new JSONParser();

			String path = PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
					+ "/subsection.json";
			// Object obj = jsonParser.parse(new FileReader(path));
			// jsonArray = (JSONArray) obj;

			jsonArray = JSONFile.readJSONArray(path);

			Activity activity;

			PracticePoint practicePoint;

			for (int i = 0; i < jsonArray.size(); i++) {

				jsonObject = (JSONObject) jsonArray.get(i);

				practicePoint = new PracticePoint();
				practicePoint.setActivities(new ArrayList<Activity>());
				practicePoint.setVersion((String) jsonObject.get("version"));
				jsArray = new JSONArray();

				String type[] = { "pleasurable", "meaningful", "mastery-oriented" };

				for (int l = 0; l < type.length; l++) {

					jsArray = (JSONArray) jsonObject.get(type[l]);

					for (int j = 0; j < jsArray.size(); j++) {
						jsObject = (JSONObject) jsArray.get(j);

						activity = new Activity();
						activity.setActivity((String) jsObject.get("activity"));
						activity.setFrequency((String) jsObject.get("frequency"));
						String v2 = (String) jsObject.get("frequency");
						int frequency = 0;
						switch (v2) {
						case "Daily":
							frequency = 1;
							break;
						case "A Few Times a Week":
							frequency = 2;
							break;
						case "Once a Week":
							frequency = 3;
							break;
						case "Less Than Once a Week":
							frequency = 4;
							break;
						}

						activity.setFrequency("" + frequency);
						activity.setScale((String) jsObject.get("scale"));

						if (l == 0)
							activity.setType("P");
						else if (l == 1)
							activity.setType("M");
						else if (l == 2)
							activity.setType("MO");

						practicePoint.getActivities().add(activity);
					}
				}

				Collections.sort(practicePoint.getActivities(), new Comparator<Activity>() {
					@Override
					public int compare(Activity o1, Activity o2) {
						return Integer.parseInt(o2.getFrequency()) - Integer.parseInt(o1.getFrequency());
					}
				});

				List<Activity> activities = new ArrayList<>();
				List<Activity> tempActivities = new ArrayList<>();

				Activity activity2 = practicePoint.getActivities().get(0);
				String tempFreq = activity2.getFrequency();
				String prevFreq = tempFreq;
				activities.add(activity2);

				for (int j = 1; j < practicePoint.getActivities().size(); j++) {

					activity2 = practicePoint.getActivities().get(j);

					tempFreq = activity2.getFrequency();

					if (!prevFreq.equals(tempFreq)) {

						if (activities.size() > 0) {
							Collections.sort(activities, new Comparator<Activity>() {
								@Override
								public int compare(Activity o1, Activity o2) {
									return Integer.parseInt(o2.getScale()) - Integer.parseInt(o1.getScale());
								}
							});
							for (Activity activity3 : activities) {
								tempActivities.add(activity3);
							}
						}
						activities = new ArrayList<>();
					}
					activities.add(activity2);
					prevFreq = tempFreq;
				}

				if (activities.size() > 0) {
					Collections.sort(activities, new Comparator<Activity>() {
						@Override
						public int compare(Activity o1, Activity o2) {
							return Integer.parseInt(o2.getScale()) - Integer.parseInt(o1.getScale());
						}
					});
					for (Activity activity3 : activities) {
						tempActivities.add(activity3);
					}
				}

				/*
				 * System.out.println("After Sorting");
				 * 
				 * for (Activity activity3 : tempActivities) {
				 * System.out.println(activity3.getActivity() + " " +
				 * activity3.getFrequency() + " " + activity3.getScale()); }
				 */
				practicePoint.setActivities(new ArrayList<>(tempActivities));

				workbook.getPracticePoints().add(practicePoint);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return workbook;
	}

	public int setPracticePoint4New(String userId, String sectionId, String subSectionId, JSONArray jsonArray2,
			String type) {

		// System.out.println("US : setPracticePoint4New");
		JSONArray jsonArray;
		// Object obj = null;
		String path = PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
				+ "/subsection.json";
		//// System.out.println("path:"+path);

		try {
			// JSONParser jsonParser = new JSONParser();
			// obj = jsonParser.parse(new FileReader(path));
			jsonArray = JSONFile.readJSONArray(path);

		} catch (Exception e) {
			File file = new File(path);
			try {

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("version", "1");
				jsonObject.put(type, jsonArray2);

				jsonArray = new JSONArray();
				jsonArray.add(jsonObject);

				file.createNewFile();
				FileWriter fileWriter = new FileWriter(file);
				fileWriter.write(jsonArray.toJSONString());
				fileWriter.close();
				return 1;
			} catch (Exception e1) {
				e1.printStackTrace();
				return 0;
			}
		}

		// jsonArray = (JSONArray) obj;
		JSONObject jsonObject;
		int version = 0;
		for (int j = 0; j < jsonArray.size(); j++) {
			jsonObject = (JSONObject) jsonArray.get(j);
			version = Integer.parseInt((String) jsonObject.get("version"));
			// System.out.println(jsonObject);
			// System.out.println(version);
			// System.out.println("Hi...");
		}

		if (sectionId.equals("3")) {
			if (subSectionId.equals("7")) {
				// if 3.7
				// get the last element of jsonArray
				JSONObject lastObj = (JSONObject) jsonArray.get(jsonArray.size() - 1);
				JSONArray dataArr = (JSONArray) lastObj.get("data");
				String firstSt = (String) dataArr.get(0);
				String[] arrSt = firstSt.split("_");

				// System.out.println("data:"+dataArr);
				// System.out.println("firstst:"+firstSt);
				// System.out.println("lastone");
				// System.out.println("word:"+arrSt[3]);
				if (arrSt[3].equals("dummy")) {
					jsonArray.remove(jsonArray.size() - 1);
					// System.out.println("Dummy is deleted");
					version--;
					// if this has the substring Dummy
					// dont increment version
				}
			}
		}

		// all other sections
		version++;

		jsonObject = new JSONObject();
		jsonObject.put("version", "" + version);
		jsonObject.put(type, jsonArray2);

		jsonArray.add(jsonObject);

		try {
			FileWriter fileWriter = new FileWriter(path);
			fileWriter.write(jsonArray.toJSONString());
			fileWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return version;
	}

	public int setPracticePoint4Continue(String userId, String sectionId, String subSectionId, JSONArray jsonArray2,
			String type, int version) {

		// System.out.println("US : setPracticePoint4Continue");
		int temp = 0;
		String path = PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
				+ "/subsection.json";
		try {

			// JSONParser jsonParser = new JSONParser();
			// Object obj = jsonParser.parse(new FileReader(path));
			// JSONArray jsonArray = (JSONArray) obj;

			JSONArray jsonArray = JSONFile.readJSONArray(path);

			JSONArray jsonArray3;
			JSONObject jsonObject;
			for (int j = 0; j < jsonArray.size(); j++) {
				jsonObject = (JSONObject) jsonArray.get(j);
				temp = Integer.parseInt((String) jsonObject.get("version"));

				jsonArray3 = new JSONArray();

				if (temp == version) {
					for (int i = 0; i < jsonArray2.size(); i++) {
						jsonArray3.add(jsonArray2.get(i));
					}
					// jsonArray3.add(jsonArray2);
				}
				jsonObject.put(type, jsonArray3);
				jsonArray.set(j, jsonObject);
			}
			try {
				FileWriter fileWriter = new FileWriter(path);
				fileWriter.write(jsonArray.toJSONString());
				fileWriter.close();
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return temp;
	}

	public Workbook setPracticePoint4(String userId, String sectionId, String subSectionId, List<String> data,
			int version) throws SQLException {
		// System.out.println(sectionId);
		int sid = Integer.parseInt(sectionId);
		int ssid = Integer.parseInt(subSectionId);
		int uid = Integer.parseInt(userId);
		if (sid == 3 && ssid == 4) {
			int flag = 0;
			Workbook workbook = new Workbook();
			try {
				System.out.println("step 1");
				String sql4 = "SELECT `sections_pk_id`,`response` FROM `sections` WHERE `user_id`=? and `section_id`=? and `sub_section_id`=? and `category_id`=?";
				PreparedStatement pstatement2;
				pstatement2 = connection.prepareStatement(sql4);
				pstatement2.setInt(1, uid);
				pstatement2.setInt(2, sid);
				pstatement2.setInt(3, ssid);

				pstatement2.setString(4, "2c1");
				ResultSet result = pstatement2.executeQuery();
				int p_id = 0;
				String responseStr = "";
				while (result.next()) {

					p_id = result.getInt("sections_pk_id");
					responseStr = result.getString("response");

				}
				System.out.println("step 1 verfy " + p_id + " ---rs---  " + responseStr);

				if (p_id != 0) {
					// code for if hesubmits 2nd colum in 3.4 section
					System.out.println("step 2");
					String sql7 = "UPDATE `sections` SET `response` = ?, `category_id`=? WHERE `sections_pk_id` = "
							+ p_id;
					PreparedStatement pstatement4;
					pstatement4 = connection.prepareStatement(sql7);
					String resString = responseStr + data;
					System.out.println("tttttt-  "+resString);
					pstatement4.setString(1, resString);
					pstatement4.setString(2, "2a");

					pstatement4.executeUpdate();

					// unknown code to set version
					JSONArray jsonArray2 = new JSONArray();

					String type = "";

					for (String string : data) {
						jsonArray2.add(string);
					}

					type = "data";

					if (version == 0)
						flag = setPracticePoint4New(userId, sectionId, subSectionId, jsonArray2, type);
					else
						flag = setPracticePoint4Continue(userId, sectionId, subSectionId, jsonArray2, type, version);

					workbook.setVersion(flag);

				} else {

					// code for if hesubmits first colum in 3.4 section
					String sql = "SELECT count(*) as `sumOfVersion` FROM `sections` WHERE `section_id`= ? AND `sub_section_id` = ? AND`user_id`= ?";
					System.out.println("step 3");
					PreparedStatement pstatement;
					pstatement = connection.prepareStatement(sql);
					pstatement.setString(1, sectionId);
					pstatement.setString(2, subSectionId);
					pstatement.setString(3, userId);
					ResultSet result2 = pstatement.executeQuery();
					int verNum = 0;
					while (result2.next()) {

						verNum = result2.getInt("sumOfVersion");

					}

					PreparedStatement pstatement1;
					String sql1 = "INSERT INTO `sections` (`user_id`, `section_id`,`category_id`,`sub_section_id`, `version_id`, `response`) VALUES (?, ?, ?, ?, ?, ?)";
					pstatement1 = connection.prepareStatement(sql1);
					pstatement1.setInt(1, Integer.parseInt(userId));
					pstatement1.setInt(2, Integer.parseInt(sectionId));
					pstatement1.setString(3, "2c1");
					pstatement1.setInt(4, Integer.parseInt(subSectionId));
					pstatement1.setInt(5, (verNum + 1));

					String data1 = data.toString();
					data1 = data1.replace('"', '[');
					data1 = data1.replace('"', ']');
					// System.out.println("data1 "+data1);
					pstatement1.setString(6, data1);
					pstatement1.executeUpdate();

					// unknown code to set version
					JSONArray jsonArray2 = new JSONArray();

					String type = "";

					for (String string : data) {
						jsonArray2.add(string);
					}

					type = "data";

					if (version == 0)
						flag = setPracticePoint4New(userId, sectionId, subSectionId, jsonArray2, type);
					else
						flag = setPracticePoint4Continue(userId, sectionId, subSectionId, jsonArray2, type, version);

					workbook.setVersion(flag);

				}

			} catch (Exception e) {
				// setPracticePoint3New(userId, sectionId, subSectionId,
				// jsonArray);
				e.printStackTrace();
				// workbook.setVersion(0);
				// return workbook;
			}

		} else {

			System.out.println("step 4");

			// System.out.println("\tUS Method : setPracticePoint4"+version);
			int flag = 0;
			Workbook workbook = new Workbook();
			try {

				// code for database:
				String sql = "SELECT count(*) as `sumOfVersion` FROM `sections` WHERE `section_id`= ? AND `sub_section_id` = ? AND`user_id`= ?";
				System.out.println("sql   " + sql);
				PreparedStatement pstatement;
				pstatement = connection.prepareStatement(sql);
				pstatement.setString(1, sectionId);
				pstatement.setString(2, subSectionId);
				pstatement.setString(3, userId);
				ResultSet result = pstatement.executeQuery();
				int verNum = 0;
				while (result.next()) {

					verNum = result.getInt("sumOfVersion");

				}

				PreparedStatement pstatement1;
				String sql1 = "INSERT INTO `sections` (`user_id`, `section_id`,`sub_section_id`, `version_id`, `response`) VALUES ( ?, ?, ?, ?, ?)";
				pstatement1 = connection.prepareStatement(sql1);
				pstatement1.setInt(1, Integer.parseInt(userId));
				pstatement1.setInt(2, Integer.parseInt(sectionId));
				pstatement1.setInt(3, Integer.parseInt(subSectionId));
				pstatement1.setInt(4, (verNum + 1));

				String data1 = data.toString();
				data1 = data1.replace('"', '[');
				data1 = data1.replace('"', ']');
				System.out.println("data1 " + data1);
				pstatement1.setString(5, data1);
				pstatement1.executeUpdate();

				JSONArray jsonArray2 = new JSONArray();

				String type = "";

				for (String string : data) {
					jsonArray2.add(string);
				}

				type = "data";

				if (version == 0)
					flag = setPracticePoint4New(userId, sectionId, subSectionId, jsonArray2, type);
				else
					flag = setPracticePoint4Continue(userId, sectionId, subSectionId, jsonArray2, type, version);

				workbook.setVersion(flag);
			} catch (Exception e) {
				// setPracticePoint3New(userId, sectionId, subSectionId,
				// jsonArray);
				e.printStackTrace();
				workbook.setVersion(0);
				return workbook;
			}

			return workbook;
		}
		return null;

	}

	public int setCheckPoint3New(String userId, String sectionId, String subSectionId, JSONArray jsonArray2,
			String type) {

		// System.out.println("US : setCheckPoint3New");
		JSONArray jsonArray;
		// Object obj = null;
		String path = PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
				+ "/subsection.json";
		// System.out.println(path);

		try {
			// JSONParser jsonParser = new JSONParser();
			// obj = jsonParser.parse(new FileReader(path));
			// jsonArray = (JSONArray) obj;

			jsonArray = JSONFile.readJSONArray(path);

		} catch (Exception e) {
			File file = new File(path);
			try {

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("version", "1");
				jsonObject.put(type, jsonArray2);

				jsonArray = new JSONArray();
				jsonArray.add(jsonObject);

				file.createNewFile();
				FileWriter fileWriter = new FileWriter(file);
				fileWriter.write(jsonArray.toJSONString());
				fileWriter.close();
				return 1;
			} catch (Exception e1) {
				e1.printStackTrace();
				return 0;
			}
		}

		JSONObject jsonObject;
		int version = 0;
		for (int j = 0; j < jsonArray.size(); j++) {
			jsonObject = (JSONObject) jsonArray.get(j);
			version = Integer.parseInt((String) jsonObject.get("version"));
		}
		version++;

		jsonObject = new JSONObject();
		jsonObject.put("version", "" + version);
		jsonObject.put(type, jsonArray2);

		jsonArray.add(jsonObject);

		try {
			FileWriter fileWriter = new FileWriter(path);
			fileWriter.write(jsonArray.toJSONString());
			fileWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return version;
	}

	public int setCheckPoint3Continue(String userId, String sectionId, String subSectionId, JSONArray jsonArray2,
			String type, int version) {

		// System.out.println("US : setCheckPoint3Continue");
		int temp = 0;
		String path = PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
				+ "/subsection.json";
		try {

			// JSONParser jsonParser = new JSONParser();
			// Object obj = jsonParser.parse(new FileReader(path));
			// JSONArray jsonArray = (JSONArray) obj;

			JSONArray jsonArray = JSONFile.readJSONArray(path);

			JSONArray jsonArray3;
			JSONObject jsonObject;
			for (int j = 0; j < jsonArray.size(); j++) {
				jsonObject = (JSONObject) jsonArray.get(j);
				temp = Integer.parseInt((String) jsonObject.get("version"));

				jsonArray3 = (JSONArray) jsonObject.get(type);

				if (temp == version) {
					for (int i = 0; i < jsonArray2.size(); i++) {
						jsonArray3.add(jsonArray2.get(i));
					}
					// jsonArray3.add(jsonArray2);
				}
				jsonObject.put(type, jsonArray3);
				jsonArray.set(j, jsonObject);
			}
			try {
				FileWriter fileWriter = new FileWriter(path);
				fileWriter.write(jsonArray.toJSONString());
				fileWriter.close();
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return temp;
	}

	public Workbook setCheckPoint3(String userId, String sectionId, String subSectionId, List<String> data,
			int version) {
		System.out.println("dataOf111  " + data);

		Workbook workbook = new Workbook();
		try {

			// code for database:
			String sql = "SELECT count(*) as `sumOfVersion` FROM `sections` WHERE `section_id`= ? AND `sub_section_id` = ? AND`user_id`= ?";
			System.out.println("sql   " + sql);
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setString(1, sectionId);
			pstatement.setString(2, subSectionId);
			pstatement.setString(3, userId);
			ResultSet result = pstatement.executeQuery();
			int verNum = 0;
			while (result.next()) {

				verNum = result.getInt("sumOfVersion");

			}

			PreparedStatement pstatement1;
			String sql1 = "INSERT INTO `sections` (`user_id`, `section_id`,`sub_section_id`, `version_id`, `response`) VALUES ( ?, ?, ?, ?, ?)";
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setInt(1, Integer.parseInt(userId));
			pstatement1.setInt(2, Integer.parseInt(sectionId));
			pstatement1.setInt(3, Integer.parseInt(subSectionId));
			pstatement1.setInt(4, (verNum + 1));

			String data1 = data.toString();

			System.out.println("data1 " + data1);
			pstatement1.setString(5, data1);
			// pstatement1.setString(6,null);
			pstatement1.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			workbook.setVersion(0);
			return workbook;
		}

		// //System.out.println("\tUS Method : setCheckPoint3");
		// int flag = 0;
		// Workbook workbook = new Workbook();
		// try {
		//
		// JSONArray jsonArray2 = new JSONArray();
		//
		// String type = "";
		//
		// for (String string : data) {
		// jsonArray2.add(string);
		// }
		//
		// type = "data";
		//
		// if (version == 0)
		// flag = setCheckPoint3New(userId, sectionId, subSectionId, jsonArray2,
		// type);
		// else
		// flag = setCheckPoint3Continue(userId, sectionId, subSectionId,
		// jsonArray2, type, version);
		//
		// workbook.setVersion(flag);
		// } catch (Exception e) {
		// e.printStackTrace();
		// workbook.setVersion(0);
		// return workbook;
		// }
		return workbook;
	}

	public void setToolBox2(String userId, String sectionId, String subSectionId, List<String> data, List<String> check,
			int version) {

		// System.out.println("\tUS Method : setToolBox2");
		try {

			JSONArray jsonArray2 = new JSONArray();

			JSONObject jsonObject;

			int i = 1;
			for (String string : check) {
				jsonObject = new JSONObject();
				jsonObject.put("quesNo", "" + i);
				jsonObject.put("ans", string);
				if (data.size() >= i)
					jsonObject.put("exp", data.get(i - 1));
				jsonArray2.add(jsonObject);
				i++;
			}

			jsonObject = new JSONObject();
			jsonObject.put("data", jsonArray2);
			jsonObject.put("version", "" + version);

			writeObjectToFile(jsonObject, Integer.parseInt(userId), Integer.parseInt(sectionId),
					Integer.parseInt(subSectionId));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setDiscoveryPoint(List<String> check, String userId, String sectionId, String subSectionId) {

		 System.out.println("\tUS Method : setDiscoveryPoint");

		try {
			
			
			
//			PreparedStatement pstatement3;
//			String sql3  = "UPDATE `stats` SET `currentSection`=? WHERE `user_id`=?";
//			pstatement3 = connection.prepareStatement(sql3);
//			pstatement3.setString(1, sectionId);
//			//pstatement3.setString(2, 2);
//			pstatement3.setInt(3, Integer.parseInt(userId));
//			int result3 = pstatement3.executeUpdate();
			
			

			JSONObject jsonObject;
			JSONArray jsonArray = new JSONArray();

			int i = 1;
			for (String string : check) {
				jsonObject = new JSONObject();
				jsonObject.put("quesNo", "" + i);
				jsonObject.put("ans", string);
				jsonArray.add(jsonObject);
				i++;
			}

			writeArrayToFile(jsonArray, Integer.parseInt(userId), Integer.parseInt(sectionId),
					Integer.parseInt(subSectionId));

			// JSONParser parser = new JSONParser();
			// Object obj = parser.parse(new FileReader(PATH + userId +
			// "/stats.json"));
			// JSONObject jsonobject = (JSONObject) obj;
			
			System.out.println("currentSubSection updateing ");

			JSONObject jsonobject = JSONFile.readJSON(PATH + userId + "/stats.json");

			int temp = Integer.parseInt((String) jsonobject.get("currentSubSection"));
			temp++;
			File f = new File(PATH + userId + "/sections/section" + sectionId + "/subsection" + temp);
			if (f.exists() && f.isDirectory()) {
				jsonobject.put("currentSubSection", "4"); // "" + temp);
			} else {
				jsonobject.put("currentSubSection", "1");
				temp = Integer.parseInt((String) jsonobject.get("currentSection"));
				temp++;
				// System.out.println(temp);
				jsonobject.put("currentSection", "" + temp);
			}

			FileWriter fileWriter = new FileWriter(PATH + userId + "/stats.json");
			fileWriter.write(jsonobject.toJSONString());
			// System.out.println("Successfully Copied JSON Object to File...");
			// System.out.println("\nJSON Object: " + obj);
			fileWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setDiscoveryPoint5(List<String> check, String userId, String sectionId, String subSectionId,
			boolean suicide) {

		// System.out.println("\tUS Method : setDiscoveryPoint5");

		try {

			JSONObject jsonObject = new JSONObject();

			JSONArray jsonArray = new JSONArray();

			for (String j : check) {
				// System.out.println(j);
				jsonArray.add(j);
			}

			jsonObject.put("check", jsonArray);
			jsonObject.put("suicide", "" + suicide);

			File file = new File(PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
					+ "/subsection.json");
			file.createNewFile();
			FileWriter fileWriter = new FileWriter(file);
			fileWriter.write(jsonObject.toJSONString());
			fileWriter.close();

			// System.out.println("Successfully Copied JSON Object to File...");
			// System.out.println("\nJSON Object: " + jsonObject);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Workbook getWorkbook(String userId, String sectionId, String subSectionId) {

		// System.out.println("\tUS Method : getWorkbook");
		JSONArray jsArray;
		JSONObject jsonObject;

		Workbook workbook = new Workbook();
		workbook.setCheckPoints(new ArrayList<CheckPoint>());

		if (sectionId.equals("2") && subSectionId.equals("2")) {
			// System.out.println("file not exists 2.2");
			return null;
		}

		try {

			// JSONParser jsonParser = new JSONParser();
			String path = PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
					+ "/subsection.json";
			// Object obj = jsonParser.parse(new FileReader(path));
			// jsonObject = (JSONObject) obj;

			jsonObject = JSONFile.readJSON(path);
			CheckPoint checkPoint = new CheckPoint();
			checkPoint.setData(new ArrayList<String>());

			jsArray = new JSONArray();

			String type[] = { "data" };

			for (int l = 0; l < type.length; l++) {

				jsArray = (JSONArray) jsonObject.get(type[l]);

				for (int j = 0; j < jsArray.size(); j++) {
					checkPoint.getData().add((String) jsArray.get(j));
				}
			}

			workbook.getCheckPoints().add(checkPoint);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return workbook;
	}

	public void setWorkbook(String userId, String sectionId, String subSectionId, List<String> data) {

		// System.out.println("\tUS Method : setWorkbook");

		JSONArray jsonArray2 = new JSONArray();

		for (String string : data) {
			jsonArray2.add(string);
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", jsonArray2);

		writeObjectToFile(jsonObject, Integer.parseInt(userId), Integer.parseInt(sectionId),
				Integer.parseInt(subSectionId));

	}

	
	// Database services starts here
	public SectionData3 setSecton3Info(SectionData3 sectionData) {

		try {

			if (sectionData.getSection_id() == 3 && sectionData.getSub_section_id() == 4) {
				if (sectionData.getCategory_id().equals("2a")) {
					System.out.println("2a");
					PreparedStatement pstatement;
					String sql = "INSERT INTO `sections` (`user_id`, `section_id`,`sub_section_id`, `category_id`, `version_id`, `response`) VALUES (?, ?, ?, ?, ?, ?)";
					pstatement = connection.prepareStatement(sql);
					pstatement.setInt(1, sectionData.getUserId());
					pstatement.setInt(2, sectionData.getSection_id());
					pstatement.setInt(3, sectionData.getSub_section_id());
					pstatement.setString(4, sectionData.getCategory_id());
					pstatement.setInt(5, sectionData.getVersion_id());
					pstatement.setString(6, sectionData.getResponse());
					pstatement.executeUpdate();

				} else {
					System.out.println("2b");
					String sql = "SELECT `sections_pk_id`,`response` FROM `sections` WHERE `user_id` = ? AND `section_id` = ? AND `sub_section_id` = ? AND `category_id`= '2a'";
					System.out.println("sql   " + sql);
					PreparedStatement pstatement;
					pstatement = connection.prepareStatement(sql);
					pstatement.setInt(1, sectionData.getUserId());
					pstatement.setInt(2, sectionData.getSection_id());
					pstatement.setInt(3, sectionData.getSub_section_id());
					ResultSet result1 = pstatement.executeQuery();
					String verResponce = "";
					int sec_id = 0;
					while (result1.next()) {

						verResponce = result1.getString("response");
						sec_id = result1.getInt("sections_pk_id");
					}

					String sql1 = "UPDATE `sections` SET `response` = ? WHERE `sections_pk_id` = " + sec_id;
					PreparedStatement pstatement1;
					pstatement1 = connection.prepareStatement(sql1);
					String resString = verResponce + sectionData.getResponse();
					System.out.println(resString);
					pstatement1.setString(1, resString);
					pstatement1.executeUpdate();

				}

			} else {
				System.out.println("not 3.4");
				PreparedStatement pstatement;
				String sql = "INSERT INTO `sections` (`user_id`, `section_id`,`sub_section_id`, `category_id`, `version_id`, `response`) VALUES (?, ?, ?, ?, ?, ?)";
				pstatement = connection.prepareStatement(sql);
				pstatement.setInt(1, sectionData.getUserId());
				pstatement.setInt(2, sectionData.getSection_id());
				pstatement.setInt(3, sectionData.getSub_section_id());
				pstatement.setString(4, sectionData.getCategory_id());
				pstatement.setInt(5, sectionData.getVersion_id());
				pstatement.setString(6, sectionData.getResponse());
				pstatement.executeUpdate();
			}

			// return result;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sectionData;

	}

	public List<SectionData3> getSecton3Info(String userId, String sectionId, String subSectionId, int version) {
		 System.out.println("cameto DHCLIST-******--"+version);

		try {
			int version_id1 = 0;
			String sql1 = "SELECT max(`version_id`) as version_id1 FROM `sections` WHERE `section_id`= ? AND `sub_section_id` = ? AND`user_id`= ?";
			System.out.println("sql   " + sql1);
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setString(1, sectionId);
			pstatement1.setString(2, subSectionId);
			pstatement1.setString(3, userId);
			ResultSet result1 = pstatement1.executeQuery();
			if(result1.next()) {
				
				 version_id1 = result1.getInt("version_id1");
			}
			
			System.out.println("sql*****   " + version_id1);
			
			String sql = "SELECT * FROM `sections` WHERE `section_id`= ? AND `sub_section_id` = ? AND`user_id`= ? AND`version_id` = ?";
			PreparedStatement pstatement;
			pstatement = connection.prepareStatement(sql);
			pstatement.setString(1, sectionId);
			pstatement.setString(2, subSectionId);
			pstatement.setString(3, userId);
			pstatement.setInt(4, version_id1);
			ResultSet result = pstatement.executeQuery();
			List<SectionData3> sectionData3info = new ArrayList<SectionData3>();
			
			while (result.next()) {

				int userId1 = result.getInt("user_id");
				int section_id = result.getInt("section_id");
				int sub_section_id = result.getInt("sub_section_id");
				String category_id = result.getString("category_id");
				int version_id = result.getInt("version_id");
				String response = result.getString("response");
				
				String strtest2 =response;
				
				if(section_id == 3 && sub_section_id == 4) {
					String test = response; 
				    
					boolean isFound = test.contains("["); // true
					if(isFound) {
					String relpace_str1=","+"'"+'"'+"'";
					String strtest= relpace_str1.replace("'","");
					String strtest1 = test.replace('[','"');
					 strtest2 = strtest1.replace("]",strtest);
					}else {
						
						strtest2=test;
					}
					
					
					System.out.println("iFound--"+strtest2);
					
			}else if(section_id == 3 && sub_section_id == 6) {
				
				String test = response; 
			    
				boolean isFound = test.contains("["); // true
				if(isFound) {
				
				 String relpace_str1=","+"'"+'"'+"'";
				 String strtest= relpace_str1.replace("'","");
				 String strtest1 = test.replace('[','"');
				 String strtest3 = strtest1.replace("]",strtest);
				 strtest2 = strtest3.replace(" ","");
				}else {
					
					strtest2=test;
				}
				
				
			}else if((section_id == 4 && sub_section_id == 7) ) {
				
                String test = response; 
			    
				boolean isFound = test.contains("["); // true
				if(isFound) {
				
				 String relpace_str1=","+"'"+'"'+"'";
				 String strtest= relpace_str1.replace("'","");
				 String strtest1 = test.replace('[','"');
				 String strtest3 = strtest1.replace("]",strtest);
				 strtest2 = strtest3.replace(" ","");
				 
				}else {
					
					strtest2=test;
				}
				
				
			}else if((section_id == 5 && sub_section_id == 6) || (section_id == 5 && sub_section_id == 7)||(section_id == 6 && sub_section_id == 4)||(section_id == 6 && sub_section_id == 6)||(section_id == 7 && sub_section_id == 4)||(section_id == 7 && sub_section_id == 5)||(section_id == 8 && sub_section_id == 4)||(section_id == 8 && sub_section_id == 5)||(section_id == 9 && sub_section_id == 4)) {
				
               String test = response; 
			    
				boolean isFound = test.contains("["); // true
				if(isFound) {
				
				 String relpace_str1=","+"'"+'"'+"'";
				 String strtest= relpace_str1.replace("'","");
				 String strtest1 = test.replace('[','"');
				 String strtest3 = strtest1.replace("]",strtest);
				 strtest2 = strtest3.replace(" ","");
				 System.out.println("------ "+strtest2);
				 
				}else {
					
					strtest2=test;
				}
				
				
			}
				
				System.out.println("sqlResponce*****   " + strtest2+" userId1 "+userId1+" section_id "+section_id+"  "+sub_section_id);
				SectionData3 sectionData3info1 = new SectionData3(userId1, section_id, sub_section_id, version_id,
						strtest2, category_id);
				sectionData3info.add(sectionData3info1);

			}

			return sectionData3info;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	//3.2 section 
	public List<SectionData3> getSecton3InfoWB(String userId, String sectionId, String subSectionId) {
		// System.out.println("cameto DHCLIST"+report_date);

		try {
			
			List<List<SectionData3>> sectionData3info3 = new ArrayList<List<SectionData3>>(); 
			
			//List<SectionData3> sectionData3info2 = new ArrayList<SectionData3>();

			List<SectionData3> sectionData3info = new ArrayList<SectionData3>();
			
			String sql1 = "SELECT COUNT(*) as `version`,`version_id` FROM `sections` WHERE `section_id`= ? AND `sub_section_id` = ? AND`user_id`= ? GROUP BY `version_id`";
			PreparedStatement pstatement1;
			pstatement1 = connection.prepareStatement(sql1);
			pstatement1.setString(1, sectionId);
			pstatement1.setString(2, subSectionId); 
			pstatement1.setString(3, userId);
			ResultSet result1 = pstatement1.executeQuery();
			System.out.println("First Loop OUT");
			List<SectionData3> sectionData3info2 = new ArrayList<SectionData3>();
			//SectionData3 sectionData4 = new SectionData3();
					//int i = 0;
			while (result1.next()) {
				System.out.println("First Loop Inside");
				int versionId=result1.getInt("version_id");
				
				

				//sectionData3info.clear();
				String sql = "SELECT * FROM `sections` WHERE `section_id`= ? AND `sub_section_id` = ? AND`user_id`= ? and `version_id`=?";
				//System.out.println("sql3.2 work book   " + sql);
				PreparedStatement pstatement;
				pstatement = connection.prepareStatement(sql);
				pstatement.setString(1, sectionId);
				pstatement.setString(2, subSectionId);
				pstatement.setString(3, userId);
				pstatement.setInt(4, versionId);
				ResultSet result = pstatement.executeQuery();
				//System.out.println("versionId--"+result.last());
				//SectionData3 sectionData3info1 = null;
				//sectionData3info2.clear();
				
				
				System.out.println("Second Loop OUT");
				
				 //
				// sectionData3info2.clear();
				while (result.next()) {
					//
					
				//	System.out.println("sql 3.2 work book inside ----- " + result.getInt("user_id"));
					int userId1 = result.getInt("user_id");
					int section_id = result.getInt("section_id");
					int sub_section_id = result.getInt("sub_section_id");
					String category_id = result.getString("category_id");
					int version_id = result.getInt("version_id");
					String response = result.getString("response");
					
					System.out.println("Second Loop Inside  "+version_id);

					SectionData3 sectionData3info1 = new SectionData3(userId1, section_id, sub_section_id, version_id,response, category_id);
					 sectionData3info2.add(sectionData3info1);
					
					
				}
				//sectionData3info3.add(sectionData3info2);
				//sectionData3info2.clear();	
				
			}
			
			//System.out.println("------WB---------");
			
			
			
//			String sql = "SELECT * FROM `sections` WHERE `section_id`= ? AND `sub_section_id` = ? AND`user_id`= ?";
//			//System.out.println("sql3.2 work book   " + sql);
//			PreparedStatement pstatement;
//			pstatement = connection.prepareStatement(sql);
//			pstatement.setString(1, sectionId);
//			pstatement.setString(2, subSectionId);
//			pstatement.setString(3, userId);
//			ResultSet result = pstatement.executeQuery();
//			List<SectionData3> sectionData3info = new ArrayList<SectionData3>();
//			
//			//List<SectionData3> sectionData3info2 = new ArrayList<SectionData3>();
//			
//			while (result.next()) {
//
//				int userId1 = result.getInt("user_id");
//				int section_id = result.getInt("section_id");
//				int sub_section_id = result.getInt("sub_section_id");
//				String category_id = result.getString("category_id");
//				int version_id = result.getInt("version_id");
//				String response = result.getString("response");
//
//				SectionData3 sectionData3info1 = new SectionData3(userId1, section_id, sub_section_id, version_id,response, category_id);
//				sectionData3info.add(sectionData3info1);
//
//			}
        // System.out.println("size-WBBB    "+sectionData3info3);
			return sectionData3info2;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	private void writeArrayToFile(JSONArray jsonArray, int userId, int sectionId, int subSectionId) {

		try {
			File file = new File(PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
					+ "/subsection.json");
			file.createNewFile();
			FileWriter fileWriter = new FileWriter(file);
			fileWriter.write(jsonArray.toJSONString());
			fileWriter.close();

			// System.out.println("Successfully Copied JSON Object to File...");
			// System.out.println("\nJSON Object: " + jsonArray);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void writeObjectToFile(JSONObject jsonObject, int userId, int sectionId, int subSectionId) {

		// System.out.println("writeObjectToFile UserID=" + userId + "
		// sectionId=" + sectionId + " subsectionId=" + subSectionId);
		try {
			File file = new File(PATH + userId + "/sections/section" + sectionId + "/subsection" + subSectionId
					+ "/subsection.json");
			file.createNewFile();
			FileWriter fileWriter = new FileWriter(file);
			fileWriter.write(jsonObject.toJSONString());
			fileWriter.close();

			// System.out.println("Successfully Copied JSON Object to File...");
			// System.out.println("\nJSON Object: " + jsonObject);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
