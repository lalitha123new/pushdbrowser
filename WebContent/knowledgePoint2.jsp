

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<title>Sub-Section</title>
<%

	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader ("Expires", 0);
	
	if(session.getAttribute("USERID")==null){
		response.sendRedirect(request.getContextPath() + "/sessionExpired.jsp");
	}
	
%>

	<!-- Bootstrap -->
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
    <script src="js/inc.js"></script>
	<script src="js/values.js"></script>
    <script type="text/javascript">
    
	    
		history.forward();

    	$(function(){
    		$('#header').load("navHeader.html");
    		$('#summary').load("summary.html");
    		$('#next').load("nextButton.html");
    		$('#progress').load("progressBar.html");
	        $("#includedContent").load("sectionSideNav2.html"); 
	      
	    });
    	
		
    </script>
    <style type="text/css">
    .row
    {
    margin-left:0px;
    margin-right:0px;
    
    }
    </style>


</head>
<body class="bgcolor" oncontextmenu="return false">

	<div id="header">
	</div>	
	
	<div id="summary">
	</div>	
	
	<div class="container-fluid" style="height: 100%">
	<div class="row">
		<div class="col-md-1">
			<ul class="nav nav-pills nav-stacked text-center" id="includedContent">
			</ul>
		</div>
		<div class="col-md-11">
			<div class="">
				<div id="progress">
				</div>
				<div class="col-md-2 col-sm-4">
					<img class="img-responsive" alt="" src="images/ss-kp.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
					<div class="hidden" id="section4"><h3><b>Dealing with depressive thoughts</b></h3></div>
					<div class="hidden" id="section5"><h3><b>Manage excessive worries</b></h3></div>
					<div class="hidden" id="section6"><h3><b>Learn Self-Compassion</b></h3></div>
					<div class="hidden" id="section7"><h3><b>Strengthen Self-Soothing skills</b></h3></div>
					<div class="hidden" id="section8"><h3><b>Regaining a sense of mastery</b></h3></div>
					<div class="hidden" id="section9"><h3><b>Harness the power of support</b></h3></div>
					<div class="hidden" id="section10"><h3><b>Step Up: When you need to</b></h3></div>
					
						<h3><b id="subsection-name"></b></h3>
						<div class="clearfix"></div>
						<p id="exercise-title" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<div id="paragraph" class="text-justify">
						</div>
						
						<!-- below div is for poster for section 4 subsection 2 only -->
						<div class="hidden" id="newposter">
						<div class="clearfix"></div>
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div id="images">
							<img class="img-responsive" alt="" src="images/s-thoughts-opt5.2-poster1.png">
							</div>
							<br>
							<br>
							<div class="pull-right">
								<a href="#" class="btn btn-info" data-toggle="modal"
									data-target="#showtext">Want Elaboration...?</a>
							</div>
							<br>
							<br>
							<br>
							
						</div>
						</div>
						<div class="hidden" id = "com"><p> We are introducing self-compassion because it has been related to well-being. High self-criticality is often linked to depression and other common mental health problems.<br>
				You may find this notion of self-compassion to be vague/funny/rather strange. So we will try to clear your doubts.<br>
				What are the questions that come to your mind when you think about self-compassion?<br><br>
				Click on the questions/doubts to find our response.<br></p>
						
						<ul id="accordion" class="nav nav-pills nav-stacked">
	<li id="section">
		<a id="col" role="button" data-toggle="collapse" data-parent="#accordion" 
			href="#collapse1" aria-expanded="false" aria-controls="collapse1">&emsp;<strong>What is self-compassion?</strong> &emsp;<span class="caret"></span></a>
		<div id="collapse1" class="collapse out" role="tabpanel" aria-labelledby="headingOne">
			<p style="border:1px solid black;padding:5px;background-color:#FFE0B2;">Compassion means being aware of/acknowledging suffering, experiencing feelings of kindness/care, and understanding that imperfections and fragility are universal aspects of being human that all of us share in common. Self-compassion is nothing but compassion toward one's own self.
			</p>
	<li id="section">
		<a id="col" role="button" data-toggle="collapse" data-parent="#accordion" 
			href="#collapse6" aria-expanded="false" aria-controls="collapse6">&emsp;<strong>I think what I need is to do things to maintain high self-esteem.</strong> &emsp;<span class="caret"></span></a>
		<div id="collapse6" class="collapse out" role="tabpanel" aria-labelledby="headingOne">
			<p style="text-align:justify;border:1px solid black;padding:5px;background-color:#FFE0B2;">Self-esteem is about a positive evaluation of oneself.<br>
