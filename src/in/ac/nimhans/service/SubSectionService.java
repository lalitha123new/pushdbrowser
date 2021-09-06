package in.ac.nimhans.service;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import in.ac.nimhans.model.AnswerOption;
import in.ac.nimhans.model.CheckPoint;
import in.ac.nimhans.model.DiscoveryPoint;
import in.ac.nimhans.model.KnowledgePoint;
import in.ac.nimhans.model.Paragraph;
import in.ac.nimhans.model.Path;
import in.ac.nimhans.model.PracticePoint;
import in.ac.nimhans.model.Question;
import in.ac.nimhans.model.SubSection;
import in.ac.nimhans.model.Table;
import in.ac.nimhans.model.ToolBox;
import in.ac.nimhans.model.Video;

public class SubSectionService {

	private final String PATH = Path.SECTION_PATH;
	
	public List<SubSection> getAllSubSections(String sectionId) {
		
		//System.out.println("\t\t\tSSS Method : getAllSubSections , SectionId=" + sectionId);
		
		SubSection subSection;
    	List<SubSection> subSections = new ArrayList<>();
		
	    try {

	    	//Object obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subSectionInfo.json"));
	    	//JSONArray sectionList = (JSONArray) obj;
	    	
	    	JSONArray sectionList = JSONFile.readJSONArray(PATH + "section" + sectionId + "/subSectionInfo.json");
	    	
	    	for (int i = 0; i < sectionList.size(); i++) {
	        	JSONObject sectionObject = (JSONObject) sectionList.get(i);
	        	
	        	subSection = new SubSection();
	        	
	        	subSection.setSubSectionId((String) sectionObject.get("subSectionId"));
	        	subSection.setSubSectionName((String) sectionObject.get("subSectionName"));
	        	subSection.setSubSectionUrl((String) sectionObject.get("subSectionUrl"));
	        	
	        	subSections.add(subSection);
	    	}
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	        return null;
	    }
		return subSections;
	}

