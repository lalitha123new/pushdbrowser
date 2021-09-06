package in.ac.nimhans.service;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import in.ac.nimhans.model.Path;
import in.ac.nimhans.model.Question;
import in.ac.nimhans.model.Quote;
import in.ac.nimhans.model.Section;

public class SectionService {
	
	private final String PATH = Path.SECTION_PATH;
	
	public String addUserResponse() {
		return "";
	}
	
	public Section getInitialSection() {
		
		Section section = new Section();
    	
	    try {

	    	//Object obj = parser.parse(new FileReader(PATH + "/checkpoint.json"));
	    	//JSONObject jsonObject = (JSONObject) obj;

	    	JSONObject jsonObject = JSONFile.readJSON(PATH + "/checkpoint.json");	

	    	section.setSectionId(Integer.parseInt((String) jsonObject.get("sectionId")));
	    	section.setSectionName((String) jsonObject.get("sectionName"));
	    	
	    	JSONArray sectionDescs = (JSONArray) jsonObject.get("sectionDesc");
	    	ArrayList<String> para = new ArrayList<>();
	    	for (int i = 0; i < sectionDescs.size(); i++) {
	        	para.add((String) sectionDescs.get(i));
	        }
	    	
	    	section.setSectionDesc(para);
	    	section.setExerciseTitle((String) jsonObject.get("exerciseTitle"));
	    	
	    	JSONArray exerciseDescs = (JSONArray) jsonObject.get("exerciseDesc");
	    	para = new ArrayList<>();
	    	for (int i = 0; i < exerciseDescs.size(); i++) {
	        	para.add((String) exerciseDescs.get(i));
	        }
	    	
	    	section.setExerciseDesc(para);
	    	
	    	JSONArray questions = (JSONArray) jsonObject.get("questions");

	    	Question question;
	    	ArrayList<Question> quesList = new ArrayList<>();
	    	
	    	for (int i = 0; i < questions.size(); i++) {
	            
	        	JSONObject quesObject = (JSONObject) questions.get(i);
	        	
	        	question = new Question();
	        	
	        	question.setQuesNo((String) quesObject.get("questionNo"));
	        	question.setQues((String) quesObject.get("question"));
	        	question.setPrSectionId((String) quesObject.get("prSectionId"));
	        	quesList.add(question);
	        }
	    	
	    	section.setQuestions(quesList);
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	        return null;
	    }
		return section;
	}
	
	public Section getSection(String sectionId) {

		
		
		System.out.println("SS MethodCAME : getSection , SectionId=" + sectionId);
		//JSONParser parser = new JSONParser();
		Section section = new Section();
    	
	    try {

	    	
	    	
	    	//System.out.println(PATH + "section" + sectionId + "/section.json");
    		//obj = parser.parse(new FileReader(PATH + "section" + sectionId + "/section.json"));
	    	//JSONObject jsonObject = (JSONObject) obj;
	    	
	    	JSONObject jsonObject = JSONFile.readJSON(PATH + "section" + sectionId + "/section.json");
	    	
	    	section.setEstimatedTime((String) jsonObject.get("estimatedTime"));
	    	section.setNoOfSittings(Integer.parseInt((String) jsonObject.get("noOfSittings")));
	    	section.setNoOfExercises(Integer.parseInt((String) jsonObject.get("noOfExercises")));
	    	//section.setSuggestions((String) jsonObject.get("suggestions"));
	    
	    	JSONArray jsonArray;
	    	ArrayList<Quote> quotes = new ArrayList<>();
	    	Quote quote;

	    	jsonArray = (JSONArray) jsonObject.get("sectionDesc");
	    	ArrayList<String> para = new ArrayList<>();
	    	for (int i = 0; i < jsonArray.size(); i++) {
	        	para.add((String) jsonArray.get(i));
	        }
	    	
	    	section.setSectionDesc(para);

	    	jsonArray = (JSONArray) jsonObject.get("quotes");
	    	for (int i = 0; i < jsonArray.size(); i++) {
	        	jsonObject = (JSONObject) jsonArray.get(i);
	        	String quoteString = (String) jsonObject.get("quote");
	        	String authorString = (String) jsonObject.get("author");
	        	quote = new Quote(quoteString, authorString);
	        	quotes.add(quote);
	        }
	    	
	    	section.setQuotes(quotes);
	    	
	    	if(Integer.parseInt(sectionId) <= 10)
	    		jsonArray = JSONFile.readJSONArray(PATH + "sectionInfo.json");//obj = parser.parse(new FileReader(PATH + "sectionInfo.json"));
	    	else
	    		jsonArray = JSONFile.readJSONArray(PATH + "optionalSectionInfo.json");//obj = parser.parse(new FileReader(PATH + "optionalSectionInfo.json"));
	    	
	    	//jsonArray = (JSONArray) obj;
	    	if(Integer.parseInt(sectionId) <= 10) {
	    		
	    		
	    		jsonObject = (JSONObject) jsonArray.get(Integer.valueOf(sectionId) - 1);
	    		 
	    		
	    	}else {
	    		
	    	   jsonObject = (JSONObject) jsonArray.get(Integer.valueOf(sectionId) - 11);
	    	
	    	}
	    	section.setSectionId(Integer.parseInt((String) jsonObject.get("sectionId")));
	    	section.setSectionName((String) jsonObject.get("sectionName"));
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	        return null;
	    }
		return section;
	}
	
