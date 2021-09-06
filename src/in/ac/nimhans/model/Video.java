package in.ac.nimhans.model;

import java.util.List;

public class Video extends SubSection {

	private String video;
	private List<String> paragraphs;
	private List<String> feedbacks;
	
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public List<String> getParagraphs() {
		return paragraphs;
	}
	public void setParagraphs(List<String> paragraphs) {
		this.paragraphs = paragraphs;
	}
	public List<String> getFeedbacks() {
		return feedbacks;
	}
	public void setFeedbacks(List<String> feedbacks) {
		this.feedbacks = feedbacks;
	}
}
