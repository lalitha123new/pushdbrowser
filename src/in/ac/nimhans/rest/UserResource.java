package in.ac.nimhans.rest;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;
import javax.ws.rs.core.UriInfo;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.parser.ParseException;

import in.ac.nimhans.model.Doctor;
import in.ac.nimhans.model.LoginResponse;
import in.ac.nimhans.model.PushdNotes;
import in.ac.nimhans.model.Section;
import in.ac.nimhans.model.SectionData3;
import in.ac.nimhans.model.UsageStats;
import in.ac.nimhans.model.User;
import in.ac.nimhans.model.Workbook;
import in.ac.nimhans.service.UserSectionService;
import in.ac.nimhans.service.UserService;
import in.ac.nimhans.service.SMSServices;
import in.ac.nimhans.service.JSONFileException;
import in.ac.nimhans.service.ReminderService;


@Path("users")
@Produces(MediaType.APPLICATION_JSON)
public class UserResource {
	

	UserService userService = new UserService();
	SMSServices smsservices = new SMSServices();
	UserSectionService userSectionService = new UserSectionService();
	ReminderService reminderService = new ReminderService();
	
	
	@POST
	@Path("/responce")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public void saveResponce(@QueryParam("user_id") int user_id, @QueryParam("screener_flag") int screener_flag, @FormParam("responce") String responce) {
		
		System.out.println("gfgfgjhkjhjg------"+screener_flag+"useid is ----"+user_id);
		//userService.updateLastActivity(user_id);
		userService.saveResponse(user_id,screener_flag,responce);
		
	}
	//verifyEmailId
	@POST
	@Path("/verifyEmailId/{email}")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public int verifyEmailId(@PathParam("email") String email) throws UnsupportedEncodingException, ParseException {
		
		System.out.println("syettetet "+email);
		
		int id = userService.verfiyEmail(email);
		return id;
	}
	
	// forgot password
   
    @POST
    @Path("/forgotpassword/{email}")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
    public int forgotPassword(@PathParam("email") String email) throws ParseException, UnsupportedEncodingException {

       return userService.forgotPassword(email);
    	//return 0;
    }
	
	
	
	@GET
	@Path("/download")
	@Produces("application/csv")
	public Response getFile() {  
        File file = userService.getResponseFile();
   
        ResponseBuilder response = Response.ok((Object) file);  
        response.header("Content-Disposition","attachment; filename=\"responce.csv\"");  
        return response.build();  
   
    }  
	
	@POST
	@Path("/admin/feedback/{userId}/sections/{sectionId}/subsections/{subsectionId}")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setFeedback(@PathParam("userId") String userId,@PathParam("sectionId") String sectionId,
			@PathParam("subsectionId") String subsectionId, @FormParam("feedback") String feedback) {
		//System.out.println("UR Method : setFeedback , UserId=" + userId + "section Id "+ sectionId);
		//System.out.println("user Feedback"+feedback);
		userService.updateLastActivity(Integer.parseInt(userId));
		userService.setFeedback(Integer.parseInt(userId), Integer.parseInt(sectionId), Integer.parseInt(subsectionId),feedback);
	}
	
	@GET
	@Path("/feedback/{userId}/sections/{sectionId}/subsections/{subsectionId}")
	public User getFeedback(@PathParam("userId") String userId,@PathParam("sectionId") String sectionId,
			@PathParam("subsectionId") String subsectionId) 
	{
		userService.updateLastActivity(Integer.parseInt(userId));
		if(sectionId.equals("3") && sectionId.equals("2")) {
			System.out.println("for WorkBook UR , UserId= " + userId + " section Id "+ sectionId+ " subsectionId  "+ subsectionId);
		}
		User user = userService.getFeedback(Integer.parseInt(userId), Integer.parseInt(sectionId), Integer.parseInt(subsectionId)); //use this for get feedback
		//User user = new User();
		//System.out.println(user.getFname());
		return user;
		
	}
	
	@GET
	@Path("/summary/{userId}/sections/{sectionId}")
	public User getSummary(@PathParam("userId") int userId,@PathParam("sectionId") int sectionId) throws NumberFormatException, SQLException 
	{
		//System.out.println("UR Method : getSummary , UserId=" + userId + "section Id "+ sectionId);
		userService.updateLastActivity(userId);
		User user = userService.getSummary(userId, sectionId);
		//System.out.println(user.getFname());
		//System.out.println(user.getName());
		////System.out.println(user);
		return user;
		
	}
	@GET
	@Path("/summary/{userId}/allsections")
	public List<User> getAllSummary(@PathParam("userId") int userId) throws SQLException 
	{
		System.out.println("UR Method : getSummary , UserId=" + userId );
		//System.out.println("hi");
		//userService.updateLastActivity(userId);
		return userService.getAllSummary(userId);
		//System.out.println(user.getFname());
		//System.out.println(user.getName());
		
	}
	
	
	
