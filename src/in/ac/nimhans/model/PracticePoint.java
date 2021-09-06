package in.ac.nimhans.model;

import java.util.ArrayList;
import java.util.List;

public class PracticePoint extends SubSection {

	private List<Question> questions;
	private String feedback;
	private List<Table> tables;
	private List<String> data;
	private ArrayList<Activity> activities;
	private ArrayList<Activity> pleasurable;
	private ArrayList<Activity> meaningful;
	private ArrayList<Activity> mastery_oriented;
	private String version;
	private ArrayList<Activity> planner;
	
	public List<Table> getTables() {
		return tables;
	}
	public void setTables(List<Table> tables) {
		this.tables = tables;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public ArrayList<Activity> getActivities() {
		return activities;
	}
	public void setActivities(ArrayList<Activity> activities) {
		this.activities = activities;
	}
	public ArrayList<Activity> getPlanner() {
		return planner;
	}
	public void setPlanner(ArrayList<Activity> planner) {
		this.planner = planner;
	}
	public ArrayList<Activity> getPleasurable() {
		return pleasurable;
	}
	public void setPleasurable(ArrayList<Activity> pleasurable) {
		this.pleasurable = pleasurable;
	}
	public ArrayList<Activity> getMeaningful() {
		return meaningful;
	}
	public void setMeaningful(ArrayList<Activity> meaningful) {
		this.meaningful = meaningful;
	}
	public ArrayList<Activity> getMastery_oriented() {
		return mastery_oriented;
	}
	public void setMastery_oriented(ArrayList<Activity> mastery_oriented) {
		this.mastery_oriented = mastery_oriented;
	}
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
}