	public SubSection getContent(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getContent , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		
		SubSection subSection = new SubSection();
		Question question;
		Paragraph paragraph;
		ArrayList<Paragraph> paraList; 
		
	    try {

	    	//Get the location of the JSON File	
	    	//Object obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subSectionInfo.json"));
	    	
	    	//JSONArray jsonArray = (JSONArray) obj;
	    	JSONArray jsonArray = JSONFile.readJSONArray(PATH + "section" + sectionId + "/subSectionInfo.json");
	    	
	    	JSONObject jsonObject;
	    	
	    	for (int i = 0; i < jsonArray.size(); i++) {
	    		jsonObject = (JSONObject) jsonArray.get(i);
	    		String ssid = (String) jsonObject.get("subSectionId");
	    		if(ssid.equals("" + subSectionId)) {
	    			subSection.setSubSectionId(subSectionId);
	    			subSection.setSubSectionName((String) jsonObject.get("subSectionName"));
	    			subSection.setSubSectionUrl((String) jsonObject.get("subSectionUrl"));
	    			break;
	    		}
	    	}
	    	
	    	//obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	
	    	//jsonObject = (JSONObject) obj;
	    	jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    	
	    	subSection.setExerciseTitle((String) jsonObject.get("exerciseTitle"));
	    	
	    	List<String> list = new ArrayList<>();
	    	
	    	jsonArray = (JSONArray) jsonObject.get("exerciseDesc");
			for (int i = 0; i < jsonArray.size(); i++) {
				list.add((String) jsonArray.get(i));
	    	}
			
			subSection.setExerciseDesc(list);
			
	    	jsonArray = (JSONArray) jsonObject.get("questions");
	    	JSONArray jsArray;
	    	JSONObject jsObject;
	    	for (int i = 0; i < jsonArray.size(); i++) {
				
	    		jsonObject = (JSONObject) jsonArray.get(i);
				
				question = new Question();
				question.setQuesNo((String) jsonObject.get("questionNo"));
				question.setQues((String) jsonObject.get("questionContent"));
				question.setAns((String) jsonObject.get("answer"));
				
				jsArray = (JSONArray) jsonObject.get("explanation");
				paraList = new ArrayList<>();
				
				for (int j = 0; j < jsArray.size(); j++) {
					
					jsObject = (JSONObject) jsArray.get(j);
					
					paragraph = new Paragraph();
					paragraph.setParagraphNo((String) jsObject.get("paragraphNo"));
					paragraph.setParagraphContent((String) jsObject.get("paragraphContent"));
					
					paraList.add(paragraph);
				}
				
				//question.setExplanations(paraList);
				
//				quesList.add(question);
			}
	    
//	    	subSection.setQuestions(quesList);
	    	
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return subSection;
    }

	public DiscoveryPoint getDiscoveryPoint(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getDiscoveryPoint , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		
		DiscoveryPoint subSection = new DiscoveryPoint();
		Question question;
		ArrayList<Question> quesList; 
		ArrayList<String> paraList; 
		
	    try {

	    	JSONArray jsonArray;
	    	JSONObject jsonObject;
	    	
	    	getSubSectionDetails(subSection, sectionId, subSectionId);
	    	
	    	//Object obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//jsonObject = (JSONObject) obj;
	    	jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    		    	
	    	subSection.setExerciseNo((String) jsonObject.get("exerciseno"));
	    	subSection.setExerciseType((String) jsonObject.get("exerciseType"));
	    	subSection.setExerciseGT((String) jsonObject.get("exerciseGT"));
	    	subSection.setExerciseTitle((String) jsonObject.get("exerciseTitle"));
    		
	    	List<String> list = new ArrayList<>();
	    	
	    	jsonArray = (JSONArray) jsonObject.get("exerciseDesc");
			for (int i = 0; i < jsonArray.size(); i++) {
				list.add((String) jsonArray.get(i));
	    	}
			
			subSection.setExerciseDesc(list);
			
	    	jsonArray = (JSONArray) jsonObject.get("questions");
	    	JSONArray jsArray;
	    	JSONObject jsObject;
	    	quesList = new ArrayList<>();
	    	for (int i = 0; i < jsonArray.size(); i++) {
				
	    		jsonObject = (JSONObject) jsonArray.get(i);
				
				question = new Question();
				question.setQuesNo((String) jsonObject.get("questionNo"));
				question.setQues((String) jsonObject.get("questionContent"));
				question.setAns((String) jsonObject.get("answer"));
				
				jsArray = (JSONArray) jsonObject.get("explanation");
				paraList = new ArrayList<>();
				
				for (int j = 0; j < jsArray.size(); j++) {
					
					jsObject = (JSONObject) jsArray.get(j);
					paraList.add((String) jsObject.get("p"));
				}
				
				question.setExplanations(paraList);
				
				quesList.add(question);
			}
	    
	    	subSection.setQuestions(quesList);
	    	
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return subSection;
    }
	
public DiscoveryPoint getDiscoveryPoint2(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getDiscoveryPoint2 , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		
		DiscoveryPoint subSection = new DiscoveryPoint();
		Question question;
		
	    try {

	    	JSONArray jsonArray;
	    	JSONObject jsonObject;
	    	JSONArray jsArray, jsArray2;
	    	JSONObject jsObject;
	    	
	    	getSubSectionDetails(subSection, sectionId, subSectionId);
	    	
	    	//obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//jsonObject = (JSONObject) obj;
	    	jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    	
	    	subSection.setExerciseNo((String) jsonObject.get("exerciseno"));
	    	subSection.setExerciseType((String) jsonObject.get("exerciseType"));
	    	subSection.setExerciseGT((String) jsonObject.get("exerciseGT"));
	    	subSection.setExerciseTitle((String) jsonObject.get("exerciseTitle"));
    		subSection.setExerciseDesc(new ArrayList<String>());
    		
    		jsonArray = (JSONArray) jsonObject.get("exerciseDesc");
			for (int i = 0; i < jsonArray.size(); i++) {
				subSection.getExerciseDesc().add((String) jsonArray.get(i));
	    	}
			
			subSection.setOptions(new ArrayList<String>());
			jsonArray = (JSONArray) jsonObject.get("options");
			for (int i = 0; i < jsonArray.size(); i++) {
				subSection.getOptions().add((String) jsonArray.get(i));
	    	}
			
			subSection.setQuestions(new ArrayList<Question>());
			
	    	jsonArray = (JSONArray) jsonObject.get("questions");
	    	Question question2;
	    	
	    	for (int i = 0; i < jsonArray.size(); i++) {
				
	    		jsonObject = (JSONObject) jsonArray.get(i);
				
				question = new Question();
				question.setQuesNo((String) jsonObject.get("questionNo"));
				question.setQues((String) jsonObject.get("questionContent"));
				question.setQuesLists(new ArrayList<Question>());
				
				jsArray = (JSONArray) jsonObject.get("questions");
				
				for (int j = 0; j < jsArray.size(); j++) {
					
					jsObject = (JSONObject) jsArray.get(j);
					
					question2 = new Question();
					question2.setQuesNo((String) jsObject.get("questionNo"));
					question2.setQues((String) jsObject.get("questionContent"));
					question2.setAns((String) jsObject.get("answer"));
				
					question2.setExplanations(new ArrayList<String>());
					
					jsArray2 = (JSONArray) jsObject.get("explanation");
					
					for (int k = 0; k < jsArray2.size(); k++) {
						question2.getExplanations().add((String) jsArray2.get(k));
					}
					question.getQuesLists().add(question2);
				}
				subSection.getQuestions().add(question);
			}
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return subSection;
    }

	public void getSubSectionDetails(SubSection subSection, String sectionId, String subSectionId) {
		try {
			//Object obj = new JSONParser().parse(new FileReader(PATH + "section" + sectionId + "/subSectionInfo.json"));
	    	
	    	//JSONArray jsonArray = (JSONArray) obj;
	    	
	    	JSONArray jsonArray = JSONFile.readJSONArray(PATH + "section" + sectionId + "/subSectionInfo.json");
	    	JSONObject jsonObject;
	    	
	    	for (int i = 0; i < jsonArray.size(); i++) {
	    		jsonObject = (JSONObject) jsonArray.get(i);
	    		String ssid = (String) jsonObject.get("subSectionId");
	    		if(ssid.equals("" + subSectionId)) {
	    			subSection.setSubSectionId(subSectionId);
	    			subSection.setSubSectionName((String) jsonObject.get("subSectionName"));
	    			subSection.setSubSectionUrl((String) jsonObject.get("subSectionUrl"));
	    			break;
	    		}
	    	}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public CheckPoint getCheckPoint(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getCheckPoint , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		
		CheckPoint subSection = new CheckPoint();
		Question question;
		
	    try {

	    	getSubSectionDetails(subSection, sectionId, subSectionId);
	    	
	    	//Get the location of the JSON File	
	    	//Object obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//JSONObject jsonObject = (JSONObject) obj;
	    	JSONObject jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    	
	    	subSection.setExerciseNo((String) jsonObject.get("exerciseno"));
	    	subSection.setExerciseType((String) jsonObject.get("exerciseType"));
	    	subSection.setExerciseGT((String) jsonObject.get("exerciseGT"));
	    	subSection.setExerciseTitle((String) jsonObject.get("exerciseTitle"));
	    	subSection.setminfields((long)jsonObject.get("minfields"));
	    	//System.out.print("minfields=" + (long)jsonObject.get("minfields"));
	    	JSONArray jsonArray = (JSONArray) jsonObject.get("exerciseDesc");
			
	    	subSection.setExerciseDesc(new ArrayList<String>());
	    	for (int i = 0; i < jsonArray.size(); i++) {
				subSection.getExerciseDesc().add((String) jsonArray.get(i));
	    	}
			
	    	jsonArray = (JSONArray) jsonObject.get("questions");
	    	JSONArray jsArray;
	    	
	    	subSection.setQuestions(new ArrayList<Question>());
	    	for (int i = 0; i < jsonArray.size(); i++) {
				
	    		jsonObject = (JSONObject) jsonArray.get(i);
				
				question = new Question();
				question.setQuesNo((String) jsonObject.get("quesNo"));
				question.setQues((String) jsonObject.get("ques"));
				question.setAns((String) jsonObject.get("answer"));
				
				jsArray = (JSONArray) jsonObject.get("explanation");
				
				question.setExplanations(new ArrayList<String>());
				for (int j = 0; j < jsArray.size(); j++) {
					question.getExplanations().add((String) jsArray.get(j));
				}
				
				jsArray = (JSONArray) jsonObject.get("blanks");
				
				question.setBlanks(new ArrayList<String>());
				for (int j = 0; j < jsArray.size(); j++) {
					question.getBlanks().add((String) jsArray.get(j));
				}
			
				subSection.getQuestions().add(question);
			}
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return subSection;
    }
	
	public PracticePoint getPracticePoint(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getPracticePoint , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		
		PracticePoint subSection = new PracticePoint();
		Question question;
		ArrayList<Question> quesList; 
		
	    try {

	    	JSONArray jsonArray;
	    	JSONObject jsonObject;
	    	
	    	getSubSectionDetails(subSection, sectionId, subSectionId);
	    	
	    	//obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//jsonObject = (JSONObject) obj;
	    	
	    	jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    	
	    	subSection.setExerciseNo((String) jsonObject.get("exerciseno"));
	    	subSection.setExerciseType((String) jsonObject.get("exerciseType"));
	    	subSection.setExerciseGT((String) jsonObject.get("exerciseGT"));
	    	subSection.setExerciseTitle((String) jsonObject.get("exerciseTitle"));
	    	
	    	List<String> list = new ArrayList<>();
	    	
	    	jsonArray = (JSONArray) jsonObject.get("exerciseDesc");
			for (int i = 0; i < jsonArray.size(); i++) {
				list.add((String) jsonArray.get(i));
	    	}
			
			subSection.setExerciseDesc(list);
			
			subSection.setFeedback((String) jsonObject.get("feedback"));
	    	
	    	jsonArray = (JSONArray) jsonObject.get("questions");
	    	quesList = new ArrayList<>();
	    	for (int i = 0; i < jsonArray.size(); i++) {
				
	    		jsonObject = (JSONObject) jsonArray.get(i);
				
				question = new Question();
				question.setQuesNo((String) jsonObject.get("questionNo"));
				question.setQues((String) jsonObject.get("questionContent"));
				question.setAns((String) jsonObject.get("answer"));
				question.setExplanations(new ArrayList<String>());
				
				JSONArray jsArray = (JSONArray) jsonObject.get("explanation");
				for (int j = 0; j < jsArray.size(); j++) {
					question.getExplanations().add((String) jsArray.get(j));
				}
				quesList.add(question);
			}
	    
	    	subSection.setQuestions(quesList);	    	
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return subSection;
    }
	
	public List<PracticePoint> getPracticePoint3(String sectionId, String subSectionId) {
	
		//System.out.println("\t\t\tSSS Method : getPracticePoint3 , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		
		JSONParser parser = new JSONParser();
		
		List<PracticePoint> practicePoints = new ArrayList<>();		
		
		JSONArray jsonArray, jsonArray1, jsArray;
    	JSONObject jsonObject, jsObject;
    	Question question;
    	Table table;
		try {

	    	//Get the location of the JSON File	
	    	//Object obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//jsonArray = (JSONArray) obj;
	    	jsonArray = JSONFile.readJSONArray(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    	
	    	for (int i = 0; i < jsonArray.size(); i++) {
				
	    		PracticePoint subSection = new PracticePoint();
	    		
	    		getSubSectionDetails(subSection, sectionId, subSectionId);
		    	
		    	jsonObject = (JSONObject) jsonArray.get(i);
				
	    		subSection.setExerciseNo((String) jsonObject.get("exerciseno"));
		    	subSection.setExerciseType((String) jsonObject.get("exerciseType"));
		    	subSection.setExerciseGT((String) jsonObject.get("exerciseGT"));
		    	subSection.setExerciseTitle((String) jsonObject.get("exerciseTitle"));

				jsonArray1 = (JSONArray) jsonObject.get("exerciseDesc");
				int j;
				
				subSection.setExerciseDesc(new ArrayList<String>());
				
		    	for (j = 0; j < jsonArray1.size(); j++) {
		    		subSection.getExerciseDesc().add((String) jsonArray1.get(j));
		    	}
				
		    	jsonArray1 = (JSONArray) jsonObject.get("questions");
		    	
		    	subSection.setQuestions(new ArrayList<Question>());
		    	for (j = 0; j < jsonArray1.size(); j++) {
					
		    		jsObject = (JSONObject) jsonArray1.get(j);
					
					question = new Question();
					question.setQuesNo((String) jsObject.get("questionNo"));
					question.setQues((String) jsObject.get("questionContent"));
					question.setAns((String) jsObject.get("answer"));
					
					jsArray = (JSONArray) jsObject.get("explanation");
					
					for (int k = 0; k < jsArray.size(); k++) {
						question.getExplanations().add((String) jsArray.get(k));
					}
					
					subSection.getQuestions().add(question);
				}
		    	
		    	jsonArray1 = (JSONArray) jsonObject.get("tables");
		    	
		    	subSection.setTables(new ArrayList<Table>());
		    	for (j = 0; j < jsonArray1.size(); j++) {
					
		    		jsObject = (JSONObject) jsonArray1.get(j);
					
		    		table = new Table();
		    		table.setTitle((String) jsObject.get("title"));
			    	table.setRows(Integer.parseInt((String) jsObject.get("rows")));
			    	table.setCols(Integer.parseInt((String) jsObject.get("cols")));
			    	table.setType(Integer.parseInt((String) jsObject.get("type")));
			    	
			    	jsArray = (JSONArray) jsObject.get("thead");
		    		
		    		for (int k = 0; k < jsArray.size(); k++) {
						table.getThead().add((String) jsArray.get(k));
					}
		    		
					jsArray = (JSONArray) jsObject.get("options");
		    	
					for (int k = 0; k < jsArray.size(); k++) {
						table.getOptions().add((String) jsArray.get(k));
					}
		    		
		    		subSection.getTables().add(table);
				}
		    	
		    	practicePoints.add(subSection);
		    }
    	}
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return practicePoints;
	}
	
	public PracticePoint getPracticePoint9(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getPracticePoint9 , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		
		JSONParser parser = new JSONParser();
		
		PracticePoint subSection = new PracticePoint();		
		
		JSONArray jsonArray1, jsArray;
    	JSONObject jsonObject, jsObject;
    	Question question;
    	Table table;
		try {

	    	Object obj;
	    	
	    	getSubSectionDetails(subSection, sectionId, subSectionId);
	    	
	    	//obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//jsonObject = (JSONObject) obj;
	    	jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
			
    		subSection.setExerciseNo((String) jsonObject.get("exerciseno"));
	    	subSection.setExerciseType((String) jsonObject.get("exerciseType"));
	    	subSection.setExerciseGT((String) jsonObject.get("exerciseGT"));
	    	subSection.setExerciseTitle((String) jsonObject.get("exerciseTitle"));

			jsonArray1 = (JSONArray) jsonObject.get("exerciseDesc");
			int j;
			
			subSection.setExerciseDesc(new ArrayList<String>());
				
	    	for (j = 0; j < jsonArray1.size(); j++) {
	    		subSection.getExerciseDesc().add((String) jsonArray1.get(j));
	    	}
			
	    	jsonArray1 = (JSONArray) jsonObject.get("questions");
	    	
	    	subSection.setQuestions(new ArrayList<Question>());
	    	for (j = 0; j < jsonArray1.size(); j++) {
				
	    		jsObject = (JSONObject) jsonArray1.get(j);
				
				question = new Question();
				question.setQuesNo((String) jsObject.get("questionNo"));
				question.setQues((String) jsObject.get("questionContent"));
				question.setAns((String) jsObject.get("answer"));
				
				jsArray = (JSONArray) jsObject.get("explanation");
				
				for (int k = 0; k < jsArray.size(); k++) {
					question.getExplanations().add((String) jsArray.get(k));
				}
				
				subSection.getQuestions().add(question);
			}
	    	
	    	jsonArray1 = (JSONArray) jsonObject.get("tables");
		    	
	    	subSection.setTables(new ArrayList<Table>());
	    	for (j = 0; j < jsonArray1.size(); j++) {
				
	    		jsObject = (JSONObject) jsonArray1.get(j);
				
	    		table = new Table();
	    		table.setTitle((String) jsObject.get("title"));
		    	table.setRows(Integer.parseInt((String) jsObject.get("rows")));
		    	table.setCols(Integer.parseInt((String) jsObject.get("cols")));
		    	table.setType(Integer.parseInt((String) jsObject.get("type")));
		    	
		    	jsArray = (JSONArray) jsObject.get("thead");
	    		
	    		for (int k = 0; k < jsArray.size(); k++) {
					table.getThead().add((String) jsArray.get(k));
				}
	    		
				jsArray = (JSONArray) jsObject.get("options");
	    	
				for (int k = 0; k < jsArray.size(); k++) {
					table.getOptions().add((String) jsArray.get(k));
				}
	    		
	    		subSection.getTables().add(table);
			}
		}
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return subSection;
	}
	
	public PracticePoint getPracticePoint2(String sectionId, String subSectionId)
	{
		//System.out.println("SSS : getPracticePoint2");
		PracticePoint subSection = new PracticePoint();
		Question question;
		JSONArray jsArray;
		JSONObject jsonObject, jsObject;
		AnswerOption answerOption;
		
		try
		{
			Object obj;
			
			getSubSectionDetails(subSection, sectionId, subSectionId);
	    	
	    	//obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
			//jsonObject = (JSONObject) obj ;
			jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
			
			subSection.setExerciseNo((String) jsonObject.get("exerciseno"));
	    	subSection.setExerciseType((String) jsonObject.get("exerciseType"));
	    	subSection.setExerciseGT((String) jsonObject.get("exerciseGT"));
	    	subSection.setExerciseTitle((String)jsonObject.get("exerciseTitle"));
			subSection.setExerciseDesc(new ArrayList<String>());
			subSection.setQuestions(new ArrayList<Question>());
			
			int j;
			jsArray = (JSONArray) jsonObject.get("exerciseDesc");
			
	    	for (j = 0; j < jsArray.size(); j++) {
	    		subSection.getExerciseDesc().add((String) jsArray.get(j));
	    	}
	    	
			jsArray = (JSONArray) jsonObject.get("questions");
	    	for (j = 0; j < jsArray.size(); j++) {
				
	    		jsObject = (JSONObject) jsArray.get(j);
				
				question = new Question();
				question.setQuesNo((String) jsObject.get("questionNo"));
				question.setQues((String) jsObject.get("questionContent"));
				question.setAnswerOptions(new ArrayList<AnswerOption>());
				question.setExplanations(new ArrayList<String>());
				
				JSONArray jsonArray1 =(JSONArray) jsObject.get("answerOption");

				for(int k =0; k < jsonArray1.size(); k++) {
					
                	 JSONObject jsObject2 = (JSONObject) jsonArray1.get(k);
        
                	 answerOption = new AnswerOption(); 
                	 answerOption.setOptionNo((String) jsObject2.get("optionNo"));
                	 answerOption.setOptionDesc((String)jsObject2.get("optionDesc"));
                	 answerOption.setAnswer((String) jsObject2.get("answer"));
                	 
                	 question.getAnswerOptions().add(answerOption);
                 }
                
				jsonArray1 = (JSONArray) jsObject.get("explanation");
				
				for (int k = 0; k < jsonArray1.size(); k++) {
					question.getExplanations().add((String) jsonArray1.get(k));
				}
				
				subSection.getQuestions().add(question);
			}	
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		
		return subSection;
		
	}	
	
	public ToolBox getToolBox(String sectionId, String subSectionId) {
		
		ToolBox toolBox = new ToolBox();
		ArrayList<String> paraList = new ArrayList<>(); 
		
	    try {

	    	Object obj;
	    	
	    	JSONArray jsonArray;
	    	JSONObject jsonObject;
	    	
	    	getSubSectionDetails(toolBox, sectionId, subSectionId);
	    	
	    	//obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//jsonObject = (JSONObject) obj;
	    	jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    	
	    	toolBox.setExerciseTitle((String) jsonObject.get("exerciseTitle"));
	    	toolBox.setImage((String) jsonObject.get("images"));
	    	
	    	jsonArray = (JSONArray) jsonObject.get("lists");
	    	
	    	for (int i = 0; i < jsonArray.size(); i++) {
				paraList.add((String) jsonArray.get(i));
			}
			
	    	toolBox.setLists(paraList);
	    	
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return toolBox;
	}
	
	public ToolBox getToolBox2(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getToolBox , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		JSONParser parser = new JSONParser();
		
		ToolBox toolBox = new ToolBox();
		
	    try {
	    	
	    	toolBox = getToolBox(sectionId, subSectionId);
	    	
	    	//Object obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//JSONObject jsonObject = (JSONObject) obj;
	    	JSONObject jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    	
	    	toolBox.setFeedback((String) jsonObject.get("feedback"));
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return toolBox;
	}
	
	public Video getVideo(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getVideo , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		JSONParser parser = new JSONParser();
		
		Video video = new Video();
		ArrayList<String> paraList = new ArrayList<>(); 
		
	    try {

	    	Object obj;
	    	
	    	JSONArray jsonArray;
	    	JSONObject jsonObject;
	    	
	    	getSubSectionDetails(video, sectionId, subSectionId);
	    	
	    	//obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//jsonObject = (JSONObject) obj;
	    	jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    	video.setVideo((String) jsonObject.get("video"));
	    	
	    	jsonArray = (JSONArray) jsonObject.get("p");
	    	
	    	for (int i = 0; i < jsonArray.size(); i++) {
				paraList.add((String) jsonArray.get(i));
			}
    		video.setParagraphs(paraList);
    		
	    	jsonArray = (JSONArray) jsonObject.get("feedback");
	    	
	    	paraList = new ArrayList<>();
	    	for (int i = 0; i < jsonArray.size(); i++) {
				paraList.add((String) jsonArray.get(i));
			}
			
	    	video.setFeedbacks(paraList);
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return video;
	}

	public KnowledgePoint getKnowledgePoint(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getKnowledgePoint , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		
		JSONParser parser = new JSONParser();
		
		KnowledgePoint kpoint = new KnowledgePoint();
				
		try {

	    	Object obj;
	    	
	    	JSONArray jsonArray;
	    	JSONObject jsonObject;
	    	
	    	getSubSectionDetails(kpoint, sectionId, subSectionId);
	    	
	    	//obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json"));
	    	
	    	//jsonObject = (JSONObject) obj;
	    	jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/subsection" + subSectionId + "/subsection.json");
	    	
	    	kpoint.setExerciseNo((String) jsonObject.get("exerciseNo"));
	    	//System.out.println(kpoint.getExerciseNo());
	    	kpoint.setExerciseType((String) jsonObject.get("exerciseType"));
	    	kpoint.setExerciseGT((String) jsonObject.get("exerciseGT"));
	    	kpoint.setminfields((long)jsonObject.get("minfields"));
	    	jsonArray = (JSONArray) jsonObject.get("p");
	    	List<String> paraList = new ArrayList<>();
	    	for (int i = 0; i < jsonArray.size(); i++) {
				paraList.add((String) jsonArray.get(i));
			}
	    	kpoint.setParagraphs(paraList);
	    
	    	jsonArray = (JSONArray) jsonObject.get("images");
	    	kpoint.setVideo((String)jsonObject.get("video"));
	    	
	    	paraList = new ArrayList<>();
	    	for (int i = 0; i < jsonArray.size(); i++) {
				paraList.add((String) jsonArray.get(i));
			}
	    	kpoint.setImages(paraList);
	    
	    	jsonObject = (JSONObject) jsonObject.get("table");
	    	Table table = new Table();
	    	
    		table.setTitle((String) jsonObject.get("title"));
	    	table.setRows(Integer.parseInt((String) jsonObject.get("rows")));
	    	table.setCols(Integer.parseInt((String) jsonObject.get("cols")));
	    	
	    	String[][] tbody = new String[table.getRows()][table.getCols()];
	    	JSONArray jsArray = (JSONArray) jsonObject.get("thead");
    		
    		for (int j = 0; j < jsArray.size(); j++) {
				table.getThead().add((String) jsArray.get(j));
			}
    		
			jsArray = (JSONArray) jsonObject.get("tbody");
    		
    		for (int j = 0; j < table.getRows(); j++) {
    			JSONArray jsArray1 = (JSONArray) jsArray.get(j);
	    		for (int k = 0; k < table.getCols(); k++) {
	    			tbody[j][k] = (String) jsArray1.get(k);
				}
			}
    		table.setTbody(tbody);
    		
	    	kpoint.setTable(table);
	    	
	    }
	    catch(Exception e) {
	    	//System.out.println(sectionId + " " + subSectionId);
	    	e.printStackTrace();
	    	return null;
	    }
		return kpoint;
    }
	
	public KnowledgePoint getKnowledgePointWorkbook(String sectionId, String subSectionId) {
		
		//System.out.println("\t\t\tSSS Method : getKnowledgePointWorkbook , SectionId=" + sectionId + " , SubsectionId=" + subSectionId);
		
		JSONParser parser = new JSONParser();
		
		KnowledgePoint kpoint = new KnowledgePoint();
				
		try {

	    	//Object obj = parser.parse(new FileReader(Path.SECTION_PATH + "workbook.json"));
	    	
	    	//JSONArray jsonArray = (JSONArray) obj;
			JSONArray jsonArray = JSONFile.readJSONArray(Path.SECTION_PATH + "workbook.json");
	    	JSONObject jsonObject, jsObject;
	    	JSONArray jsArray;
	    	
	    	for (int i = 0; i < jsonArray.size(); i++) {
	    		jsonObject = (JSONObject) jsonArray.get(i);
	    		String sid = (String) jsonObject.get("sId");
	    		String ssid = (String) jsonObject.get("ssId");
	    		
	    		if(sid.equals(sectionId) && ssid.equals("" + subSectionId)) {
	    			
	    			jsArray = (JSONArray) jsonObject.get("p");
	    	    	kpoint.setParagraphs(new ArrayList<String>());
	    			for (int j = 0; j < jsArray.size(); j++) {
	    	    		kpoint.getParagraphs().add((String) jsArray.get(j));
	    	    	}
	    	    
	    			jsObject = (JSONObject) jsonObject.get("table");
	    	    	Table table = new Table();
	    	    	
	        		table.setTitle((String) jsObject.get("title"));
	    	    	table.setRows(Integer.parseInt((String) jsObject.get("rows")));
	    	    	table.setCols(Integer.parseInt((String) jsObject.get("cols")));
	    	    	
	    	    	String[][] tbody = new String[table.getRows()][table.getCols()];
	    	    	jsArray = (JSONArray) jsObject.get("thead");
	        		
	        		for (int j = 0; j < jsArray.size(); j++) {
	    				table.getThead().add((String) jsArray.get(j));
	    			}
	        		
	    			jsArray = (JSONArray) jsObject.get("tbody");
	        		
	        		for (int j = 0; j < table.getRows(); j++) {
	        			JSONArray jsArray1 = (JSONArray) jsArray.get(j);
	    	    		for (int k = 0; k < table.getCols(); k++) {
	    	    			tbody[j][k] = (String) jsArray1.get(k);
	    				}
	    			}
	        		table.setTbody(tbody);
	        		kpoint.setTable(table);
	        
	        		break;
	    		}
	    	}
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	return null;
	    }
		return kpoint;
    }

}
