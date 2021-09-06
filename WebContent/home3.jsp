<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval()%>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID")%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Home</title>

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("USERID") == null) {
		response.sendRedirect(request.getContextPath() + "/sessionExpired.jsp");
	}
%>



<!-- Bootstrap -->
<link href="bs/css/bootstrap.min.css" rel="stylesheet">
<link href="fa/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="all" href="include/form/fonts71523.css?1701" />
<link rel="stylesheet" type="text/css" media="all" href="include/form/screen71523_new.css?1701" />
<link rel="stylesheet" type="text/css" media="print" href="include/form/print71523.css?1701" />

<script src="bs/js/jquery-2.1.1.min.js"></script>
<script src="bs/js/jquery.session.js"></script>
<script src="bs/js/jquery.cookie.js"></script>
<script src="bs/js/bootstrap.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/values.js"></script>

<style type="text/css">
.image {
	position: relative;
	width: 100%; /* for IE 6 */
	height: auto;
}

h2 {
	position: absolute;
	top: 70px;
	right: 0%;
	width: 100%;
	text-align: right;
}
@media (min-width: 1281px) {
#myModal{
/*padding-top:230px;*/
position: absolute;
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
padding-top:300px;
}
}

@media ( min-width : 320px) and (max-width: 480px) {
#myModal{
padding-top:300px;
}
}
</style>
<script type="text/javascript">
	

	

	

	history.forward();

	$(function() {
		$("#header").load("navHeader.html");
		
		$('[data-toggle="tooltip"]').tooltip();

		
		
	});
	$(function() {

		$("h2").wrapInner("<span>")

		$("h2 br").before("<span class='spacer'>").after(
				"<span class='spacer'>");

	});

	
	document.onmousedown = disableclick;
	status = "Right Click Disabled";
	function disableclick(event) {
		if (event.button == 2) {
			
			return false;
		}
	}
	
 $(window).on('load',function(){
	//here have to write screener code 2weeks
	
	$.ajax({
	   type : "GET",
	   url : serverURL+ "users/"+ userId+ "/getModeOfScreener",
	   success : function(data) {
		   
		   
		   if(data==0 || data== null){
			   
			   $.ajax({
				   type : "GET",
				   url : serverURL+ "users/"+ userId+ "/getTimeDuration",
				   success : function(data) {
		
						if(data > 21){	
								
							$('#screenermodal').modal('show');
						}

				      },error : function() {
				    	  alert("Error: server encountered an internal error. Please try again after some time ");
				       
								 
				        
				      }
				       });
			   
		   }

			

	      },error : function() {
	    	  alert("Error: server encountered an internal error. Please try again after some time ");
	       		 
	        
	      }
	       });
	
	
      
    });
</script>

