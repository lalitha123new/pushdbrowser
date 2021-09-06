package in.ac.nimhans.model;

import java.util.ArrayList;
import java.util.List;

public class Table {

	private int rows;
	private int cols;
	private int type;
	private String title;
	private String[][] tbody;
	private List<String> thead = new ArrayList<>();
	private List<String> options = new ArrayList<>();
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getCols() {
		return cols;
	}
	public void setCols(int cols) {
		this.cols = cols;
	}
	public String[][] getTbody() {
		return tbody;
	}
	public void setTbody(String[][] tbody) {
		this.tbody = tbody;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}
	public List<String> getThead() {
		return thead;
	}
	public void setThead(List<String> thead) {
		this.thead = thead;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
