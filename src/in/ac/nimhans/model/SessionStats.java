package in.ac.nimhans.model;

public class SessionStats {

	private String loginTime;
	private String logoutTime;
	private String timeSpent;
	private String smiley;
	private String lastActivity;   // time at which last read/update was done by user
	
	public SessionStats() {
		super();		
	}
	
	public SessionStats(String loginTime, String logoutTime, String timeSpent, String smiley, String lastActivity) {
		super();
		this.loginTime = loginTime;
		this.logoutTime = logoutTime;
		this.timeSpent = timeSpent;
		this.smiley=smiley;
		this.lastActivity =lastActivity;
	}
	
	public String getSmiley() {
		return smiley;
	}
	public void setSmiley(String smiley) {
		this.smiley = smiley;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public String getLogoutTime() {
		return logoutTime;
	}
	public void setLogoutTime(String logoutTime) {
		this.logoutTime = logoutTime;
	}
	public String getTimeSpent() {
		return timeSpent;
	}
	public void setTimeSpent(String timeSpent) {
		this.timeSpent = timeSpent;
	}
	
	public String getLastActivity() {
		return lastActivity;
	}
	public void setLastActivity(String lastTime) {
		this.lastActivity = lastTime;
	}
}
