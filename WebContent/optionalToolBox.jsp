<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
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
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
     <script src="js/inc.js"></script>
     
	<script type="text/javascript">
   	 	history.forward();
    	$(function(){
    		 $('#header').load("navHeader.html");
    		 $('#summary').load("summary.html");
     		 $('#next').load("nextButton3.html");
    		 $('#progress').load("progressBar.html");
	        
	    });
		
    </script>
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
					<img class="img-responsive" alt="" src="images/ss-tb.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div id="head" class="row">
					<div class=" " style="border:1px solid black;width:25%;" ><h6 style="text-align:center;font-weight:bold;">YOU ARE IN OPTIONAL ZONE</h6></div>
					<div class="hidden" id="section15"><h3><b>Dealing with Suicidal Thoughts</b></h3></div>
					<div class="hidden" id="section17"><h3><b>Maintaining Wellbeing: Part two</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<div class="clearfix"></div>
						<p id="exercise-title" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<div id="paragraph" class="text-justify">
						</div>
						
						
						<!-- below code for 2 posters in section 5 subsection 2 of optional part(15.2) -->
						<div class="hidden" id="img2">
						<div class="clearfix"></div>
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div id="images">
							<img class="img-responsive" alt="" src="images/s-thoughts-opt5.2-poster1.png">
							</div>
							<br>
							<br>
							
							
							<br>
							<p  class="text-justify"><b>How can you reduce the frequency of these thoughts?</b> </p>
							<br>
							<br>
							
						</div>
						
						
						
						<div class="clearfix"></div>
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div id="images">
							<img class="img-responsive" alt="" src="images/new-piktochart optional one suicidality-page-001.jpg">
							</div>
							<br>
							<br>
							
							<br>
							<br>
							<br>
							<div id="paragraph" class="text-justify">
							<strong>Make a plan for life. Start Taking care of yourself:  </strong><br><br>Be kind to yourself.  Realize that your mind and body are going through a distressing phase and you need to do those little things that can make your feel better. Eat a healthy diet, have a regular sleep schedule, stop using alcohol or substances which can make you feel worse and decrease your overall sense of control, find the time to get some exercise, regularize your routine and do things that may help you feel a bit better.<br><br>

                        <p style="border:2px black solid;padding-right:5px;padding-left:5px;background-color:#FFE0B2;">
							 <br><strong>My Safety Plan:</strong><br><strong>When I get suicidal thoughts I will take the following steps:</strong><br><br>

                        <strong>* Step 1: Remove anything harmful/dangerous </strong> from my surroundings or change the surroundings (e.g. keep only a small amount of medication, keep any sharp object away from sight. Go somewhere safe. )<br><br> 


  			<strong>* Step 2:</strong> Do the following activities to <strong>calm myself / distract myself.</strong> (e.g. go out for walk, listen to music. ( Please write here……..whatever helps you)<br><br> 

                        <strong>* Step 3:Remind myself about my reasons for living.</strong> Make a list of things which make/may make my life worthwhile(for e.g. relation with loved ones, pursuing my goals and important responsibilities, my beliefs about life)and which will stop me from taking an extreme and self-destructive step.<br><br>  

                        <strong> * Step 4: Call up friend/ family member .Keep a back-up number</strong> in case they are not available. Ask someone to stay with me till I feel better.<br><br> 


  			<strong>* Step 5:</strong>Call up a mental health professional/ counselor/ therapist<br><br>

                        <strong> * Step 6:</strong>If I feel the above measures are not helpful, <strong>call up a helpline or an ambulance/go to an emergency care mental health setting/clinic</strong>.<br><br>
</p>

                        You can also start <strong>Taking care of yourself</strong>, as mentioned earlier. <br><br><br>
                        <strong class="text-centre;"> <i>Here is a test to find out whether your mission in life is complete. If you're alive, it isn't. -Richard Bach</i></strong><br><br>
						</div>
							
						</div>
						</div>
						
						
						
					</div>
				</div>
			</div>		
			<br>
			<div class="clearfix"></div>
			<br>
			<br>
			
			<div id="head" class="row">
				<div class="col-md-9">
				</div>
				<div id="next" class="col-md-2">
				</div>
			</div>
			<div class="hidden" id="op5"><p style="text-align: right;">This section is authored by Dr. Anindita Bhattacharya, Sr. Lecturer, Azim Premji University, Bangalore.</p></div>
		</div>
	</div>
	<br>
	<br>
	
	
	
	</div>
	<br>
	<br>
	<br>
	
<!-- foll0woing modal code is not needed  -->
	<!-- --------Model ------------------------ -->
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
				<strong>How do you keep these thoughts in check?</strong><br><br> Given below are a few questions which you should ask and answer for yourself thoughtfully if you are getting suicidal thoughts. An example has been used to illustrate this process.<br><br>

                        <strong> Example:</strong><br><br>Ananya is a 19 year old undergraduate student studying in a prestigious college. She has been in a relationship with one of her classmates for past 1 year. She recently found out that her boyfriend was cheating on her and when she confronted him, she was humiliated in front of the whole class. She felt completely dejected after the incident and the thought of committing suicide crossed her mind.<br><br>

  			<strong>Self-check Questions:  </strong><br><br><ol><li><strong> What are the thoughts coming to my mind?</strong> (e.g. ‘He doesn’t love me anymore because I’m worthless’;‘I can never show my face to anybody after this incident.’)</li><br><li><strong> How frequently do I get these thoughts? </strong>(  e.g. 4-5 times in a day, especially when I’m alone)</li><br><li><strong> What are the triggers to these thoughts?</strong> ( e.g. ‘whenever I think about the incident, I feel ashamed and feel like ending my life’)</li><br><li><strong> Are there situations when I get these thoughts more often? </strong>( for e.g. staying alone, or looking at our old pictures) </li><br><li><strong> What helps me to lessen the frequency of these thoughts?</strong>(for e.g. ‘When I’m cooking or talking to my close friend’)  </li></ol><br><br>


                        These questions and their answers can give you more clarity and add to your sense of control by giving you some clues as to how to handle. <strong>Once you have completed jotting down your thoughts underlying the suicidal thoughts, the next step could be to examine them carefully. </strong><br><br>


  			<li><strong>  Is there a possibility that these thoughts are not true? :</strong> In times of distress our perception about ourselves and our environment gets highly colored by our emotions and does not necessarily reflect the reality of the situation. We have to ask ourselves if these are because of feelings or facts. One has to check if there is strong evidence to support the truth of these thoughts. In the above example, Ananya might remember that she is a talented sports person and quite popular among her peers. Re-examining her thoughts would show that most of her peers were actually supporting her and would not have made fun of her.</li><br><br>

                        <li> <Strong> Is there a need to believe totally everything that one thinks or feels? :</strong> Although it may seem that the situation is unbearable, it is important to realize that crisis states are usually temporary. Feelings change and solutions find their way. One has to give some time for the pain to subside before taking any impulsive decision. Ananya might soon realize in a few months’ time that she has other important things in life, there are other people who really care about her and that this was just a very bad phase in her life.</li> <br><br> 


  			<li><strong>  What would you say to somebody in your situation?:</strong> Thinking about caring for another person who is in a similar situation can help us get a newer perspective. If Ananya thinks about what helpful things she could say to someone else in this situation, she might be able to see a way to help herself.</li> <br><br>


                        <li><strong> Is there a possibility that things can change? Can you know for certain that your problem will never improve, or that you will never learn to cope with them better? </strong>Things change with time, and as someone rightly said suicide is a permanent solution to a temporary problem. Stress and depression can cloud one’s perception. With time, one’s perception about situations changes. The idea is to hang on long enough to see things change or help to change them or to see how our view of things change over time.</li> <br><br>
 <strong class="text-centre;"> <i>Here is a test to find out whether your mission in life is complete. If you're alive, it isn't. -Richard Bach</i></strong><br><br>


  			
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------- --> 
	
	<!-- foll0woing modal code is not needed  -->
	
	<!-- --------Model ------------------------ -->
	<div class="modal fade" id="showtext1" role="dialog">
		<div class="modal-dialog modal-lg" >
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success text-center">
					<h5>Elaboration</h5>
				</div>
				<p id="exercise-title" class="text-justify">
				</p>	
				<div id="paragraph" class="text-justify" style="padding: 20px 50px;">
				<strong>How can you reduce the frequency of these thoughts?</strong><br><br>

                        <li><strong>  Use of self- soothing techniques:</strong> Self-soothing techniques are activities (often with an outer focus) which one can do to cope with one’s intense negative feeling. These may include hobbies an individual is fond of (e.g. listening to music, watching a movie, or going for a walk). Here we are not talking about pursuing a hobby during leisure time- we are talking about using a soothing and non-harmful activity when you are highly distressed. Some may find things such as going over a set of cue-cards with positive statements, having a favorite snack or touching something soft and comforting to be self- soothing. Self-soothing can allow the distress to fade a bit, help us buy time, feel a bit calmer and that can help in thinking more clearly about handling our situation.</li> <br><br>


  			<li><strong> Distracting oneself:</strong> Doing activities to take one’s mind off from the suicidal thoughts may also help. For e.g. gardening, cooking, exercising, reading, learning something new or talking to friends. The idea is to use healthy methods of distraction to temporarily cope with suicidal thoughts rather than   give in to the urge to act on these thoughts.</li><br><br> 

                        <li><strong> Minimizing time spent alone:</strong> It has been commonly reported that suicidal thoughts are more frequent when an individual is all alone. Ananya has reported getting these thoughts more often when she is on her own. In such cases, spending time with loved ones, planning one’s daily schedule and engaging oneself in group activities may help.</li><br><br>


  			<li><strong> Managing triggers which may increase the frequency of thoughts:</strong> If one has been able to identify situations which increase the frequency of suicidal thoughts,  then it can provide   some hints about minimizing such distressing thoughts/keeping them at bay.</li><br><br>  All these things seem like temporary stop-gap arrangements. But we need them so that we have a chance to find better options and pathways!<br><br>

                        <strong>Can you do something more to help yourself?</strong><br><br>


  			<strong>Yes, of course you can, </strong>Even though at some moments we may not feel like asking for help or believe that no help will be helpful at all;we need to remember that there are people around (whom you may know or not know) who can really care and would want to support during your difficult times. There will be people who won’t judge you, argue or ask you to ‘snap out of it’. They will be willing to listen and support you.<br><br>

                        <strong> Try Talking to others: </strong>Reach out to people who are close to you. Take some time; promise yourself that you will give yourself time. Utilize that time to tell your loved ones about your problem. Call up someone you trust, it can be a close friend, your parents, siblings, partner. If it is difficult to find support from your immediate circle, reach out to someone in your wider network, meet a counselor who will be compassionate and understanding.<br><br><img width='200px;' src='images/ss-15-2.png'><br><br>
 


  			<strong>Fighting the hesitation to tell others:</strong> Even when you have decided to tell others about what you are going through; disclosing that you are getting suicidal thoughts can be difficult. Try to tell them your thoughts in the way you talk to yourself, so that they would understand better what is happening to you.  Do not leave it to them to mind-read you. Be clear and tell them you are getting suicidal thoughts instead of making vague statements like ‘I can’t deal with this anymore’. If you feel it will be too hard for you to tell this directly, try to write about it; send a message, write a mail and let them read it first before you discuss. It is quite  possible that sometimes you may feel misunderstood; on those times don’t let a bad experience deter you from reaching out again/  reaching out to others who may be able to understand you better. <br><br>  

                        <strong>Think about broadening your field of vision:</strong><br><br> Suicidal thoughts narrow our field of vision (like looking through a tunnel) and make it hard to see the broader/bigger picture. Although it may seem as though ending one’s life is the main/only option, it would be very useful to deliberately make a list of various options apart from suicide, which can help you cope with your problems. Do remember that on numerous occasions in the past, you were able to cope.  A good way to start thinking about this is to make a list of all the problems you have in your life at present and then think about all the possible options to handle at least some of these.  You can ask someone trusted to help you with this. Once you have thought of addressing a few of the smaller problems and have started thinking more clearly, you will find yourself in a better position to tackle the bigger problems in life.<br><br>Depression can influence our perception in a way that everything seems bleak. It is like when you wear dark goggles, all that you see around you seems dark; but when you remove the goggles, you see a different picture altogether.<br><br>So, seek professional help for depression which can help change the way you see your life as well as nourish your internal strengths and resources to deal with the challenges. <br><br>

<strong>Make a Safety Plan:</strong> Write down a series of steps you will follow in case of a suicidal crisis. A safety plan should help you delay your urge to act on your suicidal thoughts. Write down the phone numbers of people you can contact immediately, which can include numbers of your family, friends and a therapist/ counselor.<strong>Please see an example of a safety plan on the next page.</strong><br><br>

<strong>Make a plan for life. Start Taking care of yourself:  </strong><br><br>Be kind to yourself.  Realize that your mind and body are going through a distressing phase and you need to do those little things which you can -to make yourself feel better. Eat a healthy diet, have a regular sleep schedule, stop using alcohol or substances which can make you feel worse and decrease your overall sense of control, find the time to get some exercise, regularize your routine and do things which may help you feel a bit better.<br><br>

                        <p style="border:2px black solid;">

                        <br><strong>My Safety Plan:</strong><br><strong>When I get suicidal thoughts I will take the following steps:</strong><br><br>

                        <strong>* Step 1: Remove anything harmful/dangerous </strong> from my surroundings or change the surroundings (e.g. keep only a small amount of medication, keep any sharp object away from sight. Go somewhere safe. )<br><br> 


  			<strong>* Step 2:</strong> Do the following activities to <strong>calm myself / distract myself.</strong> (e.g. go out for walk, listen to music. ( Please write here……..whatever helps you)<br><br> 

                        <strong>* Step 3:Remind myself about my reasons for living.</strong> Make a list of things which make/may make my life worthwhile(for e.g. relation with loved ones, pursuing my goals and important responsibilities, my beliefs about life)and which will stop me from taking an extreme and self-destructive step.<br><br>  

                        <strong> * Step 4: Call up friend/ family member .Keep a back-up number</strong> in case they are not available. Ask someone to stay with me till I feel better.<br><br> 


  			<strong>* Step 5:</strong>Call up a mental health professional/ counselor/ therapist<br><br>

                        <strong> * Step 6:</strong>If I feel the above measures are not of help, <strong>call up a helpline or an ambulance/go to an emergency care mental health setting/clinic</strong>.<br><br>
</p>

                        You can also start <strong>Taking care of yourself: </strong> Be kind to yourself.  Realize that your mind and body are going through a distressing phase and do things to make yourself feel better. Eat a healthy diet, get a good sleep, stop using alcohol or substances which can make you feel worse and decrease your sense overall sense of control,  get some exercise every day, do things which you enjoy.<br><br> 

                       

                        <strong>Think about things which can make your life meaningful. </strong><br><br> - Write down positive things about you and your life (for e.g. having loving parents, a pet who adores you, things you are proud of, and your achievements)<br><br>

                        -Write down about your plans for the future: dreams you want to achieve, goals you want to pursue (for. e.g. learning guitar, travelling, visiting a particular place, volunteering, the experiences you want to have). You can take help from a person you trust to make this list.<br><br> 

                        -Keep a journal where you can write down about your feelings, expectations, joys and sorrows. Writing about your thoughts can help you gain clarity about the situations and allow you to express your emotions rather than bottling them up.<br><br>



  			<strong><u>Seeking Professional help:</u></strong> A mental health professional can help you in dealing with you suicidal thoughts and finding ways to cope with your feelings better. If these feelings are a part of other severe mental health conditions (e.g. severe depression), he/she can help you get the right treatment. <br><br> 

                        <strong>Bottom line:</strong><br><br> Suicidal thoughts and death wishes are a signal that something is going wrong in our lives. These indicate a need to look at what is going wrong and to actively seek help to sort things out. Having these thoughts does not make us weaker than others. It may help to ask yourself: ‘What can I do right now to change slightly the way I am thinking and feeling?<br><br>

                       

                        <strong class="text-centre;"> <i>Here is a test to find out whether your mission in life is complete. If you're alive, it isn't. -Richard Bach</i></strong><br><br>

				
				
				
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
			
					  	activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
						if(activeSectionId==15 && activeSubSectionId==2 )
						{
						$("#op5").removeClass("hidden");
						$("#img2").removeClass("hidden");
						$("#section15").removeClass("hidden");
						}else if(activeSectionId==17 && activeSubSectionId==4)
						{
						$("#section17").removeClass("hidden");
						}
						
						
		
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/toolbox",
			
							  success: function(data1){
									
									$("#subsection-name").html((activeSectionId-10)+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									$("#exercise-title").html(data1['exerciseTitle']);
								  	myFunction(data1['lists']);
								  	if(activeSectionId==15 && activeSubSectionId==2)
								  		{
								  		myFunction1(data1['lists']);
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
	    	    var out = '<ol>';
	    	   
	    	    for(i = 0; i < arr.length; i++) {
	    	    	
	    	    	out += '<li>' + arr[i] + '</li>';
				}
   				out += '</ol>';
   				
	    	    $('#paragraph').html(out);
    	   	}
	   	});
		function myFunction1(arr) {
    	    var out = '';
    	   
    	    for(i = 0; i < arr.length; i++) {
    	    	
    	    	out +=  arr[i] ;
			}
				
				
    	    $('#paragraph').html(out);
	   	}
		
		
	</script>
	
</body>
</html>