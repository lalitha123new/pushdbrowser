package in.ac.nimhans.model;

import java.util.ArrayList;
import java.util.List;

public class UsageStats {

	private int website_visits_count;
	private int registration_request_count;
	private int registrated_users;
	private int Noflogins;
	private int NofloginsByDesktop;
	private int NofloginsByMobiBrowser;
	private int NofloginsByApp;
	private int completedAllSections;
	private int NotcompletedAllSections;
	
	private String reg_form1;
	private String reg_form2;
	private String reg_form3;
	private String reg_form4;
	
	private String scr_date;
	private String scr_responce;
	
	private String scr_date1;
	private String scr_responce1;
	
	
	private int user_id;
	

	private String reg_cmp_time;
	
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getReg_cmp_time() {
		return reg_cmp_time;
	}
	public void setReg_cmp_time(String reg_cmp_time) {
		this.reg_cmp_time = reg_cmp_time;
	}

	
	
	
	public int getWebsite_visits_count() {
		return website_visits_count;
	}
	public void setWebsite_visits_count(int website_visits_count) {
		this.website_visits_count = website_visits_count;
	}
	public int getRegistration_request_count() {
		return registration_request_count;
	}
	public void setRegistration_request_count(int registration_request_count) {
		this.registration_request_count = registration_request_count;
	}
	public int getRegistrated_users() {
		return registrated_users;
	}
	public void setRegistrated_users(int registrated_users) {
		this.registrated_users = registrated_users;
	}
	public int getNoflogins() {
		return Noflogins;
	}
	public void setNoflogins(int noflogins) {
		Noflogins = noflogins;
	}
	public int getNofloginsByDesktop() {
		return NofloginsByDesktop;
	}
	public void setNofloginsByDesktop(int nofloginsByDesktop) {
		NofloginsByDesktop = nofloginsByDesktop;
	}
	public int getNofloginsByMobiBrowser() {
		return NofloginsByMobiBrowser;
	}
	public void setNofloginsByMobiBrowser(int nofloginsByMobiBrowser) {
		NofloginsByMobiBrowser = nofloginsByMobiBrowser;
	}
	public int getNofloginsByApp() {
		return NofloginsByApp;
	}
	public void setNofloginsByApp(int nofloginsByApp) {
		NofloginsByApp = nofloginsByApp;
	}
	public int getCompletedAllSections() {
		return completedAllSections;
	}
	public void setCompletedAllSections(int completedAllSections) {
		this.completedAllSections = completedAllSections;
	}
	public int getNotcompletedAllSections() {
		return NotcompletedAllSections;
	}
	public void setNotcompletedAllSections(int notcompletedAllSections) {
		NotcompletedAllSections = notcompletedAllSections;
	}
	
	
	public String getReg_form1() {
		return reg_form1;
	}
	public void setReg_form1(String reg_form1) {
		this.reg_form1 = reg_form1;
	}
	public String getReg_form2() {
		return reg_form2;
	}
	public void setReg_form2(String reg_form2) {
		this.reg_form2 = reg_form2;
	}
	public String getReg_form3() {
		return reg_form3;
	}
	public void setReg_form3(String reg_form3) {
		this.reg_form3 = reg_form3;
	}
	public String getReg_form4() {
		return reg_form4;
	}
	public void setReg_form4(String reg_form4) {
		this.reg_form4 = reg_form4;
	}
	
	
	public String getScr_date() {
		return scr_date;
	}
	public void setScr_date(String scr_date) {
		this.scr_date = scr_date;
	}
	public String getScr_responce() {
		return scr_responce;
	}
	public void setScr_responce(String scr_responce) {
		this.scr_responce = scr_responce;
	}
	
	public String getScr_date1() {
		return scr_date1;
	}
	public void setScr_date1(String scr_date1) {
		this.scr_date1 = scr_date1;
	}
	public String getScr_responce1() {
		return scr_responce1;
	}
	public void setScr_responce1(String scr_responce1) {
		this.scr_responce1 = scr_responce1;
	}
	
	
 public UsageStats() {
		
	}
 
 
 
 public UsageStats(int website_visits_count, int registration_request_count, int registrated_users, int Noflogins, int NofloginsByDesktop, int NofloginsByMobiBrowser, int NofloginsByApp, int completedAllSections, int NotcompletedAllSections) {
		super();
		this.website_visits_count = website_visits_count;
		this.registration_request_count = registration_request_count;
		this.registrated_users = registrated_users;
		this.Noflogins= Noflogins;
		this.NofloginsByDesktop=NofloginsByDesktop;
		this.NofloginsByMobiBrowser = NofloginsByMobiBrowser;
		this.NofloginsByApp= NofloginsByApp;
		this.completedAllSections=completedAllSections;
		this.NotcompletedAllSections=NotcompletedAllSections;
	}
 
 
 
 public UsageStats(int user_id,String reg_form1,String reg_form2,String reg_form3,String reg_form4, String reg_cmp_time, String scr_date,String scr_responce, String scr_date1, String scr_responce1) {
	
	    super();
	    this.user_id = user_id;
	    this.reg_form1 = reg_form1;
		this.reg_form2 = reg_form2;
		this.reg_form3 = reg_form3;
		this.reg_form4 = reg_form4;
		this.reg_cmp_time = reg_cmp_time;
		this.scr_date = scr_date;
		this.scr_responce =scr_responce;
		this.scr_date1 = scr_date1;
		this.scr_responce1 =scr_responce1;
	}
 
public void add(UsageStats reg_details1) {
	// TODO Auto-generated method stub
	
}
	
}
