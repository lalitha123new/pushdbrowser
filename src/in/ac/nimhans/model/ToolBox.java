package in.ac.nimhans.model;

import java.util.List;

public class ToolBox extends SubSection {

	private List<String> lists;
	private String image;
	private String feedback;
	
	public List<String> getLists() {
		return lists;
	}

	public void setLists(List<String> lists) {
		this.lists = lists;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	
}