	/**
	 *	Get the list of all users
	 *	@return List<String> arrayList of users 
	 */
	@GET
	public List<User> getUsers() {
		//System.out.println("UR Method : getUsers");
		return userService.getAllUsers();
	}
	
	@PUT
	@Path("{userId}/status/{value}")
	public void setStatus(@PathParam("userId") String userId, @PathParam("value") String value) {
		//System.out.println("UR setStatus : userId=" + userId + " value=" + value);
		//userService.updateLastActivity(Integer.parseInt(userId));
		userService.setStatus(Integer.parseInt(userId), value);
	}
	
	@PUT
	@Path("{userId}/flag/{value}")
	public void setFlag(@PathParam("userId") String userId, @PathParam("value") String value) {
		userService.setFlag(Integer.parseInt(userId), value);
	}
	
	@PUT
	@Path("{userId}/smiley/{value}")
	public void setSmiley(@PathParam("userId") String userId, @PathParam("value") String value) {
		//System.out.println("UR setSmiley : userId=" + userId + " value=" + value);
		userService.updateLastActivity(Integer.parseInt(userId));
		userService.setSmiley(Integer.parseInt(userId), value);
	}
	
	@PUT
	@Path("{userId}/feedback/{value}")
	public void addfeedback(@PathParam("userId") String userId, @PathParam("value") String value) {
		userService.updateLastActivity(Integer.parseInt(userId));
		userService.addfeedback(Integer.parseInt(userId), value);
	}
	
	@PUT
	@Path("{userId}/note/{value}")
	public void addnote(@PathParam("userId") String userId, @PathParam("value") String value) {
		//System.out.println("UR addnotes : userId=" + userId + " value=" + value);
		//System.out.println("hiiiiiiiiiiiiiiii");
		userService.addnote(Integer.parseInt(userId), value);
	}
	
	
	@PUT
	@Path("{userId}/mode/{value}")
	public void setMode(@PathParam("userId") String userId, @PathParam("value") String value) {
		//System.out.println("UR setStatus : userId=" + userId + " value=" + value);
		//System.out.println("hiiiiiiiiiiiiiiii");
		userService.setMode(Integer.parseInt(userId), value);
	}
	
	@POST
	@Path("/s/login")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String login(@FormParam("name") String name, @FormParam("pwd") String password) {
		//loging for old mobile app
			return "invalid";	
	}
	
	@POST
	@Path("/s/new_login")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String new_login(@FormParam("name") String name, @FormParam("pwd") String password, @FormParam("app_type") String app_type) {
		
	
		
		LoginResponse response = userService.login(name, password, app_type);
		if(response.getId().equals("0")) {
			//Admin login
			return "invalid";
			
		} else if(response.getId().equals("inactiveUser")){
			//inActive users
			return "inactiveUser";
			
		}else {
			//Normal Users
			return response.getId();
		}
		
	}
	
	@POST
	@Path("/admin/login")
	public LoginResponse adminLogin(@FormParam("name") String name, @FormParam("pwd") String password, @FormParam("app_type") String app_type) throws NoSuchAlgorithmException, InvalidKeySpecException, SQLException {
		//System.out.println("UR Method : login name=" + name);
		LoginResponse response = userService.adminLogin(name, password,app_type);
		System.out.println(response);
		return response;
	}
	
	/**
	 * Sets the value of agreed , when agreed to the terms of use
	 * @param userId 	id of the user
	 * @param value		true(always)
	 */
	@POST
	@Path("/{userId}/{value}")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setAgreed(@PathParam("userId") String userId, @PathParam("value") boolean value) {
	  System.out.println("UR Method : setAgreed , UserId=" + userId+"---"+value);
		if(value)
			userService.setAgreed(userId);
	}
	
	/**
	 * Test method for android login
	 * @param userId
	 * @param value
	 * @param name
	 * @param password
	 */
	@POST
	@Path("/{userId}/login")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setValues(@PathParam("userId") String userId, @PathParam("value") boolean value, @FormParam("name") String name, @FormParam("password") String password) {
		//System.out.println("UR Method : setValues , UserId=" + userId + " Value=" + value + " Name=" + name + " Password=" + password);
//		if(value)
//			userService.setAgreed(userId);
	}
	
	/**
	 * get specific user details
	 * @param userId	id of the user
	 * @return	User model is returned
	 */
	@GET
	@Path("/{userId}")
	public User getUser(@PathParam("userId") String userId) {
		//System.out.println("UR Method : getUser , UserId=" + userId);
		return userService.getUser(Integer.parseInt(userId), false);
	}
	
