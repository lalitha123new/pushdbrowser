package in.ac.nimhans.model;

import java.util.List;

public class Question {

	private String quesNo;
	private String ques;
	private String ans;
	private String prSectionId;
	private List<String> explanations;
	private List<AnswerOption> answerOptions;
	private List<String> blanks;
	private List<Question> quesLists;
	
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	/*public List<Paragraph> getExplanations() {
		return explanations;
	}
	public void setExplanations(List<Paragraph> explanations) {
		this.explanations = explanations;
	}*/
	public String getQuesNo() {
		return quesNo;
	}
	public void setQuesNo(String quesNo) {
		this.quesNo = quesNo;
	}
	public List<String> getExplanations() {
		return explanations;
	}
	public void setExplanations(List<String> explanations) {
		this.explanations = explanations;
	}
	public String getPrSectionId() {
		return prSectionId;
	}
	public void setPrSectionId(String prSectionId) {
		this.prSectionId = prSectionId;
	}
	public List<AnswerOption> getAnswerOptions() {
		return answerOptions;
	}
	public void setAnswerOptions(List<AnswerOption> answerOptions) {
		this.answerOptions = answerOptions;
	}
	public List<String> getBlanks() {
		return blanks;
	}
	public void setBlanks(List<String> blanks) {
		this.blanks = blanks;
	}
	public List<Question> getQuesLists() {
		return quesLists;
	}
	public void setQuesLists(List<Question> quesLists) {
		this.quesLists = quesLists;
	}
}
