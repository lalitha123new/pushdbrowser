package in.ac.nimhans.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import in.ac.nimhans.service.UserSectionService;

@Path("reset")
@Produces(MediaType.APPLICATION_JSON)
public class ResetResource {
	
	UserSectionService service = new  UserSectionService();
	
	@GET
	@Path("/resetstatus")
	public String getreset(@QueryParam ("userId") String userId){
		
		//return service.resetSection(Integer.parseInt(userId));
		return service.resetSectionForUser(Integer.parseInt(userId));
		
	}

}