	/**
	 * Returns the details about current section, subsection and personally
	 * relevant sections
	 * @param userId
	 * @return	Section object containing above details
	 */
	@GET
	@Path("/{userId}/currSubSection")
	public Section getCurrentSubSection(@PathParam("userId") String userId) {
		//System.out.println("UR Method : getCurrentSubSection , UserId=" + userId);
		Section section = new Section();
		return userSectionService.getCurrentSubSection(section, Integer.parseInt(userId), true);
	}
	
	@GET
	@Path("/{userId}/currSection")
	public Section getCurrentSection(@PathParam("userId") String userId) {
		//System.out.println("UR Method : getCurrentSection , UserId=" + userId);
		userService.updateLastActivity(Integer.parseInt(userId));
		Section section = new Section();
		userSectionService.getCurrentSection(section, Integer.parseInt(userId), true);
		return section;
	}
	
	@GET
	@Path("/{userId}/currOptionalSection")
	public Section getCurrentOptionalSection(@PathParam("userId") String userId) {
		//System.out.println("UR Method : getCurrentOptionalSection , UserId=" + userId);
		userService.updateLastActivity(Integer.parseInt(userId));
		Section section = new Section();
		userSectionService.getCurrentSection(section, Integer.parseInt(userId), false);
		return section;
	}
	
	
	@GET
	@Path("/admin/{userId}")
	public User getUserDetails(@PathParam("userId") int userId) {
		System.out.println("UR Method : get UserDetails , UserId=" + userId);
		return userService.getUser(userId, true);
	}
	
	
	//to get doctorList
	@GET
	@Path("/admin/doctor")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public List<Doctor> getDoctorList() {
		
		return userService.getDoctorList();
	}
	
	@GET
	@Path("/{userId}/stats")
	public User getUserStats(@PathParam("userId") String userId) {
		//System.out.println("UR Method : getUserStats , UserId=" + userId);
		return userService.getUserStats(userId);
	}
	
	@POST
	@Path("/locksection")
	public void lockSection(@QueryParam("userId") String userId,@QueryParam("lock") String lock){
		
		userSectionService.lockSections(Integer.parseInt(userId), lock);

	}
	
	@GET
	@Path("/getlocksection")
	public Response getlocksection(@QueryParam("userId") String userId) throws JsonGenerationException, JsonMappingException, IOException{
		
		ObjectMapper objectMapper = new ObjectMapper();
		String list = objectMapper.writeValueAsString(userSectionService.getlockSection(Integer.parseInt(userId)));	
        return Response.status(200).entity(list).type(MediaType.APPLICATION_JSON).build();
	}
	
	@POST
	@Path("/{userId}/nextSession")
	public void setNextSession(	@PathParam("userId") String userId, 
								@FormParam("date") String date,
								@FormParam("time") String time) {
		//System.out.println("UR Method : setUserLogout , UserId=" + userId + " date=" + date + " time=" +time);
		userService.logout(Integer.parseInt(userId));
		userService.setNextSession(Integer.parseInt(userId), date, time);
	}
	
	@POST
	@Path("/{userId}/logout")
	public void setUserLogout(	@PathParam("userId") String userId) {
		//System.out.println("UR Method : setUserLogout , UserId=" + userId);
		userService.logout(Integer.parseInt(userId));
	}
	
	/**
	 * Returns next subsection or section details for given sectionId and subsectionId
	 * for particular user
	 * @param userId
	 * @param sectionId
	 * @param subSectionId
	 * @return	Section object containing currentSection, currentSubSection
	 */
	@GET
	@Path("/{userId}/next/{sectionId}/{subsectionId}")
	public Section getNextSection(@PathParam("userId") String userId,
			@PathParam("sectionId") String sectionId,
			@PathParam("subsectionId") String subSectionId) {
		//System.out.println("UR Method : getNextSection , UserId=" + userId + " SectionId=" + sectionId + " SubSectionId=" + subSectionId);
		return userSectionService.getNextSection(Integer.parseInt(userId), Integer.parseInt(sectionId), Integer.parseInt(subSectionId));
	}
	
	@GET
	@Path("/{userId}/view/{sectionId}/{subsectionId}")
	public Section viewNextSubSection(@PathParam("userId") String userId,
			@PathParam("sectionId") String sectionId,
			@PathParam("subsectionId") String subSectionId) {
		userService.updateLastActivity(Integer.parseInt(userId));
		//System.out.println("UR Method : viewNextSection , UserId=" + userId + " SectionId=" + sectionId + " SubSectionId=" + subSectionId);
		return userSectionService.viewNextSection(Integer.parseInt(userId), Integer.parseInt(sectionId), Integer.parseInt(subSectionId));
	}
	
