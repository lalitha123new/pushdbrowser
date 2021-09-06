package in.ac.nimhans.model;

public class Stats {
	
	private String nextSession;
	private int	activeSubSection;
	private int	noOfExercisesCompleted;
	private int	prSectionId;
	private int	currentSection;
	private int	noOfSectionsCompleted;
	private int	remindersNeeded;
	private int	currentSubSection;
	private int	noOfSubSectionsCompleted;
	private int	noOfTimesLoggedIn;
	private int	activeSection;
	private String status;
	private String blockedSection;
	private String prSections;
	private int	currentOptionalSection;
	private int	currentOptionalSubSection;
	private int	user_id1;
	
	public Stats() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Stats(int user_id1, String nextSession,int activeSubSection, int noOfExercisesCompleted, int prSectionId,
	         int currentSection, int noOfSectionsCompleted, int remindersNeeded, int currentSubSection, int noOfSubSectionsCompleted,
	         int noOfTimesLoggedIn, int activeSection, String status, 
	         String blockedSection, String prSections, int currentOptionalSection, int currentOptionalSubSection)
	  {
super();
this.user_id1 = user_id1;
this.nextSession = nextSession;
this.activeSubSection = activeSubSection;
this.noOfExercisesCompleted = noOfExercisesCompleted;
this.prSectionId = prSectionId;
this.currentSection = currentSection;
this.noOfSectionsCompleted = noOfSectionsCompleted;
this.remindersNeeded = remindersNeeded;
this.currentSubSection = currentSubSection;
this.noOfSubSectionsCompleted = noOfSubSectionsCompleted;
this.noOfTimesLoggedIn = noOfTimesLoggedIn;
this.activeSection = activeSection;
this.status = status;
this.blockedSection = blockedSection;
this.prSections = prSections;
this.currentOptionalSection = currentOptionalSection;
this.currentOptionalSubSection = currentOptionalSubSection;

}

	
	
	public int getUser_id1() {
		return user_id1;
	}
	public void setUser_id1(int user_id1) {
		this.user_id1 = user_id1;
	}
	public String getNextSession() {
		return nextSession;
	}
	public void setNextSession(String nextSession) {
		this.nextSession = nextSession;
	}
	public int getActiveSubSection() {
		return activeSubSection;
	}
	public void setActiveSubSection(int activeSubSection) {
		this.activeSubSection = activeSubSection;
	}
	public int getNoOfExercisesCompleted() {
		return noOfExercisesCompleted;
	}
	public void setNoOfExercisesCompleted(int noOfExercisesCompleted) {
		this.noOfExercisesCompleted = noOfExercisesCompleted;
	}
	public int getPrSectionId() {
		return prSectionId;
	}
	public void setPrSectionId(int prSectionId) {
		this.prSectionId = prSectionId;
	}
	public int getCurrentSection() {
		return currentSection;
	}
	public void setCurrentSection(int currentSection) {
		this.currentSection = currentSection;
	}
	public int getNoOfSectionsCompleted() {
		return noOfSectionsCompleted;
	}
	public void setNoOfSectionsCompleted(int noOfSectionsCompleted) {
		this.noOfSectionsCompleted = noOfSectionsCompleted;
	}
	public int getRemindersNeeded() {
		return remindersNeeded;
	}
	public void setRemindersNeeded(int remindersNeeded) {
		this.remindersNeeded = remindersNeeded;
	}
	public int getCurrentSubSection() {
		return currentSubSection;
	}
	public void setCurrentSubSection(int currentSubSection) {
		this.currentSubSection = currentSubSection;
	}
	public int getNoOfSubSectionsCompleted() {
		return noOfSubSectionsCompleted;
	}
	public void setNoOfSubSectionsCompleted(int noOfSubSectionsCompleted) {
		this.noOfSubSectionsCompleted = noOfSubSectionsCompleted;
	}
	public int getNoOfTimesLoggedIn() {
		return noOfTimesLoggedIn;
	}
	public void setNoOfTimesLoggedIn(int noOfTimesLoggedIn) {
		this.noOfTimesLoggedIn = noOfTimesLoggedIn;
	}
	public int getActiveSection() {
		return activeSection;
	}
	public void setActiveSection(int activeSection) {
		this.activeSection = activeSection;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBlockedSection() {
		return blockedSection;
	}
	public void setBlockedSection(String blockedSection) {
		this.blockedSection = blockedSection;
	}
	public String getPrSections() {
		return prSections;
	}
	public void setPrSections(String prSections) {
		this.prSections = prSections;
	}
	public int getCurrentOptionalSection() {
		return currentOptionalSection;
	}
	public void setCurrentOptionalSection(int currentOptionalSection) {
		this.currentOptionalSection = currentOptionalSection;
	}
	public int getCurrentOptionalSubSection() {
		return currentOptionalSubSection;
	}
	public void setCurrentOptionalSubSection(int currentOptionalSubSection) {
		this.currentOptionalSubSection = currentOptionalSubSection;
	}
	
	
	
	
}