	public List<Section> getAllSections() {
		
		Section section;
    	List<Section> sections = new ArrayList<>();
		
	    try {

	    	//Object obj = parser.parse(new FileReader(PATH + "sectionInfo.json"));
	    	//JSONArray sectionList = (JSONArray) obj;
	    	
	    	JSONArray sectionList = JSONFile.readJSONArray(PATH + "sectionInfo.json");
	    	
	    	for (int i = 0; i < sectionList.size(); i++) {
	        	JSONObject sectionObject = (JSONObject) sectionList.get(i);
	        	int sectionId = Integer.parseInt((String) sectionObject.get("sectionId"));
	        	String sectionName = (String) sectionObject.get("sectionName");
	        	
	        	section = new Section(sectionId, sectionName);
	        	sections.add(section);
	    	}
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	        return null;
	    }
		return sections;
	}
	
	public List<Section> getAllOptionalSections()
	{
		Section section;
		List<Section> sections = new ArrayList<>();
		try {
			
			//Object obj = parser.parse(new FileReader(PATH + "optionalSectionInfo.json"));
            //JSONArray sectionList = (JSONArray) obj;
			
			JSONArray sectionList = JSONFile.readJSONArray(PATH + "optionalSectionInfo.json");
	    	
	    	for (int i = 0; i < sectionList.size(); i++) {
	        	JSONObject sectionObject = (JSONObject) sectionList.get(i);
	        	int sectionId = Integer.parseInt((String) sectionObject.get("sectionId"));
	        	String sectionName = (String) sectionObject.get("sectionName");
	        	
	        	section = new Section(sectionId, sectionName);
	        	sections.add(section);
			
		}
		}catch(Exception e)
		{
			e.printStackTrace();
	        return null;
		}
		return sections;
	}
	
	public Section getContent() {

		//System.out.println("\t\t\tSS Method : getContent");
		
		Section section = new Section();
    	
	    try {

	    	//Object obj = parser.parse(new FileReader(Path.USER_PATH + "section.txt"));

	    	//JSONObject jsonObject = (JSONObject) obj;
	    	
	    	JSONObject jsonObject = JSONFile.readJSON(Path.USER_PATH + "section.txt");

	    	section.setSectionId(Integer.parseInt((String) jsonObject.get("sectionId")));
	    	section.setSectionName((String) jsonObject.get("sectionName"));

	    	JSONArray sectionDescs = (JSONArray) jsonObject.get("sectionDesc");
	    	ArrayList<String> para = new ArrayList<>();
	    	JSONObject desc;
	    	for (int i = 0; i < sectionDescs.size(); i++) {
	        	desc = (JSONObject) sectionDescs.get(i);
	        	para.add((String) desc.get("paragraphContent"));
	        }
	    	
	    	section.setSectionDesc(para);
	    	
	    	
	    	JSONArray questions = (JSONArray) jsonObject.get("questions");

	    	Question question;
	    	ArrayList<Question> quesList = new ArrayList<>();
	    	
	    	for (int i = 0; i < questions.size(); i++) {
	            
	        	JSONObject quesObject = (JSONObject) questions.get(i);
	        	
	        	question = new Question();
	        	
	        	question.setQuesNo((String) quesObject.get("questionNo"));
	        	question.setQues((String) quesObject.get("question"));
	        	
	        	quesList.add(question);
	        }
	    	
	    	section.setQuestions(quesList);
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	        return null;
	    }
		return section;
	}
}