	@GET
	@Path("/{userId}/optional/{sectionId}/{subsectionId}")
	public Section optionalNextSubSection(@PathParam("userId") String userId,
			@PathParam("sectionId") String sectionId,
			@PathParam("subsectionId") String subSectionId) {
		userService.updateLastActivity(Integer.parseInt(userId));
		return userSectionService.optionalNextSubSection(Integer.parseInt(userId), Integer.parseInt(sectionId), Integer.parseInt(subSectionId));
	}
	
	@GET
	@Path("/{userId}/sections/{sectionId}/view")
	public Section viewSection(@PathParam("userId") String userId,
			@PathParam("sectionId") String sectionId) {
		userService.updateLastActivity(Integer.parseInt(userId));
		//System.out.println("UR Method : viewNextSection , UserId=" + userId + " SectionId=" + sectionId);
		return userSectionService.viewSection(Integer.parseInt(userId), Integer.parseInt(sectionId));
	}
	
	@GET
	@Path("/{userId}/workbookLinks")
	public Workbook getWorkbookLinks(@PathParam("userId") int userId) {
		//System.out.println("UR Method : getWorkbook , UserId=" + userId);
		return userSectionService.getWorkbookLinks(userId);
	}	
	
	
	
	
	/**
	 * Sets the personally relevant sections for particular user
	 * @param userId
	 * @param check
	 * @return	List<String> containing personally relevant section names 
	 */
	@POST
	@Path("/{userId}/baseline")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Section setBaseLine(@PathParam("userId") String userId, @FormParam("check") List<String> check) {
		//System.out.println("UR Method : setBaseLine , UserId=" + userId + " , ListSize=" + check.size());
		return userSectionService.setBaseLine(check, Integer.parseInt(userId));
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/review")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setSectionReview (	@PathParam("userId") String userId, 
									@PathParam("sectionId") int sectionId, 
									@FormParam("review") int value	) {
		//System.out.println("UR Method : setSectionReview , UserId=" + userId + " , SectionId="			+ sectionId + " ,  review=" + value);
		
		sectionId--;
		userService.updateLastActivity(Integer.parseInt(userId));
		
		userSectionService.setSectionReview(Integer.parseInt(userId), sectionId, value);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/summary")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setSectionSummary (	@PathParam("userId") String userId, 
									@PathParam("sectionId") int sectionId, 
									@FormParam("summary") String summary	) {
		//System.out.println("UR Method : setSectionSummary , UserId=" + userId + " , SectionId="	 			+ sectionId + " ,  summary=" + summary);
		userService.updateLastActivity(Integer.parseInt(userId));
		sectionId--;
		userSectionService.setSectionSummary(Integer.parseInt(userId), sectionId, summary);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setDiscoveryPoint(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @FormParam("check") List<String> check) {
		//System.out.println("Inside setDiscoveryPoint");
		userSectionService.setDiscoveryPoint(check, userId, sectionId, subSectionId);
	}

	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/discovery5")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setDiscoveryPoint5(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @FormParam("check") List<String> check,
								  @FormParam("suicide") boolean suicide) {
		//System.out.println("Inside setDiscoveryPoint5");
		userSectionService.setDiscoveryPoint5(check, userId, sectionId, subSectionId, suicide);
	}

	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/tool2")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setToolBox2(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @FormParam("check") List<String> check,
								  @FormParam("data") List<String> data) {
		//System.out.println("Inside setDiscoveryPoint5");
		userSectionService.setToolBox2(userId, sectionId, subSectionId, data, check, 1);
	}
	
	@GET
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/practice3/workbook")
	public Workbook getPracticePoint3Workbook(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId) {
		//System.out.println("UR : getPracticePoint3Workbook");
		return userSectionService.getPracticePoint3Workbook(userId, sectionId, subSectionId);
	}
	
