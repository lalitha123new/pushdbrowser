package in.ac.nimhans.model;

import java.util.ArrayList;
import java.util.List;

public class Section {

	// section description
	private int sectionId;
	private String sectionName;
	private ArrayList<String> sectionDesc;
	//private String nextUrl;
	private String estimatedTime;
	private int noOfSittings;
	private int noOfExercises;
//	private List<Link> links = new ArrayList<>();
	private Link link;
	
	//private String suggestions;
	private String prSection;	//	sectionId
	private List<Integer> prSectionIds;
	private List<String> prSectionNames;	//sectionNames
	private List<Quote> quotes;
	
	private String review;
	private String summary;
	
	// current status of user
	private int currentSubSection;
	private int currentSection;
	private int activeSection;
	private int activeSubSection;
	private int currentOptionalSubSection;
	private int currentOptionalSection;
	
	// for initial section => checkpoint.html
	private String exerciseTitle;
	private ArrayList<String> exerciseDesc;
	private ArrayList<Question> questions;
	
	public Section() {
		
	}
	
	public Section(int sectionId, String sectionName) {
		super();
		this.setSectionId(sectionId);
		this.sectionName = sectionName;
	}
	

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public ArrayList<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(ArrayList<Question> questions) {
		this.questions = questions;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public String getEstimatedTime() {
		return estimatedTime;
	}
	public void setEstimatedTime(String estimatedTime) {
		this.estimatedTime = estimatedTime;
	}
	/*public String getSuggestions() {
		return suggestions;
	}
	public void setSuggestions(String suggestions) {
		this.suggestions = suggestions;
	}*/
	public ArrayList<String> getSectionDesc() {
		return sectionDesc;
	}
	public void setSectionDesc(ArrayList<String> sectionDesc) {
		this.sectionDesc = sectionDesc;
	}
	public String getExerciseTitle() {
		return exerciseTitle;
	}
	public void setExerciseTitle(String exerciseTitle) {
		this.exerciseTitle = exerciseTitle;
	}
	public ArrayList<String> getExerciseDesc() {
		return exerciseDesc;
	}
	public void setExerciseDesc(ArrayList<String> exerciseDesc) {
		this.exerciseDesc = exerciseDesc;
	}
	public List<Quote> getQuotes() {
		return quotes;
	}
	public void setQuotes(List<Quote> quotes) {
		this.quotes = quotes;
	}
	public int getNoOfSittings() {
		return noOfSittings;
	}
	public void setNoOfSittings(int noOfSittings) {
		this.noOfSittings = noOfSittings;
	}
	public int getNoOfExercises() {
		return noOfExercises;
	}
	public void setNoOfExercises(int noOfExercises) {
		this.noOfExercises = noOfExercises;
	}

	public int getSectionId() {
		return sectionId;
	}

	public void setSectionId(int sectionId2) {
		this.sectionId = sectionId2;
	}

	public String getPrSection() {
		return prSection;
	}

	public void setPrSection(String prSection) {
		this.prSection = prSection;
	}

	public int getCurrentSubSection() {
		return currentSubSection;
	}

	public void setCurrentSubSection(int currentSubSection) {
		this.currentSubSection = currentSubSection;
	}

	public int getCurrentSection() {
		return currentSection;
	}

	public void setCurrentSection(int currentSection) {
		this.currentSection = currentSection;
	}

	/*public String getNextUrl() {
		return nextUrl;
	}

	public void setNextUrl(String nextUrl) {
		this.nextUrl = nextUrl;
	}
*/
/*	public List<Link> getLinks() {
		return links;
	}

	public void setLinks(List<Link> links) {
		this.links = links;
	}*/
	
	public void addLink(String uri, String rel) {
		Link link = new Link();
		link.setLink(uri);
		link.setRel(rel);
//		links.add(link);
	}

	public void setValues(String uri, String sid, String ssid) {
		link = new Link();
		link.setLink(uri);
		link.setsId(sid);
		link.setSsId(ssid);
	}
	
	public Link getLink() {
		return link;
	}

	public void setLink(Link link) {
		this.link = link;
	}

	public List<String> getPrSectionNames() {
		return prSectionNames;
	}

	public void setPrSectionNames(List<String> prSectionNames) {
		this.prSectionNames = prSectionNames;
	}

	public int getActiveSection() {
		return activeSection;
	}

	public void setActiveSection(int activeSection) {
		this.activeSection = activeSection;
	}

	public int getActiveSubSection() {
		return activeSubSection;
	}

	public void setActiveSubSection(int activeSubSection) {
		this.activeSubSection = activeSubSection;
	}

	public int getCurrentOptionalSubSection() {
		return currentOptionalSubSection;
	}

	public void setCurrentOptionalSubSection(int currentOptionalSubSection) {
		this.currentOptionalSubSection = currentOptionalSubSection;
	}

	public int getCurrentOptionalSection() {
		return currentOptionalSection;
	}

	public void setCurrentOptionalSection(int currentOptionalSection) {
		this.currentOptionalSection = currentOptionalSection;
	}

	public List<Integer> getPrSectionIds() {
		return prSectionIds;
	}

	public void setPrSectionIds(List<Integer> prSectionIds) {
		this.prSectionIds = prSectionIds;
	}

}