Very often, people understand and base their self- esteem on certain conditions such as being better than others in some respect, achieving things in life etc.<br>
				Such things become the conditions for valuing ourselves positively and then our self-esteem keeps fluctuating based on whether we are able to meet these standards. This approach is not a healthy way of functioning.<br>
				Conditional self-esteem (when we set conditions to feel Ok /good about ourselves) can enhance risk of depression in the face of failures/losses and result in undue anxiety and stress while trying to meet certain standards 'before we value ourselves'. It can also result in various undesirable methods people might use to preserve their self-esteem (e.g. putting others down, avoiding to think about what is going wrong). <br>
				Self-compassion is also about positive regard for oneself but it is not a conditional state.
			</p>
	 <li id="section">
		<a id="col" role="button" data-toggle="collapse" data-parent="#accordion" 
			href="#collapse7" aria-expanded="false" aria-controls="collapse7">&emsp;<strong>Self-compassion seems like self-pity. I would not want that.</strong>  &emsp;<span class="caret"></span></a>
		<div id="collapse7" class="collapse out" role="tabpanel" aria-labelledby="headingOne">
			<p style="text-align:justify;border:1px solid black;padding:5px;background-color:#FFE0B2;">True self-compassion is very different from self-pity.<br>
				In self-pity, one focuses on oneself and may brood /ruminate over and again about the negative aspects of a situation.<br>
				Self-compassion on the other hand is about just being aware (mindful) of the situation/feelings, rather than constantly dwelling/drowning in these.<br>
				Moreover self-compassion draws upon the belief that suffering is universal aspect of living life for everyone so one is not special as compared to others.<br>
				This is unlike self-pity which tends to evoke a sense of 'me' suffering in isolation from others.
			</p>
	<li id="section">
		<a id="col" role="button" data-toggle="collapse" data-parent="#accordion" 
			href="#collapse2" aria-expanded="false" aria-controls="collapse2">&emsp;<strong>What is self-criticism?</strong>  &emsp;<span class="caret"></span></a>
		<div id="collapse2" class="collapse out" role="tabpanel" aria-labelledby="headingOne">
			<p style="text-align:justify;border:1px solid black;padding:5px;background-color:#FFE0B2;">Self-criticism refers to internal thoughts/views about oneself, one's behaviors in a negative fashion, like fault- finding. It can be in the form of negative, comparisons of one's own self with others or internal - in terms of  feeling that one has not lived up to one's own  internal  goals/standards.
			</p>
	<li id="section">
		<a id="col" role="button" data-toggle="collapse" data-parent="#accordion" 
			href="#collapse3" aria-expanded="false" aria-controls="collapse3">&emsp;<strong>I think being self-critical is good. It can motivate us.</strong> &emsp;<span class="caret"></span></a>
		<div id="collapse3" class="collapse out" role="tabpanel" aria-labelledby="headingOne">
			<p style="text-align:justify;border:1px solid black;padding:5px;background-color:#FFE0B2;">Of course, it is important that we recognize our mistakes/errors/failures and learn from them or correct our patterns of thinking/action.<br>
				However, this is not same as being self-critical.<br>
				High levels of self-criticality (comparing unfairly with others or with our own harsh and unrealistic internal standards) has been linked to various kinds of mental health problems. This is because high and relentless self-criticality results in excessive brooding and worsening of moods which in turn affect our functioning. <br>
				Although some level of anxiety and tension can motivate us to do better, over- generalized/global judgments of ourselves as persons (e.g. when I forgot to address someone appropriately during a meeting, telling myself that I am such a 'stupid person' who can 'never succeed'..) can worsen our mood to an extent that we can end up doing self-destructive things to feel better (e.g. using alcohol to cope with the resultant low mood) or avoid preparing for another upcoming meeting due to heightened sense of pressure.<br>
				On the other hand, being self-compassionate can help us to acknowledge (rather than deny/avoid) what went wrong without unfavorably judging ourselves as 'bad /wrong persons' and thus free us to work towards improving what we want to improve.
			</p>
	<li id="section">
		<a id="col" role="button" data-toggle="collapse" data-parent="#accordion" 
			href="#collapse8" aria-expanded="false" aria-controls="collapse8">&emsp;<strong>How is self-criticism related to being criticized by others?</strong> &emsp;<span class="caret"></span></a>
		<div id="collapse8" class="collapse out" role="tabpanel" aria-labelledby="headingOne">
			<p style="text-align:justify;border:1px solid black;padding:5px;background-color:#FFE0B2;">There are times when another person's comments become upsetting because they reflect what you have already been telling yourself- in the form of an internal dialogue. <br>
				Thus, others' comments/behaviors may trigger negative, self-critical or self-blaming thoughts leading to sadness.
			</p>
	 <li ><a id="nolink" target="_blank"><p>&emsp;<strong>Please look up Reference section when you are exploring optional zone about the utility of self-compassion for mental health.</strong></p></a></li>
	<li id="section">
		<a id="col" role="button" data-toggle="collapse" data-parent="#accordion" 
			href="#collapse5" aria-expanded="false" aria-controls="collapse5">&emsp;<strong>What can I do to become less self-critical and more self-compassionate?</strong> &emsp;<span class="caret"></span></a>
		<div id="collapse5" class="collapse out" role="tabpanel" aria-labelledby="headingOne">
			<p style="text-align:justify;border:1px solid black;padding:5px;background-color:#FFE0B2;">Some people find it useful to look back at their past experiences to figure out why and how they learnt to become so self-critical of themselves. This may help in understanding to some extent why we carry such a harsh and critical voice within us.<br>
				But such insights are not automatically sufficient to change this pattern. What is helpful is practicing the new approach repeatedly and consciously till it becomes a new habit.
			</p>
			
  
			
   
			
		</div>
	</li></ul></div>
					   
						</div>
						<div class="clearfix"></div>
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div id="images">
							</div>
							
						</div>
						<div class="col-md-1"></div>
						
						<table id="table" class="table text-center table-hover table-bordered">
							<thead id="thead">
							</thead>
							<tbody id="tbody">
							</tbody>
						</table>
					</div>
				</div>
					
			</div>		
		 	<br>
			<br>
			<br>
			<div class="clearfix"></div>
			<br>
			
			<div class="row">
				<div class="col-md-9">
				</div>
				<div id="next" class="col-md-2">
				</div>
			</div>
			<div class="clearfix"></div>
			<br>
			<br>
			<br>
			
		</div>
		
	</div>
	</div>
	
	
	<div class="clearfix"></div>
	<br>
	<br>
	<br>
	
	<!-- --------Model for poster-modal for section 4, subsection 2 only------------------------ -->
	<div class="modal fade" id="showtext" role="dialog">
		<div class="modal-dialog modal-lg" >
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success text-center">
					<h5>Elaboration</h5>
				</div>
				<p id="exercise-title" class="text-justify">
				</p>	
				<div id="paragraph" class="text-justify" style="padding: 20px 50px;">
				
				
				
				
				<strong>Cognitive distortions are systematic errors</strong> in thinking or biases when interpreting situations, events and/or experiences.
				As a result of these \"thinking errors\" we make conclusions, or respond through our behaviors and emotions in unhelpful ways. As the name suggests they are biases, errors or distortions and therefore not an accurate interpretation of the event or situation.
				"Based on information gathered from people experiencing anxiety and depression, clinicians and researchers have identified common cognitive distortions that people make while responding to situations and events.<br>
				<br><img width='200px;' src='images/ss-4-2.png'><br><br>
				<strong>LEARNING ABOUT DIFFERENT TYPES OF ERRORS IN THINKING (COGNITIVE DISTORTIONS)</strong><br><br>
				<strong><font style='color: blue'>1. All or none thinking: </font></strong><br><br>
				All or none thinking is the tendency to evaluate situations, events, experiences in extreme categories.  It is also known as black or white thinking, polarized thinking, absolutistic thinking or perfectionistic thinking.
				<br><br>A person using this distortion sees things in either extreme points (such as good or bad). Thus one may see oneself as a complete failure even when there is a small error or lapse. Excessive fear of making mistakes or being imperfect, avoiding making decisions and excessive self-criticality are some of the consequences of all or none thinking.
				Example: A student who believed that one is a successful student only when one gets 99% secured 95% and became very dejected viewing himself as a total failure. This way of evaluating things is unrealistic because situations and events are rarely either one way or the other or 'in black or white'.<br>
				<br><strong><font style='color: blue'>2. Over-generalization:</font></strong><br><br>
				A person is said to be using the error of overgeneralization when he/she bases the outcomes of all future events (e.g. exams, interviews, relationships) on a single negative event.",
				Example: A person who does poorly at a job interview concludes, \" I will never get a job, there is no point in attending any more interviews\", resulting in his not going for any further interviews.<br>
				<br><strong><font style='color: blue'>3. Selective Abstraction</font></strong><br><br>
				It is a tendency to selectively pick out a negative detail from a situation, while filtering out the positive aspects and conclude that the whole situation is negative.",
				Example: A worker was given feedback that she is very punctual and efficient at the tasks she is assigned, but that she could work a little more on her communication.  The worker concludes, \"This means I am a bad worker; I can't do my job well!\"<br>
				<br><strong><font style='color: blue'>4. Disqualifying the positive:</font></strong><br><br>
				It is a persistent tendency to transform or convert neutral or even positive experiences into negative ones, much like a \"reverse alchemy\" in which gold is turned into dirt! 
				Example: When someone sincerely appreciates the quality of work done but the person tells himself that \"they are just being nice\". Here the person is disqualifying the positive compliment received. <br>
				<br><strong><font style='color: blue'>5. Jumping to conclusion: </font></strong><br><br>
				It is the tendency to conclude or make decisions based on evidence that is not related to the event or with insufficient evidence.
				It can occur in two ways:
				<ol style='list-style-type: lower-alpha;'><li><strong>Mind reading:</strong> This occurs when the person jumps to the conclusion (without sufficient evidence or information) that others are negatively evaluating him/her. Here the person is making an assumption about the other person's thoughts/mental state (intentions).<br>Example:  A teacher fails to smile and return the greeting of a student while passing through a corridor. The student concludes that \"I must have done something to upset my teacher, he/she is angry with me\". This conclusion does not consider other possibilities or reasons such as \"the teacher was engrossed in a conversation with others and did not notice the greeting.\"</li><li><strong>Fortune telling:</strong> The fortune teller, also known as crystal ball gazing, involves making negative predictions based on little or unrelated evidence. This prediction is treated as an established fact resulting in negative emotions.<br>Example : A manager who had to present a new plan to his team members tells himself, \"it's all going to go bad, I am certain that it will be a poor show\".  This was a manager who was doing well and did not have any specific reason to make this prediction.</li></ol>
				<br><strong><font style='color: blue'>6. Magnification or Minimization:</font></strong><br><br>
				When using this style, the person exaggerates or magnifies the importance of certain outcomes or events or facts (one's own mistakes), while minimizing others things (e.g.positive contributions). Usually it is about magnifying one's own fault, while minimizing positive qualities.
				A person when asked as to how was his week says feeling unhappy \"the whole week was a waste, it was so miserable\" and minimizes the events that went well or things that were accomplished.<br>
				<br><strong><font style='color: blue'>7. Emotional reasoning:</font></strong><br><br>
				This involves an erroneous assumption that your negative emotions necessarily reflect the way things really are: \"I feel this way; therefore, it must be true\" or \"I feel guilty. Therefore,it means that I must have done something bad\".  Thus a homemaker who feels sad says to herself,   \"I feel overwhelmed and hopeless.  It means my problems must be impossible to solve\".<br>
				<br><strong><font style='color: blue'>8. Should Statements:</font></strong><br><br>
				Using imperative rules and statements involving 'should','should not' and 'must', often leads to an experience of guilt (when the person believes he/she has not been able to follow the rule) or frustration and anger when we impose such conditions/rules  on others who are expected to always follow the same without fail. 
				Example:  \"I must do that\" \"You must follow what I say at all costs and at all times\" \"I must always be on time\".\"Everybody must love me and reciprocate my affection for them\".<br>
				<br><strong><font style='color: blue'>9. Labeling:</font></strong><br><br>
				Labeling is a kind of  thinking  error in which a single perceived characteristic of a person is thought to describe his/her whole qualities or attributes. Labels are usually emotion laden, negative and are often about attributes of a person or self (such as I am an idiot, I am useless, loser; she is a loser).  Labeling can result in feelings of inadequacy.
				Examples: Having failed to do a job on time for a parent, a lady tells herself: I am useless and irresponsible\"; having missed a target at work the employee concludes \"I am such an idiot- I bungled up such a simple thing\".<br>
				<br><strong><font style='color: blue'>10. Personalization: </font></strong><br><br>
				You may be committing this error when you see yourself almost entirely (blaming) as the cause of some negative event although in reality you were not primarily responsible for it.
				Example : A mother saw her child's report card with a note from the teacher which said that the child was not doing well in studies. She immediately concluded, \"I am a bad mother. It is entirely my fault that my daughter has done poorly.\"
			
			
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------- -->
	<script type="text/javascript">
		
		var i=0;
		
		$(document).ready(function() {
		
			$.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/currSubSection",
				  success: function(data){
			
					  sectionId = data['currentSection'];
						subsectionId = data['currentSubSection'];

						activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
			
						
						if((sectionId==5 && subsectionId==1) || (activeSectionId==5 && activeSubSectionId==1) || (sectionId==5 && subsectionId==5) || (activeSectionId==5 && activeSubSectionId==5))
						{
							$('#section5').removeClass("hidden");
						}
						else if((sectionId==6 && subsectionId==5) || (activeSectionId==6 && activeSubSectionId==5) || (sectionId==6 && subsectionId==7) || (activeSectionId==6 && activeSubSectionId==7))
						{
							$('#section6').removeClass("hidden");
						}
						else if((sectionId==7 && subsectionId==1) || (activeSectionId==7 && activeSubSectionId==1) || (sectionId==7 && subsectionId==2) || (activeSectionId==7 && activeSubSectionId==2))
						{
							$('#section7').removeClass("hidden");
						}
						else if((sectionId==8 && subsectionId==1) || (activeSectionId==8 && activeSubSectionId==1) || (sectionId==8 && subsectionId==2) || (activeSectionId==8 && activeSubSectionId==2))
						{
							$('#section8').removeClass("hidden");
						}
						else if((sectionId==9 && subsectionId==1) || (activeSectionId==9 && activeSubSectionId==1))
						{
							$('#section9').removeClass("hidden");
						}
						else if((sectionId==10 && subsectionId==1) || (activeSectionId==10 && activeSubSectionId==1))
						{
							$('#section10').removeClass("hidden");
						}
						
							
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/knowledge",
							  success: function(data1){
					
								  	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
								  	if((sectionId==6 && subsectionId==2) || (activeSectionId==6 && activeSubSectionId==2))
						    	    {
								  		$('#com').removeClass("hidden");
								  		var str=$('#link ').html();
								  		
								  		
								  		$("#link").attr('href', 'references1.html');
								  		$('#section6').removeClass("hidden");
						    	    }
								  	else{
									myFunction(data1['paragraphs']);
								  	myFun(data1['table']);		//	set table heads
								  	myFunc(data1['table']);	  	// 	set table body
								  	myFunct(data1['images']);
								  	}
								  	
								  // below if statement for section 4 subsection 2 only
								  
									if((sectionId==4 && subsectionId==2) || (activeSectionId==4 && activeSubSectionId==2))
									{
								  		$('#newposter').removeClass("hidden");
								  		var str=$('#link ').html();
								  		
								  		
								  		$("#link").attr('href', 'references1.html');
								  		$('#section4').removeClass("hidden");
						    	    }
					          },
							  error: function() {
								  alert("Error: server encountered an internal error. Please try again after some time ");
								  
							  } 
						});	
					
				  },
				  error: function() {
					  alert("Error: server encountered an internal error. Please try again after some time ");
					
				  } 
			});
		
			function myFunction(arr) {
	    	  
	    	   var out = '';
	    	    if((sectionId==6 && subsectionId==2) || (activeSectionId==6 && activeSubSectionId==2))
	    	    {	
	    	    	for(i = 0; i < arr.length; i++) {
	    	    		
		    	    	if(i>4 && i%2!=0)
		    	    	out += '<div>'+'<p>' + arr[i] + '</p>' + '</div>';
		    	    	else
		    	    	out += '<h3>' + arr[i] + '</h3>';
					}	
		    	    out +='</div>';
		    	    $('#paragraph').html(out);
	    	    }
	    	    else
	    	    	{
	    	    for(i = 0; i < arr.length; i++) {
	    	    	
	    	    	out += '<p>' + arr[i] + '</p>';
				}	
	    	    $('#paragraph').html(out);
	    	    	}
	    	    
		   	}
			function myFunction1(arr) {
	    	    var out = '<div id="accordion">';
	    	   	
	    	    for(i = 0; i < arr.length; i++) {
	    	    	if(i>4 && i%2!=0)
	    	    	out += '<div>'+'<p>' + arr[i] + '</p>' + '</div>';
	    	    	else
	    	    	out += '<h3>' + arr[i] + '</h3>';
				}	
	    	    out +='</div>';
	    	    $('#paragraph').html(out);
		   	}
			
			function myFun(arr) {
			
				var out = '';
		    	arr = arr['thead'];
	    	    for(i = 0; i < arr.length; i++) {
	    	    	out += '<td><strong>' + arr[i] + '</strong></td>';
				}	
	    	    $('#thead').html(out);
	    	    
			}
			
			function myFunc(arr) {
				
	    	    var out = '';
		    	arr = arr['tbody'];
	    	    for(i = 0; i < arr.length; i++) {
		    		var tr = arr[i].item;
		    	    out += '<tr>';
		    		for(j = 0; j < tr.length; j++) {
			    		out += '<td>' + tr[j] + '</td>';
		    		}
					out += "</tr>"
	    		}	
	    	    $('#tbody').html(out);
			}
			
			function myFunct(arr) {
				var out = '';
	    	    for(i = 0; i < arr.length; i++) {
		    		
	    	    	out += '<img class="img-responsive" width="768px;" src="' + arr[i] + '"><br>';
		    		
	    		}	
	    	    $('#images').html(out);
			}
	   	});
		
		
	
	</script>
</body>
</html>