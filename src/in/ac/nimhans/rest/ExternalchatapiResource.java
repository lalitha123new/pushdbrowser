package in.ac.nimhans.rest;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
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

import in.ac.nimhans.model.SectionData3;
import in.ac.nimhans.model.Stats;
import in.ac.nimhans.model.User;
import in.ac.nimhans.service.ExternalApiService;
import in.ac.nimhans.service.UserService;

@Path("external")
@Produces("application/json")
public class ExternalchatapiResource {
	
	
	ExternalApiService externalApiService = new ExternalApiService();
	UserService userService = new UserService();
	
   //1st Ap1 which can produce stats table data
	@GET
	@Path("/stats/{key}")
	@Produces("application/json")
	//@Consumes(MediaType.APPLICATION_JSON)
	public Response getUserStats(@PathParam("key") String key) {
		
		List <Stats> stats1 = new ArrayList<Stats>(); 
		
		System.out.println("coming to here--"+key);
		 stats1 = externalApiService.getUserStats(key);
		 System.out.println("coming to here11--"+stats1);
		
		 if (stats1.isEmpty()) {
				return Response.noContent().build();
			} else {
				return Response.ok().entity(new GenericEntity<List<Stats>>(stats1) {
				}).build();
			}	
	}
		
	 //2st Ap1 which can produce user_info table data
		@GET
		@Path("/userInfo/{key}")
		@Produces("application/json")
		//@Consumes(MediaType.APPLICATION_JSON)
		public Response getUserinfo(@PathParam("key") String key) {
			
			List <User> user_info = new ArrayList<User>(); 
			
			System.out.println("coming to here--"+key);
			user_info = externalApiService.getUserinfo(key);
			 System.out.println("coming to here12--"+user_info);
			
			 if (user_info.isEmpty()) {
					return Response.noContent().build();
				} else {
					return Response.ok().entity(new GenericEntity<List<User>>(user_info) {
					}).build();
				}	
		}
			
}
