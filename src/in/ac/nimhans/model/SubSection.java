package in.ac.nimhans.model;

import java.util.List;

public class SubSection {

	private String subSectionName;
	private String subSectionId;
	private String subSectionDesc;
	private String subSectionUrl;
	private String exerciseNo;
	private String exerciseType;
	private String exerciseGT;
	private String exerciseTitle;
	private long minfields;
	private List<String> exerciseDesc;
	
	public String getSubSectionDesc() {
		return subSectionDesc;
	}
	public void setSubSectionDesc(String subSectionDesc) {
		this.subSectionDesc = subSectionDesc;
	}
	
	public void setminfields(long minfields) {
		this.minfields = minfields;
	}
	
	public long getminfields() {
		return minfields;
	}
	public String getExerciseTitle() {
		return exerciseTitle;
	}
	public void setExerciseTitle(String exerciseTitle) {
		this.exerciseTitle = exerciseTitle;
	}
	public String getSubSectionName() {
		return subSectionName;
	}
	public void setSubSectionName(String subSectionName) {
		this.subSectionName = subSectionName;
	}
	public String getSubSectionUrl() {
		return subSectionUrl;
	}
	public void setSubSectionUrl(String subSectionUrl) {
		this.subSectionUrl = subSectionUrl;
	}
	public String getSubSectionId() {
		return subSectionId;
	}
	public void setSubSectionId(String subSectionId2) {
		this.subSectionId = subSectionId2;
	}
	/*public String getNextUrl() {
		return nextUrl;
	}
	public void setNextUrl(String nextUrl) {
		this.nextUrl = nextUrl;
	}*/
	public List<String> getExerciseDesc() {
		return exerciseDesc;
	}
	public void setExerciseDesc(List<String> exerciseDesc) {
		this.exerciseDesc = exerciseDesc;
	}
	public String getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(String exerciseNo) {
		this.exerciseNo = exerciseNo;
	}
	public String getExerciseType() {
		return exerciseType;
	}
	public void setExerciseType(String exerciseType) {
		this.exerciseType = exerciseType;
	}
	public String getExerciseGT() {
		return exerciseGT;
	}
	public void setExerciseGT(String exerciseGT) {
		this.exerciseGT = exerciseGT;
	}
	
}
