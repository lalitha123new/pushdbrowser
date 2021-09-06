package in.ac.nimhans.model;

import java.util.List;

public class Workbook {

	private int version;
	private List<String> links;
	private Link link;
	private List<PracticePoint> practicePoints;
	private List<CheckPoint> checkPoints;
	
	public List<String> getLinks() {
		return links;
	}

	public void setLinks(List<String> links) {
		this.links = links;
	}

	public Link getLink() {
		return link;
	}

	public void setLink(Link link) {
		this.link = link;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public List<PracticePoint> getPracticePoints() {
		return practicePoints;
	}

	public void setPracticePoints(List<PracticePoint> practicePoints) {
		this.practicePoints = practicePoints;
	}

	public List<CheckPoint> getCheckPoints() {
		return checkPoints;
	}

	public void setCheckPoints(List<CheckPoint> checkPoints) {
		this.checkPoints = checkPoints;
	}

	
}
