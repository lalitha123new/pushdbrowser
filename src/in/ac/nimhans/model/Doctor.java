package in.ac.nimhans.model;

import com.sun.jmx.snmp.Timestamp;

public class Doctor {
    
	private int doctor_id;
	private String doctor_name;
	private String doctor_details;
	private Timestamp createdAt;
	//newly added for add doctor
	private String username;
	private String psw;
	private String email;
	private String phone;
	private String timestamp;
	private String mode;
	
	public int getDoctor_id() {
		return doctor_id;
	}


	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}


	public String getDoctor_name() {
		return doctor_name;
	}


	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}


	public String getDoctor_details() {
		return doctor_details;
	}


	public void setDoctor_details(String doctor_details) {
		this.doctor_details = doctor_details;
	}


	public Timestamp getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
	//newly added for add doctor
		public String getUser_name() {
			return username;
		}


		public void setUser_name(String username) {
			this.username = username;
		}
		
		public String getPsw() {
			return psw;
		}


		public void setPsw(String psw) {
			this.psw = psw;
		}
		
		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}
		
		public String getPhone() {
			return phone;
		}
		
		public void setPhone(String phone) {
			this.phone = phone;
		}
		
		
		public String getTimeStamp() {
			return timestamp;
		}

		public void setTimeStamp(String timestamp) {
			this.timestamp = timestamp;
		}
		
		public String getMode() {
			return mode;
		}

		public void setMode(String mode) {
			this.mode = mode;
		}
		
	
 public Doctor() {
		
	}
 
 public Doctor(int doctor_id, String doctor_name) {
		super();
		this.doctor_id = doctor_id;
		this.doctor_name = doctor_name;
	}
 
 public Doctor(int doctor_id, String doctor_name, String email, String phone, String mode) {
		super();
		this.doctor_id = doctor_id;
		this.doctor_name = doctor_name;
		this.email = email;
		this.phone = phone;
		this.mode = mode;
	}


public Doctor( String doctor_name, String username, String psw, String email, String phone, String timestamp, String mode) {
		super();
		
		this.doctor_name = doctor_name;
		this.username = username;
		this.psw = psw;
		this.email = email;
		this.phone = phone;
		this.mode = mode;
	}
	
}
