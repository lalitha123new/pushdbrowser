package in.ac.nimhans.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;

import in.ac.nimhans.model.CheckPoint;
import in.ac.nimhans.model.DiscoveryPoint;
import in.ac.nimhans.model.KnowledgePoint;
import in.ac.nimhans.model.PracticePoint;
import in.ac.nimhans.model.Section;
import in.ac.nimhans.model.SubSection;
import in.ac.nimhans.model.ToolBox;
import in.ac.nimhans.model.Video;
import in.ac.nimhans.service.SectionService;
import in.ac.nimhans.service.SubSectionService;

@Path("sections")
@Produces(MediaType.APPLICATION_JSON)
public class SectionResource {

	SectionService sectionService = new SectionService(); 
	
	@GET
	@Path("/{sectionId}")
	public Section getSection(@PathParam("sectionId") String sectionId, @Context UriInfo uriInfo) {
		System.out.println("SR Method : getSection"+sectionId);
		if(sectionId.equals("0")) {
			return sectionService.getInitialSection();
		}
		Section section = sectionService.getSection(sectionId);
		String uri = uriInfo.getBaseUriBuilder()
			.path(SectionResource.class)
			.path(sectionId)
			.path("subsections")
			.path(Long.toString(1))
			.build()
			.toString();
		section.addLink(uri, "nextSubSection");
		return section;
	}
	
	@GET
	@Path("/{sectionId}/subsections")
	public List<SubSection> getSubSectionResource(@PathParam("sectionId") String sectionId) {
		//System.out.println("\t\tSSR Method : getAllSubSections , SectionId=" + sectionId);
		return new SubSectionService().getAllSubSections(sectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/discovery")
	public DiscoveryPoint getDPContent( @PathParam("sectionId") String sectionId,
			 							@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSSR Method : getDPContent , SectionId=" + sectionId + "SubsectionId=" + subSectionId);
		return new SubSectionService().getDiscoveryPoint(sectionId, subSectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/discovery2")
	public DiscoveryPoint getDPContent2( @PathParam("sectionId") String sectionId,
			 							@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSSR Method : getDPContent2 , SectionId=" + sectionId + "SubsectionId=" + subSectionId);
		return new SubSectionService().getDiscoveryPoint2(sectionId, subSectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/practice1")
	public PracticePoint getPPContent( @PathParam("sectionId") String sectionId,
			 							@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSSR Method : getPPContent , SectionId=" + sectionId + "SubsectionId=" + subSectionId);
		return new SubSectionService().getPracticePoint(sectionId, subSectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/practice2")
	public PracticePoint getPPContent2( @PathParam("sectionId") String sectionId,
			 								@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSSR Method : getPPContent2 , SectionId=" + sectionId + "SubsectionId=" + subSectionId);
		return new SubSectionService().getPracticePoint2(sectionId, subSectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/practice3")
	public List<PracticePoint> getPPContent3( @PathParam("sectionId") String sectionId,
			 								@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSSR Method : getPPContent3 , SectionId=" + sectionId + "SubsectionId=" + subSectionId);
		return new SubSectionService().getPracticePoint3(sectionId, subSectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/practice9")
	public PracticePoint getPPContent9( @PathParam("sectionId") String sectionId,
			 								@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSSR Method : getPPContent9 , SectionId=" + sectionId + "SubsectionId=" + subSectionId);
		return new SubSectionService().getPracticePoint9(sectionId, subSectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/knowledge")
	public KnowledgePoint getKPContent( @PathParam("sectionId") String sectionId,
			 							@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSSR Method : getKPContent , SectionId=" + sectionId + "SubsectionId=" + subSectionId);
		return new SubSectionService().getKnowledgePoint(sectionId, subSectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/knowledgeWorkbook")
	public KnowledgePoint getKPWorkbookContent( @PathParam("sectionId") String sectionId,
			 							@PathParam("subSectionId") String subSectionId) {
		System.out.println("\t\tSSR Method : getKPContent , SectionId=" + sectionId + "SubsectionId=" + subSectionId);
		return new SubSectionService().getKnowledgePointWorkbook(sectionId, subSectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/check3")
	public CheckPoint getCPContent3( @PathParam("sectionId") String sectionId,
		 							@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSSR Method : getCPContent , SectionId=" + sectionId + "SubsectionId=" + subSectionId);
		return new SubSectionService().getCheckPoint(sectionId, subSectionId);
	}
	
	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/toolbox")
	public ToolBox getToolBox(	@PathParam("sectionId") String sectionId,
								@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSR Method : getToolBox");
		return new SubSectionService().getToolBox(sectionId, subSectionId);
	}

	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/toolbox2")
	public ToolBox getToolBox2(	@PathParam("sectionId") String sectionId,
								@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSR Method : getToolBox");
		return new SubSectionService().getToolBox2(sectionId, subSectionId);
	}

	@GET
	@Path("/{sectionId}/subsections/{subSectionId}/video")
	public Video getVideo(	@PathParam("sectionId") String sectionId,
								@PathParam("subSectionId") String subSectionId) {
		//System.out.println("\t\tSR Method : getVideo");
		return new SubSectionService().getVideo(sectionId, subSectionId);
	}

	
	@GET
	public List<Section> getAllSections() {
		//System.out.println("SR Method : getAllSections");
		return sectionService.getAllSections();
	}
	
	@GET
	@Path("/optional")
	public List<Section> getAllOptionalSections() {
		//System.out.println("Optional Method : getAllOptionalSections");
		return sectionService.getAllOptionalSections();
	}
}