//	@GET
//	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/potentialList")
//	public Workbook getPotentialList(@PathParam("userId") String userId,
//								  @PathParam("sectionId") String sectionId,
//								  @PathParam("subsectionId") String subSectionId) {
//		//System.out.println("UR : getPotentialList");
//		return userSectionService.getPotentialList(userId, sectionId, subSectionId);
//	}
	
	@GET
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/knowledge/workbook")
	public Workbook getPracticePoint4Workbook(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId) {
		//System.out.println("UR : getPracticePoint4Workbook");
		return userSectionService.getPracticePoint4Workbook(userId, sectionId, subSectionId);
	}
	
	@GET
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/check3/workbook")
	public Workbook getCheckPoint3Workbook(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId) {
		System.out.println("for *simha* 3.4 ----"+sectionId+"  subSectionId  "+subSectionId);
		//System.out.println("UR : getCheckPoint3Workbook");
		
		
		return userSectionService.getCheckPoint3Workbook(userId, sectionId, subSectionId);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/practice3/new")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Workbook setPracticePoint3New(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @FormParam("page") int pageNo,
								  @FormParam("act") List<String> act,
								  @FormParam("freq") List<String> freq,
								  @FormParam("scale") List<Integer> scale) {
		System.out.println("UR : setPracticePoint3New uid=" + userId + " sid=" + sectionId + " ssid=" + subSectionId);
		return userSectionService.setPracticePoint3(userId, sectionId, subSectionId, pageNo, act, freq, scale, 0);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/practice3/continue/{version}")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Workbook setPracticePoint3Continue(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @PathParam("version") int version,
								  @FormParam("page") int pageNo,
								  @FormParam("act") List<String> act,
								  @FormParam("freq") List<String> freq,
								  @FormParam("scale") List<Integer> scale) {
		System.out.println("UR : setPracticePoint3Continue uid=" + userId + " sid=" + sectionId + " ssid=" + subSectionId);
		return userSectionService.setPracticePoint3(userId, sectionId, subSectionId, pageNo, act, freq, scale, version);
	}
	
	//3rd section posting data into database
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/3rdSecdata/{version}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response setPracticePoint3postdata(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @PathParam("version") int version,SectionData3 sectionData) {
		
		
		System.out.println("version--4--"+version);
		
		@SuppressWarnings("unused")
		SectionData3 one = userSectionService.setSecton3Info(sectionData);
		
		userService.updateLastActivity(Integer.parseInt(userId));
		System.out.println("UR : setPracticePoint3Co"+ sectionId +"____"+subSectionId);
		//return userService.setPracticePoint3(userId, sectionId, subSectionId, pageNo, act, freq, scale, version);
		System.out.println(userId);
		return null;
	}
	
	
	//3.2 work book section
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/3rdSecdata")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response setPracticePoint3postdata1(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @PathParam("version") int version,SectionData3 sectionData) {
		
		System.out.println("version--1--"+version);
		
		@SuppressWarnings("unused")
		SectionData3 one = userSectionService.setSecton3Info(sectionData);
		
		
		System.out.println("UR : setPracticePoint3Co"+ sectionId +"____"+subSectionId);
		//return userService.setPracticePoint3(userId, sectionId, subSectionId, pageNo, act, freq, scale, version);
		System.out.println(userId);
		return null;
	}
	
	
	
	@GET
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/3rdSecdata/{version}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getPracticePoint3postdata(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @PathParam("version") int version) {
		System.out.println("version--2--"+version);
		
		List <SectionData3> sectionData3info1 = new ArrayList<SectionData3>(); 
		
		
		 sectionData3info1 = userSectionService.getSecton3Info(userId,sectionId,subSectionId,version);
		 System.out.println("UR : setPracticePoint3Co"+ sectionId +"____"+subSectionId);
		
		 if (sectionData3info1.isEmpty()) {
				return Response.noContent().build();
			} else {
				return Response.ok().entity(new GenericEntity<List<SectionData3>>(sectionData3info1) {
				}).build();
			}	
			
	}
	
	
	@GET
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/3rdSecdataWB")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getPracticePoint3postdataforWB(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId) {
		//System.out.println("version----"+version);
		
		System.out.println("version--3--"+sectionId);
		
		List <SectionData3> sectionData3info1 = new ArrayList<SectionData3>(); 
		
		
		 sectionData3info1 = userSectionService.getSecton3InfoWB(userId,sectionId,subSectionId);
		
		 if (sectionData3info1.isEmpty()) {
				return Response.noContent().build();
			} else {
				return Response.ok().entity(new GenericEntity<List<SectionData3>>(sectionData3info1) {
				}).build();
			}	
			
	}
	
	
	@GET
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/workbook")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Workbook getWorkbook(  @PathParam("userId") String userId,
							  @PathParam("sectionId") String sectionId,
							  @PathParam("subsectionId") String subSectionId) {
		//System.out.println("UR : getWorkbook");
		return userSectionService.getWorkbook(userId, sectionId, subSectionId);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/workbook")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setWorkbook(  @PathParam("userId") String userId,
							  @PathParam("sectionId") String sectionId,
							  @PathParam("subsectionId") String subSectionId,
							  @FormParam("data") List<String> data) {
		//System.out.println("UR : setWorkbook");
		userSectionService.setWorkbook(userId, sectionId, subSectionId, data);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/practice4/new")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Workbook setPracticePoint4New(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @FormParam("data") List<String> data) throws SQLException {
		
		//System.out.println("UR942018 : setPracticePoint4New"+data);
		return userSectionService.setPracticePoint4(userId, sectionId, subSectionId, data, 0);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/practice4/continue/{version}")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Workbook setPracticePoint4Continue(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @PathParam("version") int version,
								  @FormParam("data") List<String> data) throws SQLException {
		//System.out.println("UR : setPracticePoint4Continue");
		return userSectionService.setPracticePoint4(userId, sectionId, subSectionId, data, version);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/check3/new")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Workbook setCheckPoint3New(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @FormParam("data") List<String> data) {
		
	   System.out.println("UR : setCheckPoint3New 3.6 insert"+data+" hh "+userId+"  sectionId  "+sectionId);
	   
		return userSectionService.setCheckPoint3(userId, sectionId, subSectionId, data, 0);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/check3/continue/{version}")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Workbook setCheckPoint3Continue(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @PathParam("version") int version,
								  @FormParam("data") List<String> data) {
		System.out.println("simha 3.6"+data);
		return userSectionService.setCheckPoint3(userId, sectionId, subSectionId, data, version);
	}
	
	@POST
	@Path("/{userId}/sections/{sectionId}/subsections/{subsectionId}/planner/{version}")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void setWeeklyPlanner(@PathParam("userId") String userId,
								  @PathParam("sectionId") String sectionId,
								  @PathParam("subsectionId") String subSectionId,
								  @PathParam("version") int version,
								  @FormParam("arr") List<String> arr) {
		//System.out.println("UR : setWeeklyPlanner");
		userSectionService.setWeeklyPlanner(userId, sectionId, subSectionId, arr, version);
	}
	
	@Path("/sections/{sectionId}")
	public SectionResource getSectionResponse() {
		//System.out.println("UR Method : getSectionResource");
		return new SectionResource();
	}
	
	@Path("{userId}/sections/{sectionId}")
	public SectionResource getSectionResponse(@PathParam("userId") String userId) {
		//System.out.println("UR Method : getSectionResource , UserId=" + userId);
		return new SectionResource();
	}
	
	
	
	@POST
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Response addUser(@FormParam("id") String id,
							@FormParam("name") String name,
							@FormParam("fname") String fname,
							@FormParam("gender") String gender,
							@FormParam("age") String age,
							@FormParam("password") String password,
							@FormParam("maritalStatus") String maritalStatus,
							@FormParam("livingArrangement") String livingArrangement,
							@FormParam("education") String education,
							@FormParam("mobileNumber") String mobileNumber,
							@FormParam("significantOther") String significantOther,
							@FormParam("mailId") String mailId,
							@FormParam("lastPhoneCall") String lastPhoneCall,
							@FormParam("nextCallDue") String nextCallDue,
							@Context UriInfo uriInfo) throws IOException {
		
		System.out.println("Inside AddUser Resource");
		
		User user = new User();
		user.setMode("active");
		user.setFlag("false");
		user.setId(Integer.parseInt(id));
		user.setName(name);
		user.setFname(fname);
		user.setGender(gender);
		user.setAge(age);
		//System.out.println(user.getAge());
		user.setPassword(password);
		user.setAgreed("false");
		user.setEducation(education);
		user.setMobileNumber(mobileNumber);
		user.setLastPhoneCall(lastPhoneCall);
		user.setLivingArrangement(livingArrangement);
		user.setMaritalStatus(maritalStatus);
		user.setMailId(mailId);
		//System.out.println(user.getMailId());
		user.setNextCallDue(nextCallDue);
		user.setSignificantOther(significantOther);
		//System.out.println(user.getSignificantOther());
		User newUser = userService.addUser(user,true);
//		String newId = Integer.toString(newUser.getId());
//		URI uri = uriInfo.getAbsolutePathBuilder().path(newId).build();
//		return Response
//					.created(uri)
//					.entity(newUser)
//					.build();
		
		return	null;
	}
	
	@POST
	@Path("/updateUser")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void editUser(@FormParam("id") String id,
							@FormParam("name") String name,
							@FormParam("fname") String fname,
							@FormParam("password") String password,
							@FormParam("gender") String gender,
							@FormParam("age") String age,
							@FormParam("maritalStatus") String maritalStatus,
							@FormParam("livingArrangement") String livingArrangement,
							@FormParam("education") String education,
							@FormParam("mobileNumber") String mobileNumber,
							@FormParam("significantOther") String significantOther,
							@FormParam("mailId") String mailId,
							@FormParam("lastPhoneCall") String lastPhoneCall,
							@FormParam("nextCallDue") String nextCallDue,
							@FormParam("doctor_id") int doctor_id,
							@Context UriInfo uriInfo) throws IOException {
		
		System.out.println("Updating user++++++ " + doctor_id);
		
		User user = new User();
		user.setId(Integer.parseInt(id));
		user.setName(name);
		user.setFname(fname);
		user.setGender(gender);
		user.setAge(age);
		user.setEducation(education);
		user.setMobileNumber(mobileNumber);
		user.setLastPhoneCall(lastPhoneCall);
		user.setLivingArrangement(livingArrangement);
		user.setMaritalStatus(maritalStatus);
		user.setMailId(mailId);
		user.setNextCallDue(nextCallDue);
		user.setSignificantOther(significantOther);
		user.setDoctor_id(doctor_id);
		
		if(!(password.isEmpty())){
			user.setPassword(password);
			userService.setPassword(Integer.parseInt(id), password);
		}
		userService.updateUser(user,false);
		
	}
	
	
    //newUserRegistration
	@POST
	@Path("/regNewUser")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String regNewUser1(@FormParam("email") String email,
			@FormParam("name") String name,
			@FormParam("password") String password) {
		
		String str="true";
		
		String resultfromMethod;
		int userId = userService.createNewUser(email,name,password,str);
		if(userId >= 0) {
			resultfromMethod = "active#" + userId;
		} else {
			resultfromMethod = "inactive#000";
		}
		 
		
		System.out.println("data Resource--"+resultfromMethod);
		
		return resultfromMethod;
		
	}
	
		
	@POST
	@Path("/regNewUserform/{formNum}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response regNewUserform(@PathParam("formNum") int form_id,User user) {
		
		//String resultfromMethod = userService.setUserData(email,name,password);
		
		System.out.println("data Resource--"+form_id);
		User user_reg_info = userService.setUser_reg_Info(form_id,user);
		
		
		return null;
		
	}	
	
	//pushdNotes This api for storing admin notes in DB
	@POST
	@Path("/pushdNotes")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int pushdNotes(@FormParam("data") String data,
			@FormParam("user_id") int user_id) {
		
		System.out.println("data  "+user_id);
		int userId = userService.setPushdNotes(data,user_id);
		
		
		return userId;
		
	}
	
	
	
	//update pushd notes when user check his new messages 
	@POST
	@Path("{userId}/updatepushdNotes")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void updatepushdNotes(@PathParam("userId") int userId) {
		
		System.out.println("data11  "+userId);
		userService.updatepushdNotes(userId);
		
		
		return;
		
	}
	
	
	
	
	
	//pushdNotes get Api
	@GET
    @Path("/{userId}/getPushdNotes")
	public ArrayList<PushdNotes> getPushdNotes(@PathParam("userId") int userId) {
		ArrayList<PushdNotes> pushdNotes = new ArrayList<PushdNotes>();
		
		 pushdNotes = userService.getPushdNotes(userId);
		System.out.println(pushdNotes);
		return pushdNotes;
	
}
	//userForgot Password
	@POST
	@Path("/forgotPwUpdate")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String forgotPwUpdate(@FormParam("email") String email,@FormParam("password") String password) {
		
		String resultfromMethod;
		int userId = userService.updatepassword(email,password);
		//int userId = 0;
		if(userId >= 0) {
			resultfromMethod = "active#" + userId;
		} else {
			resultfromMethod = "inactive#000";
		}
		 
		
		System.out.println("data Resource--"+resultfromMethod);
		
		return resultfromMethod;
		
	}
	
	//usertimeDuration based on registred time
	@GET
    @Path("/{userId}/getTimeDuration")
	@Produces(MediaType.TEXT_PLAIN)
	public int getTimeDuration(@PathParam("userId") int userId) {
		int daysCount=0;
		daysCount = userService.setUser_activeStatus(userId);
		System.out.println("daysCount  "+daysCount);
		return daysCount;
	
    }
	//usertimeDuration based on registred time
		@GET
	    @Path("/{userId}/getModeOfScreener")
		@Produces(MediaType.TEXT_PLAIN)
		public int getModeOfScreener(@PathParam("userId") int userId) {
			int getModeOfScreener=0;
			getModeOfScreener = userService.getModeOfScreener(userId);
			System.out.println("daysCount  "+getModeOfScreener);
			return getModeOfScreener;
		
	    }
	
	
	//screener 10th section and after two weeks
		@GET
	    @Path("/{userId}/getScreenStatus")
		@Produces(MediaType.TEXT_PLAIN)
		public int getScreenStatus(@PathParam("userId") int userId) {
         int daysCount=0;
         daysCount = userService.getScreenStatusService(userId);
			System.out.println("daysCount  "+daysCount);
			return daysCount;		
	}
	
	
		@POST
		@Path("/s/checkServerVersion")
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		@Produces(MediaType.TEXT_PLAIN)
		public String checkServerVerstion(@FormParam("server_version") int server_version) {
		//loging for old mobile app
		int server_version1=3;

		//if(server_version1 == server_version) {
		if( server_version == 3 || server_version == 2 ) {

		return "1#@@#version compatible";

		}else {

		return "2#@@#The version of the PUSHD app you are using is not compatible with the current version of the server. Please update your app to continue using it on the mobile. In the meantime, you can access the website echargementalhealth.ac.in anytime to continue with the app";

		}

		}
		
		//site visits and registration ref count
		@GET
	    @Path("/siteVisits/{usage_stats_id}/{ned_val}")
		@Produces(MediaType.TEXT_PLAIN)
		public void siteVisits(@PathParam("usage_stats_id") int usage_stats_id,@PathParam("ned_val") int ned_val){
			
			userService.getSitevisits(usage_stats_id,ned_val);
			System.out.println("siteVisits resource");

		}
		
		
		//sending next login Notification
		@GET
	    @Path("/nextLoginReminder")
		@Produces(MediaType.TEXT_PLAIN)
		public int nextLoginReminder() throws ParseException{
			
			int res = userService.nextLoginReminder();
			System.out.println("sending next login Notification");
			
			return res;

		}
		
		//sending next login Notification
				@GET
			    @Path("/usagestats")
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public UsageStats usage_stats() throws ParseException{
					
					UsageStats res = userService.usageStats();
					System.out.println("sending next login Notification");
					
					return res;

				}
		
				
				//to get user reg info
				@GET
			    @Path("/{userId}/getSelfRegUserInfo")
				//@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.TEXT_PLAIN)
				public UsageStats getSelfRegUserInfo(@PathParam("userId") int userId) {
		           UsageStats self_reg_details = userService.getSelfRegUserInfo(userId);
			       return self_reg_details;		
			      }
				
				//toGet All user registration info
				@GET
			    @Path("/getAllSelfRegUserInfo")
				//@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.TEXT_PLAIN)
				public List<UsageStats> getAllSelfRegUserInfo() {
		           List<UsageStats> self_reg_details = userService.getAllSelfRegUserInfo();
			       return self_reg_details;		
			      }
				
				//to Run Reminder 
				
				//toGet All user registration info
				@GET
			    @Path("/toSendReminderNotification")
				//@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.TEXT_PLAIN)
				public String toSendReminderNotification() throws JSONFileException, SQLException {
					
					reminderService.checkForReminders();
		           
			       return "its sent reminders";		
			      }
				
				
			   //to display pushd notes to user	
				@GET
				@Path("/{userId}/pushdStatus")
				@Produces(MediaType.TEXT_PLAIN)
				public int getPushdNotesStatus(@PathParam("userId") String userId) {
					
					int count_mesg=0;
					count_mesg=userService.pushdStatus(Integer.parseInt(userId));
					System.out.println("UR Method : getWorkbook , UserId=" + count_mesg);
					return count_mesg;
				}
				
				
				//to get workbook unlocked section tracking
				@GET
			    @Path("/{userId}/getUnlockSectonData")
				//@Produces(MediaType.APPLICATION_JSON)
				//@Consumes(MediaType.APPLICATION_JSON)
				public String getUnlockSectonData(@PathParam("userId") int userId) throws SQLException {
					
					ArrayList<Integer> sec_ides = userService.getUnlockSectonData(userId);
					System.out.println(sec_ides);
					
					return sec_ides.toString();
				
			}
		
				
				//for adding new doctors
				@POST
				@Path("/admin/addDoctor")
				@Produces(MediaType.TEXT_PLAIN)
					@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
					public int regNewDoctor(@FormParam("doctor_name") String doctor_name,
							@FormParam("username") String username, @FormParam("psw") String psw, @FormParam("email") String email, @FormParam("phone") String phone) {
						
						
						
						//String resultfromMethod;
						int userId = userService.createNewDoctor(doctor_name,username, psw, email,phone);
						System.out.println("CHECKING ADD DOCTOR FUNCTIONALITY"+userId);
						return userId;
						
					
						
						
					}
				
				//for doctor login
				@POST
				@Path("/doctor/login")
				@Produces(MediaType.TEXT_PLAIN)
					@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public int doctorLogin(@FormParam("name") String name, @FormParam("pwd") String password, @FormParam("app_type") String app_type) throws NoSuchAlgorithmException, InvalidKeySpecException, SQLException {
					//System.out.println("UR Method : login name=" + name);
					int doctor_id = userService.doctorLogin(name, password,app_type);
					System.out.println("checking data is the userUsource"+doctor_id);
					return doctor_id;
				}
		
}
