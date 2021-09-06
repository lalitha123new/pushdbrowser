<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> -->
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Sub-Section</title>
	
	
	<link rel="stylesheet" type="text/css" media="screen" href="form_js/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" media="all" href="include/form/fonts71523.css?1701" />
	<link rel="stylesheet" type="text/css" media="all" href="include/form/screen71523_new.css?1701" />
	<link rel="stylesheet" type="text/css" media="print" href="include/form/print71523.css?1701" />
	<link rel="stylesheet" type="text/css" media="screen" href="include/form/responsive71523.css?1701" />
	<link rel="stylesheet" href="js/externalFiles/font-awesome.min.css">
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
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
			 $('#next').load("nextButton.html");
    		 $('#progress').load("progressBar.html");
	         $("#includedContent").load("sectionSideNav2.html"); 
	    });
 	
		
    </script>


	<style>
	
	li{
	margin:10px 0;
	}
	
	.q .matrix th{
	color: #7280A1;
	background: #EEF2FA;
	padding: 5px;
	font-weight: bold;
	text-align: center;
	vertical-align: bottom;
}

.q .matrix td{
	padding: 5px;
	text-align: center;
	white-space: nowrap;
	height: 26px;
	border-bottom: 1px solid #D8E1F5;
	border-top: 1px solid #D8E1F5;
}

.q .matrix td.question{
	border-right: 1px solid #D8E1F5;
	font-weight: normal;
}

.q .matrix .multi_scale_sub th{
	font-weight: normal;
	border-top: 1px solid #D8E1F5 !important;
	background: #FAFBFD;
}

.q .matrix .multi_scale_break{
	border-right: 1px solid #D8E1F5;
}

.q .matrix_row_dark td{
	color: #575B66;
	background: #FAFBFD;
}

.q .matrix_row_dark td.question{
	color: #575B66;
	background: #FAFBFD;
}

.q .matrix_row_light td{
	color: #575B66;
	background: #FFFFFF;
}

.q .matrix_row_light td.question{
	color: #575B66;
	background: #FFFFFF;
}

.q .rating_ranking td{
	padding: 5px;
}

@media (min-width: 1281px) {
#myModal{
padding-top:230px;
}
}

@media ( min-width : 1025px) and (max-width: 1280px) {

#myModal{
padding-top:230px;
}
}

@media ( min-width : 768px) and (max-width: 1024px) {
#myModal{
padding-top:230px;
}

}
	
@media ( min-width : 990px) and (max-width: 1024px) and (orientation:
	landscape) {
	
	#myModal{
padding-top:230px;
}
}	

@media ( min-width : 481px) and (max-width: 767px) {
#myModal{
padding-top:500px;
}
}

@media ( min-width : 320px) and (max-width: 480px) {
#myModal{
padding-top:900px;
}
}
	
	</style>
<%

	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader ("Expires", 0);
	
	if(session.getAttribute("USERID")==null){
		response.sendRedirect(request.getContextPath() + "/sessionExpired.jsp");
	}
	
%>
	
	
	
</head>
<body class="bgcolor" oncontextmenu="return false">