</head>
<body oncontextmenu="return false">
	<div class="bgcolor">
		<div id="header"></div>
		<!--<div id="browser"></div>  -->
		<div id="smiley"></div>

		<div class="container-fluid" style="height: 100%">
			<div class="container-fluid" style="height: 100%">
				<div class="row">
					<div class="col-md-2">
						<button id="list0" class="btn btn-primary btn-block btn-info"
							style="text-align: left; padding-left: 20px;"
							onclick="showContent(0)">
							<strong>OVERVIEW</strong>
						</button>
						<button id="list1" disabled="disabled"
							class="btn btn-default btn-block btn-info"
							style="text-align: left; padding-left: 20px;"
							onclick="showContent(1)">
							<strong>SIGN BOARDS</strong>
						</button>
						<button id="list2" disabled="disabled"
							class="btn btn-default btn-block btn-info"
							style="text-align: left; padding-left: 20px;"
							onclick="showContent(2)">
							<strong>TIPS FOR COMPLETION</strong>
						</button>
						<button id="list3" disabled="disabled"
							class="btn btn-default btn-block btn-info"
							style="text-align: left; padding-left: 20px;"
							onclick="showContent(3)">
							<strong>TERMS OF USE</strong>
						</button>

					</div>
					<div class="col-md-10">
						<div class="col-md-8">
							<h3 style="font-family: alegreya">
								Welcome &emsp;<strong class="text-capitalize" id="user-name"></strong>
							</h3>
						</div>

						<div class="clearfix"></div>
						<br>
						<div class="col-md-10" id="0">
						<p><strong>OVERVIEW</strong></p><br>
							<p>The entire program is divided into two broad areas:
								Essential and optional.</p>
							<p class="pclass">
								<strong>ESSENTIAL ZONE:</strong>
							</p>
							<p>
								The <strong>essential zone</strong> contains sections which are
								mandatory for you to complete. These follow a pre-designed
								sequence. These sections cover techniques/approaches that are
								commonly useful for most individuals dealing with depression. If
								you find it very essential to move to a particular section,
								ahead of sequence, please mail us so that we can do the needful.
								Your journey through this essential zone is depicted in the
								diagram given below. Please click SHOW MORE button to know more
								about these sections. Your journey through this zone is depicted
								in the diagram given below.
							</p>
							<p class="pclass">
								<strong>OPTIONAL ZONE:</strong>
							</p>
							<p>
								On the other hand, as the name indicates, <strong>optional
									zone</strong> contains sections which are not mandatory to explore/go
								over. You can decide to go through an optional zone section
								depending on your need or preference.
							</p>
							<br>
							<div class="image">
								<img alt="" src="images/path.png" width="1024px;"
									height="450px;" class="img-responsive">

								<h2>
									<a href="#" class="btn btn-success" data-toggle="modal"
										data-target="#showmoreModal">Show More</a>
								</h2>
								
							</div>
						</div>


						<div class="modal fade" id="showmoreModal" role="dialog">
							<div class="modal-dialog modal-lg">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header modal-header-success" align="center">
										<h3>
											<b>Essential zone sections</b>
										</h3>
									</div>
									<div class="modal-body text-justify opensans">
										<b> Understand depression</b> <br> Check your beliefs
										about depression, bust myths, listen to a story of a depressed
										person, and recognize depressive symptoms<br> <br> <b>Enhance
											Self-Care Motivation</b> <br> Anticipate motivational blocks
										to complete this self-care program and empower yourself with
										strategies to keep your motivation up<br> <br> <b>Activate</b>
										<br> Learn about utility of behavioral-activation for
										depression, systematically plan and monitor your engagements<br>
										<br> <b>Learning to deal with thoughts to influence
											feelings! </b> <br> Learn to recognize thinking-errors that
										are common in depression and substitute unhelpful thoughts
										with more helpful ones<br> <br> <b>Manage
											Excessive Worries</b> <br> Learn to handle excessive worries
										<br> <br> <b>Learn Self-compassion </b> <br>
										Recognize the problems with self-criticality, the utility of
										self-compassion and work on ways to cultivate a
										self-compassionate stance<br> <br> <b>Strengthen
											self-soothing skills</b> <br> Self-soothing is a vital skill
										that helps in managing intense negative emotions. Identify
										self-soothing practices for use<br> <br> <b>Regain
											a sense of mastery</b> <br> Manage the sense of feeling
										overwhelmed by multiple problems and regain a sense of mastery<br>
										<br> <b>Harness the power of support</b> <br>
										Identify and overcome your mental barriers to seeking support
										for managing your depression<br> <br> <b>Step-Up</b>
										<br> Learn to recognize when self-help alone is
										insufficient, manage your psychological barriers to reaching
										out for professional help for depression.<br>

									</div>
									<div class="modal-footer">
										<button id="submitReview" type="button"
											class="btn btn-primary" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="col-md-10 hidden text-justify" id="1">
						<p><strong>SIGN BOARDS</strong></p><br>
							<div class="row">
								<div class="col-md-4">
									<img class="img-responsive" src="images/ss-kp.jpg" height="190"
										width="190" alt="...">
								</div>
								<div class="col-md-8">
									<h4 class="media-heading">
										<!-- <br>Knowledge Point-->
									</h4>
									This is the place where you can find information about a
									concept/technique that is introduced usually at the beginning
									of a section. It is a place where you learn why some
									concept/strategy is relevant for self-care for depression.
									Don't skip this basic step, even though you may feel like
									jumping to other steps.
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-4">
									<img class="img-responsive" src="images/ss-dp.jpg" height="190"
										width="190" alt="...">
								</div>
								<div class="col-md-8">
									<h4 class="media-heading">
										<br>
										<br>
										<br>
										<!-- <br>Discovery Point-->
									</h4>
									It is a point where you learn/discover something about
									yourself, usually through completing an exercise.
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-4">
									<img class="img-responsive" src="images/ss-tb.jpg" height="190"
										width="190" alt="...">
								</div>
								<div class="col-md-8">
									<h4 class="media-heading">
										<br>
										<br>
										<br>
										<br>
										<!-- <br>Tool Box-->
									</h4>
									In the tool box, you can find a listing of different
									methods/ways/ideas to go about doing something that would help
									you to deal with depressive symptoms.
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-4">
									<img class="img-responsive" src="images/ss-dmp.jpg"
										height="190" width="190" alt="...">
								</div>
								<div class="col-md-8">
									<h4 class="media-heading">
										<!-- <br>Demo Point-->
									</h4>
									Similar to a journey one might undertake for learning to drive,
									this is a point where we demonstrate how to do something using
									an example.
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-4">
									<img class="img-responsive" src="images/ss-pp.jpg" height="190"
										width="190" alt="...">
								</div>
								<div class="col-md-8">
									<h4 class="media-heading">
										<br>
										<!-- <br>Practice Point-->
									</h4>
									Knowledge point and tool box as well as demo point may be of
									little help unless you make efforts to apply what you have
									learnt to your situation. Practice point is the point wherein
									you try to apply what you learnt to make the learning
									personally relevant and beneficial.
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-4">
									<img class="img-responsive" src="images/ss-chkp.jpg"
										height="190" width="190" alt="...">
								</div>
								<div class="col-md-8">
									<h4 class="media-heading">
										<br>
										<!-- <br>Check Point-->
									</h4>
									These are for periodic monitoring of how you have been feeling.
									Keeping track of your feelings at periodic intervals helps us
									and helps you to track your journey and also gauge if you need
									some additional/different kind of support system.
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-4">
									<canvas id="myChart1" width="150" height="150"></canvas>
								</div>
								<div class="col-md-8">
									<h4 class="media-heading">Progress Tracker</h4>
									Learning anything involves ups and downs. It is useful to keep
									track of our efforts during our journey of learning. This helps
									us to push ourselves as well as reminds us that we are doing
									alright. <br> Progress tracker focuses on your efforts and
									not on outcomes. This is because, focusing on efforts (rather
									than worrying about and waiting for outcomes) and rewarding
									oneself for ,making small efforts is the best approach to keep
									up one's motivation.
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="col-md-11 hidden text-justify" id="2">
							
							<p><strong>TIPS FOR COMPLETION</strong></p><br>
							<p>
								<strong>OUR STRONG RECOMMENDATIONS AND TIPS FOR YOU
									ABOUT COMPLETING PUSH-D PROGRAM:</strong><br>
								<br>
							</p>
							<ul style="list-style-type: square;">
								<li><strong>Total duration : </strong>For maximum benefits,
									we recommend that you make all attempts to complete the program
									within 1.5 months of registering for the same. Your
									registration to this site is valid for a period of 3 months
									from the date of completing your registration process.</li>
								<br>
								<li><strong>Frequency of engaging with the
										program/number of slots per week : </strong>Regularity and continuity
									are critical for deriving benefit of this self-care program.</li>
								<br>
								<li>We suggest you to keep aside at least two slots on two
									different weekdays (Non-consecutive days, e.g. Monday and
									Thursday rather than Monday and Tuesday) for working on this
									program. This way, you are likely to finish the program in
									about one and half to two months.</li>
								<li><strong>Your slot is your session : </strong>A slot
									here refers to a continuous time period during which you go
									over the contents of the program and complete the exercises
									contained therein. A slot is similar to a session that people
									might have with a therapist/counsellor in face-to-face
									interactions.</li>
								<br>
								<li><strong>Slot-duration : </strong>As this is a self-care
									program, we recommend you to keep each slot for minimum 20
									minutes and maximum up to 45 minutes.</li>
								<br>
								<li><strong>Time-estimates for various sections :
								</strong>We have provided a rough estimate of the time required to
									complete each section, which may help you to plan as you move
									from one section to the next. <br>If you were just
									mechanically/passively reading the content under each of the
									sections, you might just finish it in a very short period of
									time. But, this may not be of much use! <br>We would want
									you to take your time to think about what you are reading as
									well as during the interval period between slots when you are
									trying to apply what you read. <br>We encourage you to go
									over the content in each section at least one more time after
									you have gone over it once. This is similar to what happens in
									direct face to face sessions with a therapist, wherein a few
									key ideas may be discussed in more than one session so that you
									can consolidate your learning and see its personal relevance. <br>The
									time-estimates and the recommended number of sessions provided
									at the start of each section take into account the time needed
									to go over the section more than once.</li>
								<br>
								<li><strong>Apply and Practice : </strong>You will derive
									maximum benefit when you try to apply and practice what you
									discover/learn during your sessions. We recommend that you use
									your workbook and complete various exercises and keep a record
									of how you apply in your daily life whatever you learn in the
									program. Workbook  can be  accessed  on the  web-browser  version  of PUSH-D and  is best used on laptop/desktop.</li>
								<br>
								<li><strong>Schedule your next slot and receive a
										mobile reminder : </strong>At the end of each slot, you have the
									facility of scheduling your next slot for yourself. A mobile
									prompt will be sent as a reminder to you on the day you have
									scheduled the next slot.</li>
								<br>
								<li><strong>E-Assistance: : </strong>We will be
									periodically sending mobile based messages/prompts and /or
									emails to keep you motivated to engage in self-care. You can
									mail us for troubleshooting any difficulty in completing
									PUSH-D/ any new mental health problem/requesting for our
									suggestions regarding seeking face to face professional
									consultation/for seeking an appointment with PUSH-D
									consultants.</li>
								<br>
								<li><strong>Connect over email : </strong>You may choose to
									drop us a mail to clarify your doubts regarding the program
									exercises etc. Such e-mails would be responded to within three
									working days.<br>Mail id :  push.d.nimhans@gmail.com</li>
								<br>
							</ul>
						</div>
						<div class="col-md-11 hidden text-justify" id="3">
						<p><strong>TERMS OF USE</strong></p><br>
							<p>
								<strong>The delimited scope and purpose of the Push-D
									program</strong>
							</p>
							<p>The Information contained in, or accessed through, this
								website is for your general information and Self-development use
								only and is not intended to be used as medical advice and should
								not be used to diagnose, treat, cure or prevent any medical
								condition.</p>
							<p>The diagnosis and treatment of clinical depression and
								anxiety requires a medical practitioner or qualified mental
								health practitioner. People seeking a diagnosis or treatment of
								depression, anxiety or other mental health disorders should
								consult a medical practitioner or mental health professional.
								The website is not designed to treat common mental health
								disorders. It is merely designed to help people to help
								themselves to cope better with depressive symptoms. In a general
								sense, people are likely to find the information on self-care to
								be useful; however this is NOT a substitute for seeking
								professional consultation and advice. There is no claim made
								that the material contained on this website is likely to be of
								help for everyone who uses this website.</p>
							<p>If you have a mental health condition or if you are likely
								to have a diagnosis of mental health condition, you should seek
								professional consultation from a trained mental health
								professional or a medical consultant.</p>
							<p>If at the time of registering for this self-care program
								or at any point of time after registering for this self-care
								program, you notice that you are getting thoughts about harming
								yourself or harming another person, you should not use or
								continue to use this Program but instead should seek urgent
								medical advice. If Push-D becomes aware that you are
								experiencing suicidal thoughts or thoughts of harming yourself
								or any other person in any way, it would strongly recommend you
								to immediately seek medical help through a direct/face-to face
								contact with any trained professional of your choice. If you so
								desire, the Push-D team will try its best to provide you some
								information regarding the availability of centers/trained mental
								health professional in your region, if such information is
								available to the Push-D team.</p>
							<p>We strongly recommend that you always seek the advice of a
								medical practitioner or qualified mental health practitioner for
								any questions regarding personal health or medical conditions.
								We strongly recommend that you never disregard, avoid or delay
								just obtaining medical advice from your medical practitioner or
								qualified mental health practitioner just because of something you
								have read on this webite.</p>
							<p>If you think you may have a medical emergency, call a
								local help-line/reach out to an emergency service.</p>
							<p>NIMHANS does not recommend or endorse any specific tests,
								providers (including, but not limited to, hospitals and
								physicians), products, procedures, or other information that may
								be mentioned on the website. Any opinions expressed on the
								website are the opinions of the individual authors, not of
								NIMHANS.</p>
							<p>The few questionnaires available on this Website are
								intended solely for the purpose of identifying the anxiety and
								depressive symptoms or giving you a rough idea of a particular
								issue and are not designed to provide a diagnosis.</p>
							<p>You represent and warrant that you are at least 18 years
								of age or older. Persons under age 18 with depressive symptoms
								are advised to talk with their parents/guardians about getting
								direct help from a qualified mental health professional/medical
								professional.</p>
							<p>By accessing and using the website, or any portion of the
								website, you agree to be bound by each of the Terms of Use and
								all applicable laws and regulations governing the website. If
								you do not agree with any of the Terms of Use, you are not
								authorized to access or use the website for any purpose. We
								reserve the right to modify these Terms of Use at any time. Your
								use of the website following any such modification constitutes
								your agreement to follow and be bound by the Terms of Use as
								modified.</p>
							<br>
							<p>
								<strong>Fees, charges and cancellation</strong>
							</p>
							<p>There is no fee or charge for you to register with the
								PUSH-D. However, if you access the Program through the use of a
								mobile phone or the Internet, your normal phone/Internet charges
								will apply.</p>
							<p>There is no minimum contract associated with the use of
								PUSH-D. You may choose to stop using the Program at any time.</p>
							<br>
							<p>
								<strong>License to Use</strong>
							</p>
							<p>The information and materials on the website unless
								otherwise stated, are copyrighted by the National Institute for
								Mental Health and Neuro Sciences (NIMHANS), and may be used by
								registered users solely for their own personal use. We grant you
								a limited, personal, non-exclusive, non-transferable license to
								use our content for your own personal, non-commercial use.
								Except as otherwise provided, you acknowledge and agree that you
								have no right to modify, edit, copy, reproduce, create
								derivative works of, reverse engineer, alter, enhance or in any
								way exploit any of the content in any manner, except for
								modifications in filling out the forms for your authorized use.
								You shall not remove any copyright notice from any page/form.</p>
							<br>
							<p>
								<strong>Disclaimer of Warranties</strong>
							</p>
							<p>You agree to assume total responsibility and risk for your
								use of the website, the service and the content. We make no
								express or implied warranties, representations or endorsements
								whatsoever with respect to the website, the service or the
								content. We expressly disclaim all warranties, including, but
								not limited to, implied warranties of merchantability, fitness
								for a particular purpose, title and non-infringement with regard
								to the website, the service, and the content. We do not warrant
								that the functions performed by the website or the service will
								be uninterrupted, timely, secure or error-free, free of viruses
								or other malicious code, or that defects in the website/server
								or the service will be corrected. We do not warrant the
								accuracy, currency, or completeness of the content, or that any
								errors in the content will be corrected. We reserve the right to
								correct any errors, inaccuracies or omissions and to change or
								update information at any time without prior notice. We do not,
								however, guarantee that any errors, inaccuracies or omissions
								will be corrected.The site, the service and the content are
								provided on an 'as is' and 'as available' basis. The foregoing
								does not affect any warranties which cannot be excluded or
								limited under applicable law.</p>
							<br>
							<p>
								<strong>Disclaimer of liability</strong>
							</p>
							<p>
								You understand and agree that under no circumstances we will be
								liable for any damages whatsoever, including, but not limited to
								direct, indirect, incidental, consequential, or punitive damages
								arising out of the use of or inability to use the website, the
								service, or the content. If you are dissatisfied with the
								website, the service, the content, or the terms of use, your
								sole and exclusive remedy is to discontinue using the website.
								You acknowledge, by your use of the website, that your use of
								the website is at your sole risk. <strong>We are not
									liable to any user or person for any decision made or action
									taken in reliance upon information or content displayed or
									provided in this website.</strong> It is your responsibility to make
								your own decisions about the currency, completeness, accuracy,
								reliability and suitability of information, services, programs
								and communities of interest contained in (or accessible from)
								linked websites.
							</p>
							<br>
							<p>
								<strong>Security, viruses, errors and availability</strong>
							</p>
							<p>The internet is an insecure public network which means
								there are risks that information sent to or from this website
								may be intercepted, corrupted or modified by third parties. In
								addition, files obtained from or through this website may
								contain computer viruses, disabling codes, worms or other
								devices or defects. You bear the risks and responsibility for
								any loss or damage caused, directly or indirectly, by these
								risks and we accept no liability for any interference with, or
								damage to, your computer system, software or data occurring in
								connection with this Website.</p>
							<br>
							<p>
								<strong>Use of cookies</strong>
							</p>
							<p>
								<strong>The website uses transient or session cookies.
								</strong>Cookies are pieces of information that a website transfers to
								your computer's hard disk when you open the program pages.
								Cookies by themselves do not identify you or any user but they
								do identify your browser. Because this website uses 'transient'
								cookies, your computer does not retain the information delivered
								in the cookie once you leave the website. When you log out, the
								transient cookie set up by the website is destroyed, and no
								personal information is retained which could identify you or
								your browser next time you log on to the website. Most web
								browsers are set up to accept cookies, and while you can set
								your browser to not accept cookies you will not be able to use
								this website if you do this.
							</p>
							<p>The website may impose limits on the size of files
								uploaded by the users into their workbook. We may also filter,
								remove or refuse to post files which interfere with the
								technical operations of the program, including files which
								threaten to overload or crash a system.</p>
							<br>
							<p>
								<strong>Privacy</strong>
							</p>
							<p>This statement sets out the National Institute for Mental
								Health and Neuro Sciences policy relating to the collection and
								use of your personal information in the PUSH-D Program. This
								Notice is in addition to the Terms of Use. Your registration as
								a PUSH-D user constitutes your agreement to terms of the Privacy
								Notice and the Terms of Use.</p>
							<p>Please note that this Privacy Notice applies only to the
								PUSH-D site and not to any other sites that are linked to the
								PUSH-D site or mentioned on the website.</p>
							<br>
							<p>
								<strong>Your personal information is important to us</strong>
							</p>
							<p>NIMHANS recognizes that your privacy is very important to
								you and that we are under a legal and ethical obligation to
								protect the integrity of your personal information. When you
								register with PUSH-D you will be asked to enter your username.
								We suggest that you use a pseudonym or a made-up username.</p>
							<br>
							<p>
								<strong>Why the program collects personal information
									from you</strong>
							</p>
							<p>When you enter the PUSH-D Program you will be asked to
								complete a number of tests and enter some information, which you
								may consider to be sensitive, about yourself. The program asks
								for this information in order to provide you with tailored and
								specifically relevant information about stress, anxiety and
								depression. The information is stored in your workbook in the
								PUSH-D database along with information about the date and time
								you complete each exercise. Information is also collected in
								summary form about most frequently visited pages. This is
								intended to help the PUSH-D designers understand how visitors
								use the Program. All the information gathered is stored on the
								NIMHANS server and is subject to stringent security measures.</p>
							<ul>
								<li>We will not use or disclose any information about you
									without your consent unless we are required to do so by law;</li>
								<li>We will never use your personal information to send you
									unsolicited information or "spam".</li>
							</ul>
							<p>Like most Internet sites, this website is accessible
								worldwide. However, not all products or Services are available
								to all persons or in all geographic locations. PUSH-D reserves
								the right to limit the provision of its products and Services to
								any person, geographic area, or jurisdiction. This website is
								not intended for use outside India and its content may not be
								most appropriate for those residing outside the country. You
								agree to comply with all applicable laws and local rules or
								restrictions relating to this website.</p>
							<br>
							<p>
								<strong>Risks and benefits</strong>
							</p>
							<p>PUSH-D offers a set of tools and techniques which aim to
								benefit users by;</p>
							<ol style="list-style-type: lower-alpha;">
								<li>Helping them to better understand their sad mood</li>
								<li>Helping them to better understand the things
									(situations) that trigger their sad mood or anxious
									mood/stress.</li>
								<li>Providing suggestions for minimizing the triggers, and
									coping with and managing the symptoms of mild levels of sadness</li>
								<li>Providing (interactive) self-help instruction and
									guidance and exercises for managing depressive symptoms of low
									severity. The suggestions are based on the available research
									literature and commonly used psychological principles in
									management of depression.</li>
							</ol>
							<p>PUSH-D does not 'treat' you, or replace treatment provided
								by a health and/or mental health professional.</p>
							<p>Therefore, there are risks associated with its use,
								including;</p>
							<ol style="list-style-type: lower-alpha;">
								<li>the possibility that your symptoms persist while using
									the Program</li>
								<li>the possibility that your symptoms worsen while using
									the Program</li>
								<li>the possibility that new symptoms or health conditions
									develop while using the Program</li>
								<li>the possibility that the Program is not suitable for
									you at a particular point in time.</li>
							</ol>
							<br>
							<p>
								<strong>External links</strong>
							</p>
							<p>Links to external websites on the Program are provided for
								easy access to various sources of information for your
								convenience only. Such links do not constitute or imply an
								endorsement, sponsorship, or recommendation by NIMHANS of the
								third party, the third-party website, or the information
								contained therein. You acknowledge and agree that the NIMHANS or
								PUSH-D Team is not responsible for the availability of any such
								site and that it does not endorse or warrant, and is not
								responsible or liable for, any such website, its content, its
								privacy policy or practices, or the acts or omissions of its
								operators. PUSH-D makes no warranty and accepts no
								responsibility or liability in relation to any information,
								products, services or advice provided by these external links
								and any views or recommendations provided in linked websites do
								not necessarily represent those of PUSH-D. You acknowledge that
								you enter any third party websites at your own risk.</p>
							<br>
							<p>
								<strong>Copyright </strong>
							</p>
							<p>NIMHANS and the PUSH-D team respect the intellectual
								property rights of others. If you believe that your work has
								been copied in a way that constitutes copyright infringement,
								please provide the following information in writing to us</p>
							<ul>
								<li>A physical or electronic signature of a person
									authorized to act on behalf of the owner of the copyright.</li>
								<li>A description of the copyrighted work that you claim
									has been infringed.</li>
								<li>A description of the material that you claim to be
									infringing or to be the subject of infringing activity and that
									is to be removed or access to which is to be disabled, and
									information sufficient to permit us to locate the material.</li>
								<li>Information so that we can contact you, such as
									address, telephone number and e-mail address.</li>
								<li>A statement that you have a good faith belief that use
									of the material in the manner complained of is not authorized
									by the copyright owner, its agent, or the law.</li>
								<li>A statement that the information in the notification is
									accurate that you are the copyright owner or are authorized to
									act on behalf of the owner of a copyright that is allegedly
									infringed.</li>
							</ul>
							<p>Upon the receipt of a proper notice of claimed
								infringement, we shall respond at the earliest to resolve the
								claim between the notifying party and the alleged infringer who
								provided the content in issue, including, where applicable,
								removing, or disabling access to content claimed to be
								infringing or by removing or disabling access to links to such
								content.</p>
							<br>
							<p>
								<strong>Your obligations</strong>
							</p>
							<p>You are solely responsible for any content or material
								which you post or upload on the Program, or which is posted by
								another person using your user name or password. PUSH-D excludes
								all liability (to the extent permitted by law) for any loss,
								damage or expenses suffered by you or claims made against you
								arising from content or material which you post or upload on the
								Program, or which is posted by another person (whether using
								your username or password or otherwise).</p>
							<br>
							<p>
								<strong>Use of the website</strong>
							</p>
							<ul>
								<li>You agree not to use the website for unlawful purposes,
									and you agree to comply with all applicable laws, rules and
									regulations while using the website.</li>
								<li>You agree not to use the website for any commercial
									purposes, including any advertisement, commercial solicitation,
									or promotion of any specific goods or services.</li>
								<li>You agree not to collect or use any information or
									other data available via the website inappropriately.</li>
								<li>You may not distribute, modify, copy (except as set
									forth in these Terms of Use), transmit, display, reuse,
									reproduce, publish, license, create derivative works from,
									transfer, translate, sell, reverse engineer, decompile or
									disassemble, or otherwise use the website or the Content (as
									defined herein), except as specifically authorized in the Terms
									of Use, without written permission from NIMHANS..</li>
								<li>You agree not to use the website to post or transmit
									any threatening, harmful, false, misleading, abusive,
									harassing, libelous, defamatory, vulgar, obscene, scandalous,
									inflammatory, pornographic, or profane material or any material
									that could constitute or encourage conduct that would be
									considered a criminal offense, give rise to civil liability, or
									otherwise violate any law.</li>
								<li>You agree not to use the website to advertise or
									perform any commercial solicitation, or otherwise exploiting
									for any commercial purposes any portion of, use of or access to
									the website.</li>
								<li>You agree not to incorporate any code into the code of
									the website or to use the website to post or transmit any
									virus, worm, Trojan Horse, time bomb, spyware, bot, tracking
									device, screen scraping software or other computer code, file
									or program that is harmful or invasive or is intended to damage
									or hijack the operation of, or to monitor the use or operation
									of the Site or any user of the website.</li>
								<li>You agree not to use the website in conjunction with
									any screen scraping software.</li>
								<li>You agree not to restrict or inhibit any other person
									from use of the website. You agree not to interfere with or
									disrupt the operation of the website or the servers or networks
									used to make the website available, or violate any
									requirements, procedures, policies or regulations of such
									networks.</li>
								<li>You agree not to use the website to harvest or collect
									personally identifiable information about users of the Site.</li>
								<li>You agree not to use the website to disrespect the
									privacy or views of others.</li>
								<li>You agree not to use the website to impersonate another
									person or supply false information about yourself or another
									person.</li>
								<li>You agree not to allow any other person or entity to
									use your identification to post or view comments, or to
									otherwise access or use the website.</li>
								<li>You agree not to post material on the website that
									infringes on the copyright or other intellectual property
									rights of others, or the privacy, publicity, or other personal
									rights of others.</li>
							</ul>
							<br>
							<p>
								<strong>Your Suggestions</strong>
							</p>
							<p>We appreciate your feedback or other suggestions about the
								website, the Service and the Content, but you understand that we
								may use your feedback or other suggestions without any
								obligation to compensate you for them.</p>
							<p>For any queries or suggestions or complaints, you may
								contact: push.d.nimhans@gmail.com</p>
							<br>
							<p>
								<strong>Last Updated on : 1 July 2018 </strong>
							</p>
							<hr>
							<p>
								I agree to the terms
								<button id="agree" type="button" class="btn btn-success"
									onclick="agreeButton()">Agree & Continue</button>
							</p>
							<p>Contact Us : push.d.nimhans@gmail.com</p>
						</div>
						<br>
						<div class="col-md-4" align="right">

							<a href="#" id="chk1" class="btn btn-info btn-block text-center"
								style="text-decoration: none; margin-top: 0px; padding-top: 15px; padding-bottom: 15px;"
								onclick="next()">N E X T &emsp;</a> <a disabled id="chk0"
								class="hidden btn btn-info btn-block text-center"
								data-toggle="tooltip" data-placement="bottom"
								title="You should agree to the terms first"
								style="text-decoration: none; margin-top: 0px; padding-top: 15px; padding-bottom: 15px;"
								onclick="next()">N E X T &emsp;</a> <a href="baseline.jsp"
								id="chk2" class="hidden btn btn-info btn-block text-center"
								data-toggle="tooltip" data-placement="bottom"
								title="You can now start your journey"
								style="text-decoration: none; margin-top: 0px; padding-top: 15px; padding-bottom: 15px;">
								N E X T &emsp;</a> <a href="redirect.jsp" id="chk3"
								class="hidden btn btn-info btn-block text-center"
								data-toggle="tooltip" data-placement="bottom"
								title="You can resume from your current section"
								style="text-decoration: none; margin-top: 0px; padding-top: 15px; padding-bottom: 15px;">
								N E X T &emsp; </a>


						</div>
					</div>


				</div>

			</div>
			<br> <br> <br>
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
<div class="segment_header" style="width:auto;text-align:Center;"><h1 style="font-size:24px;font-family:'Arvo',serif;padding:20px 1em ;">ARE YOU DEPRESSED?</h1><h4 style="font-family:'Arvo',serif;padding:10px 1em ;">PLEASE CHECK IT OUT HERE.</h4></div>
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
				<p>If you are experiencing depressive symptoms, apart from consulting a mental health professional, you can do something to help yourself too!</p>
				<p>PUSH-D is an internet based self-care program. It is like an online self-help course. </p>
				<p>If you are interested to register for this program and ready to spend time to help yourself, you can contact us for an initial detailed evaluation.</p>
				<p>The initial evaluation can be done face to face/ over email. . </p><p>If the PUSH-D program is found suitable for you, you will be issued the user name and password for registering into the program.</p>
				<p>If you are interested, you can connect to us for initial evaluation, by</p>
				<p>Sending us a mail at <a href="Mailto:push.d.nimhans@gmail.com">push.d.nimhans@gmail.com</a></p>
				<!-- <p>Or</p>
				 <p>Sending us an SMS to 9620638249</p>-->
				<p>Please provide your phone number in your Mail for a quick connect and clarifications</p>
				</div>
				<div class="modal-footer">
					<button id="myInput" type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
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
			var ctx1 = document.getElementById("myChart1").getContext("2d");

			var pieData = [ {
				value : 40,
				color : "#FDB45C",
				highlight : "#FFC870",
				label : "Completed"
			}, {
				value : 60,
				color : "#F7464A",
				highlight : "#FF5A5E",
				label : "Remaining"
			} ];

			var options = {
				//Boolean - Whether we should show a stroke on each segment
				segmentShowStroke : true,

				//String - The colour of each segment stroke
				segmentStrokeColor : "#fff",

				//Number - The width of each segment stroke
				segmentStrokeWidth : 3,

				//Number - The percentage of the chart that we cut out of the middle
				percentageInnerCutout : 70, // This is 0 for Pie charts

				//Number - Amount of animation steps
				animationSteps : 100,

				//String - Animation easing effect
				animationEasing : "easeOutBounce",

				//Boolean - Whether we animate the rotation of the Doughnut
				animateRotate : true,

				//Boolean - Whether we animate scaling the Doughnut from the centre
				animateScale : false,

			}

			$(document).ready( function() {

								var myPieChart = new Chart(ctx1).Pie(pieData,
										options);
								
								$.ajax({
											type : "GET",
											url : serverURL + "users/" + userId,
											success : function(data) {
                                                 console.log("data--"+data);
												$("#user-name").append(
														data['fname']);
												$('#chk0').addClass("hidden");
												if (data['agreed'] == "true") {
													$("#agree").prop(
															"disabled",
															"disabled");
													$('#list0').removeClass(
															"btn-primary");
													

													for (i = 0; i <= 3; i++) {
														$('#list' + i).prop(
																"disabled",
																false);
														$('#glyph' + i)
																.removeClass(
																		'fa fa-circle-o');
														$('#glyph' + i)
																.addClass(
																		"fa fa-dot-circle-o");
														$('#glyph' + i).css(
																'color',
																'green');
													}
													count = 4;

													$('#chk').attr("title",
															"Hello");

													if (data['checkpoint'] == "true") {
														$('#chk1').addClass(
																"hidden");
														$('#chk0').addClass(
																"hidden");
														$('#chk2').addClass(
																"hidden");
														$('#chk3').removeClass(
																"hidden");

														$.ajax({
																	type : "GET",
																	url : serverURL
																			+ "users/"
																			+ userId
																			+ "/currSubSection",
																	success : function(data) {

																		sectionId = data['currentSection'];
																		if(sectionId == '11' && data['currentSubSection'] == '0'){
																			
																			$.cookie("sectionId",1);
																			$.cookie("subsectionId",0);
																			
																		}else{
																			
																			$.cookie("sectionId",sectionId);
																			$.cookie("subsectionId",data['currentSubSection']);
																			
																		}

																		

																	},
																	error : function() {
																		alert("Error occured due to "
																				+ serverURL
																				+ "users/"
																				+ userId
																				+ "/currSubSection");
																		
																	}
																});
													} else {
														$('#chk1').addClass(
																"hidden");
														$('#chk0').addClass(
																"hidden");
														$('#chk2').removeClass(
																"hidden");
														$('#chk3').addClass(
																"hidden");
													}
												}
											},
											error : function() {
												alert("Error: server encountered an internal error. Please try again after some time ");
												
											}
										});
							});

			var count = 0;

			function next() {
				j = count;
				if (j < 3) {

					for (i = 0; i <= count; i++) {
						$("#list" + i).removeClass("btn-primary");
						$("#list" + i).addClass("btn-default");
						$('#' + i).addClass("hidden");
						
						$('#list' + i + ">i").css("color", "green");
					}

					$("#list" + j).removeClass("btn-primary");
					$("#list" + j).addClass("btn-default");
					$('#glyph' + j).removeClass('fa fa-circle-o');
					$('#glyph' + j).addClass('fa fa-dot-circle-o');
					$('#glyph' + j).css('color', 'green');
					$('#' + j).addClass("hidden");
					j = j + 1;
					$('#' + j).removeClass("hidden");
					$("#list" + j).prop("disabled", false);
					$("#list" + j).addClass("btn-primary");
					count = j;
				}
				if (j == 3) {
					$('#chk1').addClass("hidden");
					$('#chk0').removeClass("hidden");
				}

			}

			function showContent(id) {

				for (i = 0; i <= count; i++) {
					$("#list" + i).removeClass("btn-primary");
					$("#list" + i).addClass("btn-default");
					$('#' + i).addClass("hidden");
					
					$('#list' + i + ">i").css("color", "green");
				}
				$('#' + id).removeClass("hidden");
				$("#list" + id).prop("disabled", false);
				$("#list" + id).addClass("btn-primary");
				$('#list' + id + ">i").css("color", "white");
			}

			function agreeButton() {

				$.ajax({
					type : "POST",
					url : serverURL + "users/" + userId + "/true",
					success : function(data) {
						location.reload();
					},
					error : function() {
						alert("Error: server encountered an internal error. Please try again after some time ");
						
					}
				});
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
					alert("please complete all fieldes")
					
					return
				}else{
				$('#myModal').modal("show");
				}
				
				
				
				$.ajax({
					  type: "POST",
					  url: serverURL + "users/responce?user_id="+userId+"&screener_flag="+1,
					  
					  data: formData,
					 
					  success: function(data) { 
						  
						
					  },
					  error: function() {
						  alert("Error: server encountered an internal error. Please try again after some time ");
						  
					  }
				});
				
				
				
				
				
			}
		</script>

	</div>
</body>
</html>