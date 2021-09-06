package in.ac.nimhans.model;

import java.util.List;

public class DiscoveryPoint extends SubSection {

	private List<Question> questions;
	private List<String> feedback;
	private List<String> options;
	
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	public List<String> getFeedback() {
		return feedback;
	}
	public void setFeedback(List<String> feedback) {
		this.feedback = feedback;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}
}