<div class="row-fluid">

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
				
				<div class="col-md-2 col-sm-4" id = "side_image">
					<img class="img-responsive" alt="" src="images/ss-tb.jpg">
				</div>
				
				<div class="col-md-10 col-sm-8">
				
					<div id="head" class="row">
					<div id="section1" class="hidden"><h3><b>Understanding Depression</b></h3></div>
				<div id="section4" class="hidden"><h3><b>Dealing with depressive thoughts</b></h3></div>
				<div id="section5" class="hidden"><h3><b>Manage excessive worries</b></h3></div>
				<div id="section10" class="hidden"><h3><b>Step Up: When you need to</b></h3></div>
					
						<h3><b id="subsection-name"></b></h3>
						
						<div class="clearfix"></div>
						
						<p id="exercise-title" class="text-justify">
						</p>	
									
						<hr style="border-bottom: 1px solid black;">
						
						<!-- below code is for displaying poster in the section 5-subsection2 only -->
						<div class="hidden" id = "new">
						
						<div class="clearfix"></div>
						
						<div class="col-md-1"></div>
						
						<div class="col-md-10">
						
						<div id="images">
						<img class="img-responsive" alt="" src="images/manage-worries.png">
						</div>
						
						<br>
						<br>
						
						</div>
						
						</div>
						
						
						<div id="paragraph" class="text-justify">
						</div>
						
						
						<!-- code for section1 subsection 2 content in a box -->
						
						<div class="hidden" id="section1-2">
								
						<ul style="border:1px solid black;">
						
						<li>Depression is a common mental health condition.</li>
						<li>Depression is multifactorial.</li>
						<li>Depression can happen to anyone, including people who may be seen as 'strong'</li>
						<li>Depression can occur even without any obvious negative life event/triggering situation.</li>
						<li>Depression as a mental health condition involves a group of symptoms and it is not just about being sad.</li>
						<li>Effective methods of interventions are available to manage depression.</li>
						<li>Depression is often accompanied by low motivation to do things, it would be wrong to say that someone who is depressed is being lazy.</li>
						<li>People with depression can take simple steps to help their own process of recovery, along with utilizing available professional support, as may be needed.</li>
						<li>Seeking professional help for depression is a sign of strength rather than weakness.</li>
						
						</ul>
						
						</div>
						
						
						
						
						<div><em id="how" class="hidden">
						
						<ul style="border:3px solid black;">
						
						<li>As a first step, you can ask us and clarify your doubts regarding seeking direct professional help</li>
						<li>Do some background exploration and check as to which kind of professional might be best suited to address your needs.</li>
						<li>Give yourself a chance to decide after meeting a trained professional  and gauging your comfort level</li>
						<li>Take charge of your situation by preparing to ask all the questions about your problem and  options of interventions when you meet a professional</li>
						<li>Keep open the possibility of taking along with you someone you trust and feel comfortable with (atleast for the first session/till you gain confidence)
						<li>If one of your attempts at taking help from a professional has been unsatisfactory, do not shy away from trying another source of professional help, after some background check (Just because you did not benefit from consultation with one professional does not mean that professional help for mental health problems is ineffective or that everyone has the same professional style/expertise that matches your needs). Avoid overgeneralizing!</li>
						</ul>
						
						<b>How/Whom to approach:</b><br>Just drop us a mail and we will guide you through the possible options for seeking additional professional help for your mental health condition.</em></div>
					
						</div>
							
						</div>
						
						</div>	
							
						<div class="clearfix"></div>
						
						<br>
						<br>
						<br>
						
						
						<div id="congs" class="hidden" style="border:3px solid black;background-color:#FFE0B2;font-style:italic;">
						<p style="text-align: center;color:black;">
						<b>
						<span style="font-size:20px;">Congratulations!</span>
						</b>
						</p>
						<br>
						
						<p style="text-align: center;color:black;font-style:italic;">
						
						<b>You have completed your journey through the sections in the<br> Essential Zone!<br>You may wish to go back and reflect on what you have picked<br>up/done in various sections, either through your workbook or<br>by revisiting the main pages.You may also want to explore the<br> optional zone sections.<br><br>
						</b>
						
						</p>
						
						<p style="text-align: center;color:black;">
						
						<b>
						Growing from within is a wonderful journey.<br>Thank you for undertaking this journey.<br>	
						</b>
						
						</p>
						
						<p style="text-align: center;color:black;font-style:italic;font-weight:bold;">
						
						Best Wishes<br>
						PUSH-D Resource Team
						
						</p>
						
						</div>
						
						<div id ="congs1" class = "hidden">
						
						<br><br><br>
						
						<p style="text-align: center;color:black;font-size:20px;">
						
						<b>Life is a journey, not a destination- Ralph Waldo Emerson</b> 
						 
						 </p>
						     
					     </div>
						     
						<div id="head" class="row">
						
						<div class="col-md-9">
						</div>
						
						<div id="next" class="col-md-2">
						</div>
						<div id="next1" class="col-md-2 hidden">
						 <button  class="alert alert-info text-center btn-block btn-lg active" id="button2" role="alert" onclick="screenerPage()" style="text-decoration: none;">Next</button>
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
						
						</div>	
						
						<div class="modal" id="screenermodal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success" style="background: #4CAF50;color: white">
					<h5><b style="text-align:center;"></b></h5>
				</div>
				<div class="modal-body text-justify">
				
				<div id="FSForm">
				<!-- <button  class="home" onclick="window.location.href='index.jsp'" style="border-radius: 50%; border: 1px solid #4C6BB5; margin: 15px; background: transparent;">
<i class="fa fa-home" aria-hidden="true" style=" font-size: 23px; color: #4C6BB5;" ></i></button> -->


<!-- BEGIN_ITEMS -->
<div class="form_table" method="post">

<div class="clear"></div>

