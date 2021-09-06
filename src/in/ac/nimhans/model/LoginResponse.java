package in.ac.nimhans.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class LoginResponse{
	
	private String id;
	private String adminId = "0";// change this when admin id changes.

	public LoginResponse(){
		
	}
	public LoginResponse(String string){
		this.id=string;
	}
	
	// setters and getters
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String toString() {
		return "Response " + id + "-" + adminId;
		
	}
	
	public String getAdminId() {
		return adminId;
	}
}
