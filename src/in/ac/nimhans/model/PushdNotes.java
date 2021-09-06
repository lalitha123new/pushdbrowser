package in.ac.nimhans.model;

import java.sql.Timestamp;

public class PushdNotes {

	private int user_id;
	private String notes;
	private Timestamp time;
	
	
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public static void add(PushdNotes pushdNotes) {
		// TODO Auto-generated method stub
		
	}
	
}