<div id="q7" class="q full_width">
<a class="item_anchor" name="ItemAnchor0"></a>
<!--<div class="segment_header" style="color:#000000;width:auto;text-align:Right;background-repeat:repeat;background-color:transparent;background-image:url(https://fs28.formsite.com/4Rlq9k/"/images/stock/2015/Education/Education24.jpg");background-size: cover;background-position: 50% 50%;"><h1 style="font-size:36px;font-family:'Dosis',sans-serif;padding:190px 1em 10px ;background-color:rgba(0, 0, 0, 0.188235)"></h1></div>-->
</div>

<div class="clear"></div>

<div id="q9" class="q full_width">
<a class="item_anchor" name="ItemAnchor1"></a>
<div class="segment_header" style="width:auto;text-align:Center;"><h1 style="font-size:24px;font-family:'Arvo',serif;padding:20px 1em ;"></h1><h4 style="font-family:'Arvo',serif;padding:10px 1em ;">Let's re-assess your depressive symptoms at this point.</h4></div>
</div>

<div class="clear"></div>

<div class="clear"></div>

<div id="q4" class="q required">
<a class="item_anchor" name="ItemAnchor4"></a>
<span class="question top_question">Instructions: Below is a list of statements dealing with your mood in the last few days. 
<br>Please read the items carefully and mark the option (&#10004;) that best describes you.&nbsp;<b class="icon_required" style="color:#FF0000">*</b></span>
<br>
<table class="matrix">
<tr>
<th scope="col">Over the last 2 weeks, how often have you been bothered by any of the following problems?&nbsp;</th><th width="60px;" scope="col">Not at all</th><th width="60px;" scope="col">Several Days</th><th width="60px;" scope="col">More than half the days</th><th width="60px;" scope="col">Nearly every day</th>
</tr>
<tr class="matrix_row_light">
<td class="question" style="width:px;">1. Little interest or pleasure in doing things.</td>
<td><label for="RESULT_RadioButton-4-0-0" class="accessibility_hidden">Strongly Agree</label><input type="radio" name="RESULT_RadioButton-4-0" class="multiple_choice" id="RESULT_RadioButton-4-0-0" value="0" /></td>
<td><label for="RESULT_RadioButton-4-0-1" class="accessibility_hidden">Agree</label><input type="radio" name="RESULT_RadioButton-4-0" class="multiple_choice" id="RESULT_RadioButton-4-0-1" value="1" /></td>
<td><label for="RESULT_RadioButton-4-0-2" class="accessibility_hidden">Neutral</label><input type="radio" name="RESULT_RadioButton-4-0" class="multiple_choice" id="RESULT_RadioButton-4-0-2" value="2" /></td>
<td><label for="RESULT_RadioButton-4-0-3" class="accessibility_hidden">Disagree</label><input type="radio" name="RESULT_RadioButton-4-0" class="multiple_choice" id="RESULT_RadioButton-4-0-3" value="3" /></td>
<!--<td><label for="RESULT_RadioButton-4-0-4" class="accessibility_hidden">Strongly Disagree</label><input type="radio" name="RESULT_RadioButton-4-0" class="multiple_choice" id="RESULT_RadioButton-4-0-4" value="Radio-4" /></td>-->
</tr>
<tr class="matrix_row_dark">
<td class="question" style="width:px;">2. Feeling down, depressed, or hopeless</td>
<td><label for="RESULT_RadioButton-4-1-0" class="accessibility_hidden">Strongly Agree</label><input type="radio" name="RESULT_RadioButton-4-1" class="multiple_choice" id="RESULT_RadioButton-4-1-0" value="0" /></td>
<td><label for="RESULT_RadioButton-4-1-1" class="accessibility_hidden">Agree</label><input type="radio" name="RESULT_RadioButton-4-1" class="multiple_choice" id="RESULT_RadioButton-4-1-1" value="1" /></td>
<td><label for="RESULT_RadioButton-4-1-2" class="accessibility_hidden">Neutral</label><input type="radio" name="RESULT_RadioButton-4-1" class="multiple_choice" id="RESULT_RadioButton-4-1-2" value="2" /></td>
<td><label for="RESULT_RadioButton-4-1-3" class="accessibility_hidden">Disagree</label><input type="radio" name="RESULT_RadioButton-4-1" class="multiple_choice" id="RESULT_RadioButton-4-1-3" value="3" /></td>
<!--<td><label for="RESULT_RadioButton-4-1-4" class="accessibility_hidden">Strongly Disagree</label><input type="radio" name="RESULT_RadioButton-4-1" class="multiple_choice" id="RESULT_RadioButton-4-1-4" value="Radio-4" /></td>-->
</tr>
<tr class="matrix_row_light">
<td class="question" style="width:px;">3. Trouble falling or staying asleep, or sleeping too much</td>
<td><label for="RESULT_RadioButton-4-2-0" class="accessibility_hidden">Strongly Agree</label><input type="radio" name="RESULT_RadioButton-4-2" class="multiple_choice" id="RESULT_RadioButton-4-2-0" value="0" /></td>
<td><label for="RESULT_RadioButton-4-2-1" class="accessibility_hidden">Agree</label><input type="radio" name="RESULT_RadioButton-4-2" class="multiple_choice" id="RESULT_RadioButton-4-2-1" value="1" /></td>
<td><label for="RESULT_RadioButton-4-2-2" class="accessibility_hidden">Neutral</label><input type="radio" name="RESULT_RadioButton-4-2" class="multiple_choice" id="RESULT_RadioButton-4-2-2" value="2" /></td>
<td><label for="RESULT_RadioButton-4-2-3" class="accessibility_hidden">Disagree</label><input type="radio" name="RESULT_RadioButton-4-2" class="multiple_choice" id="RESULT_RadioButton-4-2-3" value="3" /></td>
<!--<td><label for="RESULT_RadioButton-4-2-4" class="accessibility_hidden">Strongly Disagree</label><input type="radio" name="RESULT_RadioButton-4-2" class="multiple_choice" id="RESULT_RadioButton-4-2-4" value="Radio-4" /></td>-->
</tr>
<tr class="matrix_row_dark">
<td class="question" style="width:px;">4. Feeling tired or having little energy</td>
<td><label for="RESULT_RadioButton-4-3-0" class="accessibility_hidden">Strongly Agree</label><input type="radio" name="RESULT_RadioButton-4-3" class="multiple_choice" id="RESULT_RadioButton-4-3-0" value="0" /></td>
<td><label for="RESULT_RadioButton-4-3-1" class="accessibility_hidden">Agree</label><input type="radio" name="RESULT_RadioButton-4-3" class="multiple_choice" id="RESULT_RadioButton-4-3-1" value="1" /></td>
<td><label for="RESULT_RadioButton-4-3-2" class="accessibility_hidden">Neutral</label><input type="radio" name="RESULT_RadioButton-4-3" class="multiple_choice" id="RESULT_RadioButton-4-3-2" value="2" /></td>
<td><label for="RESULT_RadioButton-4-3-3" class="accessibility_hidden">Disagree</label><input type="radio" name="RESULT_RadioButton-4-3" class="multiple_choice" id="RESULT_RadioButton-4-3-3" value="3" /></td>
<!--<td><label for="RESULT_RadioButton-4-3-4" class="accessibility_hidden">Strongly Disagree</label><input type="radio" name="RESULT_RadioButton-4-3" class="multiple_choice" id="RESULT_RadioButton-4-3-4" value="Radio-4" /></td>-->
</tr>
<tr class="matrix_row_light">
<td class="question" style="width:px;">5. Poor appetite or overeating</td>
<td><label for="RESULT_RadioButton-4-4-0" class="accessibility_hidden">Strongly Agree</label><input type="radio" name="RESULT_RadioButton-4-4" class="multiple_choice" id="RESULT_RadioButton-4-4-0" value="0" /></td>
<td><label for="RESULT_RadioButton-4-4-1" class="accessibility_hidden">Agree</label><input type="radio" name="RESULT_RadioButton-4-4" class="multiple_choice" id="RESULT_RadioButton-4-4-1" value="1" /></td>
<td><label for="RESULT_RadioButton-4-4-2" class="accessibility_hidden">Neutral</label><input type="radio" name="RESULT_RadioButton-4-4" class="multiple_choice" id="RESULT_RadioButton-4-4-2" value="2" /></td>
<td><label for="RESULT_RadioButton-4-4-3" class="accessibility_hidden">Disagree</label><input type="radio" name="RESULT_RadioButton-4-4" class="multiple_choice" id="RESULT_RadioButton-4-4-3" value="3" /></td>
<!--<td><label for="RESULT_RadioButton-4-4-4" class="accessibility_hidden">Strongly Disagree</label><input type="radio" name="RESULT_RadioButton-4-4" class="multiple_choice" id="RESULT_RadioButton-4-4-4" value="Radio-4" /></td>-->
</tr>
<tr class="matrix_row_dark">
<td class="question" style="width:px;">6. Feeling bad about yourself or that you are a failure or have let yourself or your family down</td>
<td><label for="RESULT_RadioButton-4-5-0" class="accessibility_hidden">Strongly Agree</label><input type="radio" name="RESULT_RadioButton-4-5" class="multiple_choice" id="RESULT_RadioButton-4-5-0" value="0" /></td>
<td><label for="RESULT_RadioButton-4-5-1" class="accessibility_hidden">Agree</label><input type="radio" name="RESULT_RadioButton-4-5" class="multiple_choice" id="RESULT_RadioButton-4-5-1" value="1" /></td>
<td><label for="RESULT_RadioButton-4-5-2" class="accessibility_hidden">Neutral</label><input type="radio" name="RESULT_RadioButton-4-5" class="multiple_choice" id="RESULT_RadioButton-4-5-2" value="2" /></td>
<td><label for="RESULT_RadioButton-4-5-3" class="accessibility_hidden">Disagree</label><input type="radio" name="RESULT_RadioButton-4-5" class="multiple_choice" id="RESULT_RadioButton-4-5-3" value="3" /></td>
<!--<td><label for="RESULT_RadioButton-4-5-4" class="accessibility_hidden">Strongly Disagree</label><input type="radio" name="RESULT_RadioButton-4-5" class="multiple_choice" id="RESULT_RadioButton-4-5-4" value="Radio-4" /></td>-->
</tr>
<tr class="matrix_row_light">
<td class="question" style="width:px;">7. Trouble concentrating on things, such as reading the newspaper or watching television</td>
<td><label for="RESULT_RadioButton-4-6-0" class="accessibility_hidden">Strongly Agree</label><input type="radio" name="RESULT_RadioButton-4-6" class="multiple_choice" id="RESULT_RadioButton-4-6-0" value="0" /></td>
<td><label for="RESULT_RadioButton-4-6-1" class="accessibility_hidden">Agree</label><input type="radio" name="RESULT_RadioButton-4-6" class="multiple_choice" id="RESULT_RadioButton-4-6-1" value="1" /></td>
<td><label for="RESULT_RadioButton-4-6-2" class="accessibility_hidden">Neutral</label><input type="radio" name="RESULT_RadioButton-4-6" class="multiple_choice" id="RESULT_RadioButton-4-6-2" value="2" /></td>
<td><label for="RESULT_RadioButton-4-6-3" class="accessibility_hidden">Disagree</label><input type="radio" name="RESULT_RadioButton-4-6" class="multiple_choice" id="RESULT_RadioButton-4-6-3" value="3" /></td>
<!--<td><label for="RESULT_RadioButton-4-6-4" class="accessibility_hidden">Strongly Disagree</label><input type="radio" name="RESULT_RadioButton-4-6" class="multiple_choice" id="RESULT_RadioButton-4-6-4" value="Radio-4" /></td>-->
</tr>
<tr class="matrix_row_dark">
<td class="question" style="width:px;">8. Moving or speaking so slowly that other people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual</td>
<td><label for="RESULT_RadioButton-4-7-0" class="accessibility_hidden">Strongly Agree</label><input type="radio" name="RESULT_RadioButton-4-7" class="multiple_choice" id="RESULT_RadioButton-4-7-0" value="0" /></td>
<td><label for="RESULT_RadioButton-4-7-1" class="accessibility_hidden">Agree</label><input type="radio" name="RESULT_RadioButton-4-7" class="multiple_choice" id="RESULT_RadioButton-4-7-1" value="1" /></td>
<td><label for="RESULT_RadioButton-4-7-2" class="accessibility_hidden">Neutral</label><input type="radio" name="RESULT_RadioButton-4-7" class="multiple_choice" id="RESULT_RadioButton-4-7-2" value="2" /></td>
<td><label for="RESULT_RadioButton-4-7-3" class="accessibility_hidden">Disagree</label><input type="radio" name="RESULT_RadioButton-4-7" class="multiple_choice" id="RESULT_RadioButton-4-7-3" value="3" /></td>
<!--<td><label for="RESULT_RadioButton-4-7-4" class="accessibility_hidden">Strongly Disagree</label><input type="radio" name="RESULT_RadioButton-4-7" class="multiple_choice" id="RESULT_RadioButton-4-7-4" value="Radio-4" /></td>-->
</tr>
<tr class="matrix_row_light">
<td class="question" style="width:px;">9. Thoughts that you would be better off dead or of hurting yourself in some way</td>
<td><label for="RESULT_RadioButton-4-8-0" class="accessibility_hidden">Strongly Agree</label><input type="radio" name="RESULT_RadioButton-4-8" class="multiple_choice" id="RESULT_RadioButton-4-8-0" value="0" /></td>
<td><label for="RESULT_RadioButton-4-8-1" class="accessibility_hidden">Agree</label><input type="radio" name="RESULT_RadioButton-4-8" class="multiple_choice" id="RESULT_RadioButton-4-8-1" value="1" /></td>
<td><label for="RESULT_RadioButton-4-8-2" class="accessibility_hidden">Neutral</label><input type="radio" name="RESULT_RadioButton-4-8" class="multiple_choice" id="RESULT_RadioButton-4-8-2" value="2" /></td>
<td><label for="RESULT_RadioButton-4-8-3" class="accessibility_hidden">Disagree</label><input type="radio" name="RESULT_RadioButton-4-8" class="multiple_choice" id="RESULT_RadioButton-4-8-3" value="3" /></td>
<!--<td><label for="RESULT_RadioButton-4-8-4" class="accessibility_hidden">Strongly Disagree</label><input type="radio" name="RESULT_RadioButton-4-8" class="multiple_choice" id="RESULT_RadioButton-4-8-4" value="Radio-4" /></td>-->
</tr>
</table>
</div>

<div class="clear"></div>


<div class="clear"></div>

<div style="position:relative;font-family:'Open Sans',Helvetica,Arial,sans-serif;font-size:12px;line-height:36px;text-align:left;background-color:#fafafa;height:35px;margin-top:10px;overflow:hidden;">

</div>
</div>
<!-- END_ITEMS -->
<input type="hidden" name="EParam" value="FzpUCZwnDno=" />
<div class="outside_container">
<div class="buttons_reverse"><input type="submit" name="Submit" value="Submit" onclick="submitForm();" class="submit_button" /></div></div>
</div>
<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success" style="background: #4CAF50;color: white">
					<h5><b>FEEDBACK</b></h5>
				</div>
				<div class="modal-body text-justify">
					<p id="feedback1" class="hidden" style="color:darkblue;"><b>You do not seem to have depressive symptoms. However, if you have any mental health concerns do contact a professional.</b></p>
					<p id="feedback2" class="hidden" style="color:darkblue;"><b>You seem to be having mild depressive symptoms. We suggest you to consult a mental health professional.</b></p>
					<p id="feedback3" class="hidden" style="color:darkblue;"><b>You seem to be having significant depressive symptoms. We strongly recommend you to consult a mental health professional.</b></p>
				</div>
				<div align="center"><b>Note: This is only a screening tool. It is not meant for making a diagnosis.</b></div>
				<div align="center"><br>
				
				<p>Please  feel free  to contact a  mental health professional  for    face  to face  consultation or  
email us  for  advise on the same.</p>
				
				</div>
				<div class="modal-footer">
					<button id="myInput" type="button" class="btn btn-success" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
		<div class="modal fade" id="complete" role="dialog">
		<div class="modal-dialog" >
			<!-- Modal content-->
			<div class="modal-content">

				<div class="text-justify" style="padding: 20px;">Please complete the form to get the feedback</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="next_page()" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> 
			
			<script type="text/javascript">
		
			var i=0;
			var data_array=[];
			
		  	$(document).ready(function() {
		
			$.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/currSubSection",
				  success: function(data){
		
						sectionId = data['currentSection'];
						subsectionId = data['currentSubSection'];
			
			 			activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
			
						
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/toolbox",
							  success: function(data1){
					
									$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									$("#exercise-title").html(data1['exerciseTitle']);
									//below if part is for diplaying poster in section5-subsection2 only
									
									if((sectionId==5 && subsectionId==2) || (activeSectionId==5 && activeSubSectionId==2))
						    	    {
								  		$('#new').removeClass("hidden");
								  		var str=$('#link ').html();
								  		
								  		
								  		
								  		$("#link").attr('href', 'references1.html');
								  		$("#section5").removeClass("hidden");
						    	    }
									else if((sectionId==4 && subsectionId==5) || (activeSectionId==4 && activeSubSectionId==5))
						    	    {
										$("#section4").removeClass("hidden");
						    	    }else if((sectionId==10 && subsectionId==3) || (activeSectionId==10 && activeSubSectionId==3))
						    	    {
						    	    	$("#section10").removeClass("hidden");
						    	    }else if((sectionId==10 && subsectionId==4) || (activeSectionId==10 && activeSubSectionId==4))
						    	    {
						    	    	$("#section10").removeClass("hidden");
						    	    }
										
										
									
								
									
								  	myFunction(data1['lists']);

								  	if((activeSectionId==10 && activeSubSectionId==4))
									{
									
									$("#how").removeClass("hidden");
									$("#congs").removeClass("hidden");
									$("#congs1").removeClass("hidden");
									
									//code should write here for screener
									
									$.ajax({
									  type: "GET",
									  url: serverURL + "users/" +userId+"/getScreenStatus",
									  success: function(data2){
										  if(data2 == 2){
										   $("#next").removeClass("hidden");  
										   $("#next1").addClass("hidden"); 
										  }else{ 
											  $("#next").addClass("hidden");
											  $("#next1").removeClass("hidden");
										  }
										  
									   }, error: function() {
										   alert("Error: server encountered an internal error. Please try again after some time ");
										  
									  } 
										  
										  
									  });
									
									$("#next").addClass("hidden");
									$("#next1").removeClass("hidden");
									
									
									
									}
								  	
								  	
								  	else if((activeSectionId==1 && activeSubSectionId==2))
									{
									
									
									$("#section1-2").removeClass("hidden");
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
				
				
				//fetching data from DB rest service
				
					
							$.ajax({
								type : "GET",
								url : serverURL + "users/" + userId
										+ "/sections/" + 4 + "/subsections/"
										+ 5 + "/" + "3rdSecdata/1",
								contentType : "application/json",
								dataType : "json",
								success : function(data) {
									
									if(data[0].response){
										$('#download').removeClass("hidden");
									var parsed_data45  = JSON.parse("[" + data[0].response + "]");
									data_array.push(parsed_data45[0]);
									
									$.each(parsed_data45[0], function(i, val){

										   $("input[value='" + val + "']").prop('checked', 'checked');
										   var el = document.getElementById("drop_box");
										   
										   var height = el.offsetHeight;
										   var newHeight = height + 10;
										   el.style.height = newHeight + 'px';
										    
										   $( ".drop_div" ).append("<br />"+(i+1)+")" +val);
									
										});
									
									
									$("input[type=checkbox").prop('disabled','disabled');
									
								}else{
									
									$("input[type=checkbox").prop('disabled',false);
								}
									$('#submit').addClass("hidden");
								}
							
								});
				
				
				
				
				
	    	    var out = '';
	    	   	
	    	    if((sectionId==4 && subsectionId==5) || (activeSectionId==4 && activeSubSectionId==5))
	    	    {
	    	   
	    	    out += arr[0];
	    	    out+='<ul id ="checkox_ul" class="list_class"  style="border:1px solid black;background-color:#FFE0B2;list-style:none;color:black;padding-right:20px;">';
	    	    for(i = 1; i < arr.length-1; i++) {
	    	    	
	    	    	 
	    	    	 out += '<li id = "data '+i+'"><input type="checkbox" class="checkBoxClass" name="list'+i+'" id="check'+i+'" value="'+arr[i]+'" onclick = "checkbox_label(this,'+i+')" ><span style="padding-left:20px;"><label>' + arr[i] + '</span></label></li>'; 
				}
   				out += '</ul>';
   				out += '<div class="drop_div" id="drop_box" style = "padding-left:40px;background-color:FFE0B2; border : 1px solid black;height:240px;"><p style = "text-align:center; color:blue;">My favorite questions  to   correct my thinking errors</p></div>';
   				out+='<br>';
   				out += '<div><button type="button" id="download" class="btn btn-warning pull-left hidden" onclick = "download()">Download</button>';
   				out += '<div><button type="button" id="submit" class="btn btn-primary pull-right " onclick = "submit()">submit</button>';
   				out += '<p style = " color: blue;text-align: center;">' + "Carry it as a set of reminder questions to deal with negative thoughts" + '</p></div>';
   				out+='<br>'+'<br>';
   				out+='<br>'+arr[i]+'<br>';
	    	    }
	    	    
	    	    /* code for section 10 subsection4 */
	    	    
	    	    
	    	    
	    	    else
	    	    {
	    	    	
	    	    	for(i = 0; i < arr.length; i++) {
		    	    	
		    	    	out += '<li>' + arr[i] + '</li>';
					}
	   				out += '</ul>';
	    	    }
   				
	    	    $('#paragraph').html(out);
	    	  
    	   	}
			function myFunction1(arr) {
	    	    var out = '<ul>';
	    	   
	    	    for(i = 0; i < arr.length-1; i++) {
	    	    	
	    	    	out += '<li>' + arr[i]  + '</li>' ;
				}
   				out += '</ul>';
   				out += '<li>' + arr[i] + '</li>';
	    	    $('#paragraph').html(out);
	    	    
    	   	}
	   	});
		
		
		
		var u=1;
		
		var dropped_data_array = [];
		
		Array.prototype.remove= function(){
		    var what, a= arguments, L= a.length, ax;
		    while(L && this.length){
		        what= a[--L];
		        while((ax= this.indexOf(what))!= -1){
		            this.splice(ax, 1);
		        }
		    }
		    return this;
		}
	
		function checkbox_label(i, v) {
			var el = document.getElementById("drop_box");
		    var height = el.offsetHeight;
		    var newHeight = height + 20;
		    el.style.height = newHeight + 'px';

			var idcheck = "check" + v;
			var val = document.getElementById(idcheck);
			
			if (val.checked == true) {
				var newHeight = height + 20;
			    el.style.height = newHeight + 'px';
				
			
			
			$(".drop_div").append("<p id='check_id"+v+"'> *" + i.value+"</p>");
			
			dropped_data_array.push((i.value));
			data_array.push(dropped_data_array);
			
			} else {
				var newHeight = height - 20;
			    el.style.height = newHeight + 'px';
				
				var valId ='#check_id'+v;
				
				$(valId).remove();
				dropped_data_array = dropped_data_array.remove(i.value);
				data_array.push(dropped_data_array);
				
			}
			

		}

		function submit() {
			
			$('#submit').addClass("hidden");
			$('#download').removeClass("hidden");
			$("input[type=checkbox").prop('disabled', 'disabled');

			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table2arr1 = dropped_data_array;

			var Indata = {
				userId : userId,
				section_id : 4,
				sub_section_id : 5,
				version_id : 1,
				response : JSON.stringify(table2arr1),
				category_id : 'null'
			};
			

			var myJSON = JSON.stringify(Indata);

			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 4
						+ "/subsections/" + 5 + "/" + "3rdSecdata/1",
				data : myJSON,
				contentType : "application/json",
				dataType : "json",
				success : function(data) {

				},
				error : function() {
					alert("Error: server encountered an internal error. Please try again after some time ");
				}
			});
		}
		
		
		
		//begin download function to download table/form to excel/pdf
		
		 function download(){
			 	var tab_text = '<table id="table245">';
			    var textRange; 
			    var j = 0;
			    
			   	
			    	for(var p=0;p<data_array[0].length;p++){
			    		tab_text = tab_text +"<tr><td>"+data_array[0][p]+"</td></tr>";
			    	}
			    	
			        		
			    tab_text = tab_text + "</table>";
			    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
			    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
			    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params

			    downlodExcel(tab_text);
			    	
				
		 }
		 function screenerPage(){
				$("#screenermodal").modal();
				}
		 function submitForm(){
				$('#feedback1').addClass('hidden');
				$('#feedback2').addClass('hidden');
				$('#feedback3').addClass('hidden');
				formData = "responce=";
				
				var totalScore=0
				for(var i=0;i<9;i++){
					formData+=$('input[name=RESULT_RadioButton-4-'+i+']:checked').val()+',';
					if($('input[name=RESULT_RadioButton-4-'+i+']:checked').val()!=undefined)
						totalScore+=parseInt($('input[name=RESULT_RadioButton-4-'+i+']:checked').val());
				}
				
				
				if(totalScore<5)
					$('#feedback1').removeClass('hidden');
				else if(totalScore<10)
					$('#feedback2').removeClass('hidden');
				else
					$('#feedback3').removeClass('hidden');
				
				
				formData+=totalScore+',';
				
				
				if(formData.includes("undefined")){
					alert("Please complete all fields");
					
				}else{
					$('#myModal').modal("show");
				}
				
				
				var screener_flag=2;
				$.ajax({
					  type: "POST",
					  url: serverURL + "users/responce?user_id="+userId+"&&screener_flag="+screener_flag,
					  
					  data: formData,
					 
					  success: function(data) { 
						  
						 //alert("success"); 
					  },
					  error: function() {
						 
						  alert("Error: server encountered an internal error. Please try again after some time ");
						  
					  }
				});
				
				$("#next1").addClass("hidden");
				$("#next").removeClass("hidden");
				
				
				
			}
		
		
		
	</script>
	
</body>
</html>