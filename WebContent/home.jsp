<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Home</title>

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
    <script src="bs/js/jquery.session.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
	<script src="bs/js/bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
 	<script src="js/values.js"></script>
    <script src="css/style.css"></script>
    <style type="text/css">
    	.image { 
		   position: relative; 
		   width: 100%; /* for IE 6 */
		}
		
		h2 { 
		   position: absolute; 
		   top: 70px; 
		   right: 0%;
		   width: 100%;
		   text-align: right; 
		}
    </style>
    <script type="text/javascript">
	
     	history.forward();
	    
    	$(function(){
		    $("#header").load("navHeader.html"); 
	        $('[data-toggle="tooltip"]').tooltip();
	    });	
	
    	$(function() {
			
		    $("h2")
		        .wrapInner("<span>")

		    $("h2 br")
		        .before("<span class='spacer'>")
		        .after("<span class='spacer'>");

		});
    	
	</script>
 </head>
 <body class="bgcolor">
	<div id="header">
	</div>
	
	<div id="smiley">
	</div>

	<div class="container-fluid" style="height: 100%">
		<div class="row">
			
			 <div class="col-md-2">
				<button id="list0" class="btn btn-default btn-block active"
					style="text-align: left; padding-left: 20px;"
					onclick="showContent(0)">
					&emsp;Overview
				</button>
				<button id="list1"
					class="btn btn-default btn-block"
					style="text-align: left; padding-left: 20px;"
					onclick="showContent(1)">
					&emsp;Sign Boards
				</button>
				<button id="list2"
					class="btn btn-default btn-block"
					style="text-align: left; padding-left: 20px;"
					onclick="showContent(2)">
					&emsp;Tips for completion
				</button>
				<button id="list3"
					class="btn btn-default btn-block"
					style="text-align: left; padding-left: 20px;"
					onclick="showContent(3)">
					&emsp;Terms of use
				</button>
			</div>
			<div class="col-md-10">
				<div class="col-md-8">
					<h3 style="font-family: alegreya">Welcome &emsp;<strong class="text-capitalize" id="user-name"></strong></h3>
				</div>
				<div class="col-md-4">
					
				</div>
				<div class="clearfix"></div>
				<br>
				<div class="col-md-10" id="0">
					<p>The entire program is divided into two broad areas: Essential and optional.</p>
					<p>The <strong>essential zone</strong> contains sections which are mandatory for you to complete. These follow a pre-designed sequence. These sections cover techniques/approaches that are commonly useful for most individuals dealing with depression.</p>
					<p>On the other hand, as the name indicates, <strong>optional zone</strong> contains sections which are not mandatory to explore /go over. You can decide to go through an optional zone section depending on your need or preference.</p>
					<br>
					<div class="image">
						<img alt="" src="images/path.png" width="1024px;"
							height="450px;" class ="img-responsive">
						<h2>
							<a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#showmoreModal">Show More</a>
						</h2>
						<!-- <h2><a href="#" class="btn btn-primary">Show More ...</a> </h2> -->
					</div>
				</div>
				<div class="modal fade" id="showmoreModal" role="dialog" >
					<div class="modal-dialog modal-lg" >
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header modal-header-success" align="center">
								<h3 ><b>Essential zone sections</b></h3>
							</div>
							<div class="modal-body text-justify opensans">
								<b> Understand depression</b>
								<br> 
								Check your beliefs
								about depression, bust myths, listen to a story of a
								depressed person, and recognize depressive symptoms<br>
								<br>
								<b>Enhance Self-Care Motivation</b>
								<br> 
								Anticipate
								motivational blocks to complete this self -care program
								and empower yourself with strategies to keep your
								motivation up<br> 
								<br>
								<b>Activate</b>
								<br> 
								Learn
								about utility of behavioral-activation for depression,
								systematically plan and monitor your engagements<br>
								<br>
								<b>Learning to deal with thoughts to influence
									feelings! </b>
								<br> 
								Learn to recognize thinking-errors
								that are common in depression and substitute unhelpful
								thoughts with more helpful ones<br> 
								<br>
								<b>Manage Excessive Worries</b>
								<br> 
								Learn to handle excessive
								worries <br> 
								<br>
								<b>Learn Self-compassion </b>
								<br>
								Recognize the problems with self-criticality, the utility
								of self-compassion and work on ways to cultivate a
								self-compassionate stance<br> 
								<br>
								<b>Strengthen self-soothing skills</b>
								<br> 
								Self-soothing is a vital
								skill that helps in managing intense negative emotions.
								Identify self-soothing practices for use<br> 
								<br>
								<b>Regain a sense of mastery</b>
								<br> 
								Manage the sense of feeling
								overwhelmed by multiple problems and regain a sense of
								mastery<br> 
								<br>
								<b>Harness the power of support</b>
								<br>
								Identify and overcome your mental barriers to seeking
								support for managing your depression<br> 
								<br>
								<b>Step-Up</b>
								<br> 
								Learn to recognize when self-help alone is
								insufficient, manage your psychological barriers to
								reaching out for professional help for depression.<br>

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
					<div class="row">
						<h4 class="text-center"> YOUR JOURNEY:  FAMILIARIZING YOURSELF WITH THE SIGNBOARDS ALONG YOUR PATH</h4>
						<p>This program is all about a journey - a journey to learn about self-care for dealing with depression and maintaining well-being. It is important that you familiarize yourself with the signboard you would come across during the entire program.</p>
						<p>Treat the various sections in the different zones as a series of driving lessons with space for gaining new information, discovering your strengths and weaknesses, watching a demonstration and of course practicing your skills. </p>
						<strong>Here are the various sign boards that you would come across in your self-care journey:</strong>
						<br>
						<br>
					</div>
					<div class="row">
						<div class="col-md-4">
							<img class="img-responsive" src="images/ss-kp.jpg"
								alt="...">
						</div>
						<div class="col-md-8">
							<h4 class="media-heading">Knowledge Point</h4>
							This is the place where you can find information about a
							concept/technique that is introduced usually at the
							beginning of a section. It is a place where you learn why
							some concept /strategy is relevant for self-care for
							depression. Don't skip this basic step, even though you may
							feel like jumping to other steps.
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<img class="img-responsive" src="images/ss-dp.jpg"
								alt="...">
						</div>
						<div class="col-md-8">
							<h4 class="media-heading">Discovery Point</h4>
							It is a point where you learn/discover something about
							yourself, usually through completing an exercise.
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<img class="img-responsive" src="images/ss-tb.jpg"
								alt="...">
						</div>
						<div class="col-md-8">
							<h4 class="media-heading">Tool Box</h4>
							In the tool box, you can find a listing of different
							methods/ways /ideas to go about doing something that would
							help you to deal with depressive symptoms.
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<img class="img-responsive" src="images/ss-dmp.jpg"
								alt="...">
						</div>
						<div class="col-md-8">
							<h4 class="media-heading">Demo Point</h4>
							Similar to a journey one might undertake for learning to
							drive, this is a point where we demonstrate ‘how’ to do
							something using an example.
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<img class="img-responsive" src="images/ss-pp.jpg"
								alt="...">
						</div>
						<div class="col-md-8">
							<h4 class="media-heading">Practice Point</h4>
							Knowledge point and tool box as well as demo point may be
							of little help unless you make efforts to apply what you
							have learnt to your situation. Practice point is the point
							wherein you try to apply what you learnt to make the
							learning personally relevant and beneficial.
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<img class="img-responsive" src="images/ss-chkp.jpg"
								alt="...">
						</div>
						<div class="col-md-8">
							<h4 class="media-heading">Check Point</h4>
							These are for periodic monitoring of how you have been
							feeling. Keeping track of your feelings at periodic
							intervals helps us and helps you to track your journey and
							also gauge if you need some additional/different kind of
							support system.
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4 text-center">
							<canvas id="myChart1" width="200" height="200"></canvas>
                		</div>
						<div class="col-md-8">
							<h4 class="media-heading">Progress Tracker</h4>
							Learning anything new often involves ups and downs with
							gradual incline rather than a steady upward movement. It is
							useful to keep track of our efforts during our journey of
							learning. It can help us to push ourselves a little bit
							more when we see ourselves as not moving sufficiently or
							remind ourselves that we are doing alright and we need to
							appreciate ourselves and keep going. <br> Progress
							tracker focuses on your efforts and not on outcomes. This
							is because, focusing on efforts (rather than worrying about
							and waiting for outcomes) and rewarding ourselves for
							making small efforts is the best approach to motivate
							ourselves.
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="col-md-11 hidden text-justify" id="2">
					<br>
					<p>
						<strong>Our Strong Recommendations and TIPS for you
							about completing PUSH-D program:</strong>
					</p>
					<ul style="list-style-type: square;">
						<li><strong>Total duration : </strong>For maximum
							benefits, we recommend that you make all attempts to
							complete the program within 1.5 months of registering for
							the same.</li>
						<li><strong>Frequency of engaging with the
								program/number of slots per week : </strong>Regularity and
							continuity are critical for deriving benefit of this
							self-care program.</li>
						<li>We suggest you to keep aside at least two slots on
							two different weekdays (non-consecutive day, e.g. Monday
							and Thursday rather than Monday and Tuesday) for working on
							this program. This way, you are likely to finish the
							program in about one and half months to two months at the
							most.</li>
						<li><strong>Your slot is your session : </strong>A slot
							here refers to a continuous time period during which you go
							over the contents of the program and complete the exercises
							contained therein. A slot is similar to a session that
							people might have with a therapist/counsellor in
							face-to-face interactions.</li>
						<li><strong>Slot-duration : </strong>As this is a
							self-care program, we recommend you to keep each slot for
							minimum 20 minutes and maximum up to 45 minutes.</li>
						<li><strong>Time-estimates for various
								sections : </strong>We have provided a rough estimate of the time
							required to complete each section, which may help you to
							plan as you move from one section to the next. <br>If
							you were just mechanically/passively reading the content
							under each of the sections, you might just finish it in a
							very short period of time. But, this may not be of much
							use! <br>We would want you to take your time to think
							about what you are reading as well as during the interval
							period between slots when you are trying to apply what you
							read. <br>We encourage you to go over the content in
							each section at least one more time after you have gone
							over it once. This is similar to what happens in direct
							face to face sessions with a therapist, wherein a few key
							ideas may be discussed in more than one session so that you
							can consolidate your learning and see its personal
							relevance. <br>In the time-estimates and the
							recommended number of sessions provided at the start of
							each section take in account the time needed to go over the
							section more than once.</li>
						<li><strong>Apply and Practice : </strong>You will
							derive maximum benefit when you try to apply and practice
							what you discover /learn during your sessions. We recommend
							that you use your workbook and complete various exercises
							and keep a record of how you apply in your daily life
							whatever you learn in the program.</li>
						<li><strong>Schedule your next slot and
								receive a mobile reminder : </strong>At the end of each slot, you
							have the facility of scheduling your next slot for
							yourself. A mobile prompt will be sent as a reminder to you
							on the day you have scheduled the next slot.</li>
						<li><strong>Tele-Assist : </strong>We will also be
							making telephonic calls on once a week basis to help you in
							completing this self-care program. <br>These calls
							will be made on pre-decided days and timings that would be
							discussed with you in advance, during the evaluation
							session. <br>These calls would be brief (lasting 15-20
							minutes) and are NOT meant to substitute the self-care
							program/ face to face sessions with a professional. These
							are merely meant to keep up your motivation to make efforts
							to help yourself as well as to discuss any problems being
							faced during the program completion. These calls will also
							help us determine if you might require a different form of
							treatment if your symptoms have changed/increased in
							severity and advise you accordingly.</li>
						<li><strong>Connect over email : </strong>You may
							choose to drop us a mail to clarify your doubts regarding
							the program exercises etc. Such e- mails would be responded
							to within three working days.</li>
					</ul>
				</div>
				<div class="col-md-11 hidden text-justify" id="3">
					<p>
						<strong>The delimited scope and purpose of the
							Push-D program</strong>
					</p>
					<p>The Information contained in, or accessed through,
						this website is for your general information and
						Self-development use only and is not intended to be used as
						medical advice and should not be used to diagnose, treat,
						cure or prevent any medical condition.</p>
					<p>The diagnosis and treatment of clinical depression and
						anxiety requires a medical practitioner or qualified mental
						health practitioner. People seeking a diagnosis or treatment
						of depression, anxiety or other mental health disorders
						should consult a medical practitioner or mental health
						professional. The Site is not designed to "treat" common
						mental health disorders. It is merely designed to help
						people to help themselves to cope better with depressive
						symptoms. In a general sense, people are likely to find the
						information on self-care to be useful; however this is NOT a
						substitute for seeking professional consultation and advice.
						There is no claim made that the material contained on this
						site is likely to be of help for everyone who uses this
						site.</p>
					<p>If you have a mental health condition or if you are
						likely to have a diagnosis of mental health condition, you
						should seek professional consultation from a trained mental
						health professional or a medical consultant.</p>
					<p>If at the time of registering for this self-care
						program or at any point of time after registering for this
						self-care program, you notice that you are getting thoughts
						about harming yourself or harming another person, you should
						not use or continue to use this Program but instead should
						seek urgent medical advice. If Push-D becomes aware that you
						are experiencing suicidal thoughts or thoughts of harming
						yourself or any other person in any way, it would strongly
						recommend you to immediately seek medical help through a
						direct/face-to face contact with any trained professional of
						your choice. If you so desire, the Push D team will try its
						best to provide you some information regarding the
						availability of centers/ trained mental health professional
						in your region , if such information is available to the
						Push D team.</p>
					<p>We strongly recommend that you always seek the advice
						of a medical practitioner or qualified mental health
						practitioner for any questions regarding personal health or
						medical conditions. We strongly recommend that you never
						disregard, avoid or delay in obtaining medical advice from
						your medical practitioner or qualified mental health
						practitioner because of something you have read on this
						Site.</p>
					<p>If you think you may have a medical emergency, call a
						local help line /reach out to an emergency service.</p>
					<p>NIMHANS does not recommend or endorse any specific
						tests, providers (including, but not limited to, hospitals
						and physicians), products, procedures, or other information
						that may be mentioned on the Site. Any opinions expressed on
						the Site are the opinions of the individual authors, not of
						NIMHANS.</p>
					<p>The few questionnaires available on this web site are
						intended solely for the purpose of identifying the anxiety
						and depressive symptoms or giving you a rough idea of a
						particular issue and are not designed to provide a
						diagnosis.</p>
					<p>You represent and warrant that you are at least 18
						years of age or older. Persons under age 18 with depressive
						symptoms are advised to talk with their parents/guardians
						about getting direct help from a qualified mental health
						professional/medical professional.</p>
					<p>By accessing and using the Site, or any portion of the
						Site, you agree to be bound by each of the Terms of Use and
						all applicable laws and regulations governing the Site. If
						you do not agree with any of the Terms of Use, you are not
						authorized to access or use the Site for any purpose. We
						reserve the right to modify these Terms of Use at any time.
						Your use of the Site following any such modification
						constitutes your agreement to follow and be bound by the
						Terms of Use as modified.</p>
					<br>
					<p>
						<strong>Fees, charges and cancellation</strong>
					</p>
					<p>There is no fee or charge for you to register with the
						PUSH-D. However, if you access the Program through the use
						of a mobile phone or the Internet, your normal
						phone/Internet charges will apply.</p>
					<p>There is no minimum contract associated with the use
						of PUSH-D. You may choose to stop using the Program at any
						time.</p>
					<br>
					<p>
						<strong>License to Use</strong>
					</p>
					<p>The information and materials on the web site unless
						otherwise stated, are copyrighted by the National Institute
						for Mental Health and Neuro Science (NIMHANS), and may be
						used by registered users solely for their own personal use.
						We grant you a limited, personal, non-exclusive,
						non-transferable license to use our content for your own
						personal, non-commercial use. Except as otherwise provided,
						you acknowledge and agree that you have no right to modify,
						edit, copy, reproduce, create derivative works of, reverse
						engineer, alter, enhance or in any way exploit any of the
						content in any manner, except for modifications in filling
						out the forms for your authorized use. You shall not remove
						any copyright notice from any page/form.</p>
					<br>
					<p>
						<strong>Disclaimer of Warranties</strong>
					</p>
					<p>You agree to assume total responsibility and risk for
						your use of the site, the service and the content. We make
						no express or implied warranties, representations or
						endorsements whatsoever with respect to the site, the
						service or the content. We expressly disclaim all
						warranties, including, but not limited to, implied
						warranties of merchantability, fitness for a particular
						purpose, title and non-infringement with regard to the site,
						the service, and the content. We do not warrant that the
						functions performed by the site or the service will be
						uninterrupted, timely, secure or error-free, free of viruses
						or other malicious code, or that defects in the site/server
						or the service will be corrected. We do not warrant the
						accuracy, currency, or completeness of the content, or that
						any errors in the content will be corrected. We reserve the
						right to correct any errors, inaccuracies or omissions and
						to change or update information at any time without prior
						notice. We do not, however, guarantee that any errors,
						inaccuracies or omissions will be corrected.The site, the
						service and the content are provided on an “as is” and “as
						available” basis. The foregoing does not affect any
						warranties which cannot be excluded or limited under
						applicable law.</p>
					<br>
					<p>
						<strong>Disclaimer of liability</strong>
					</p>
					<p>
						You understand and agree that under no circumstances we will
						be liable for any damages whatsoever, including, but not
						limited to direct, indirect, incidental, consequential, or
						punitive damages arising out of the use of or inability to
						use the site, the service, or the content. If you are
						dissatisfied with the site, the service, the content, or the
						terms of use, your sole and exclusive remedy is to
						discontinue using the site. You acknowledge, by your use of
						the site, that your use of the site is at your sole risk. <strong>We
							are not liable to any user or person for any decision made
							or action taken in reliance upon information or content
							displayed or provided in this site.</strong> It is your
						responsibility to make your own decisions about the
						currency, completeness, accuracy, reliability and
						suitability of information, services, programs and
						communities of interest contained in (or accessible from)
						linked websites.
					</p>
					<br>
					<p>
						<strong>Security, viruses, errors and availability</strong>
					</p>
					<p>The internet is an insecure public network which means
						there are risks that information sent to or from this
						website may be intercepted, corrupted or modified by third
						parties. In addition, files obtained from or through this
						website may contain computer viruses, disabling codes, worms
						or other devices or defects. You bear the risks and
						responsibility for any loss or damage caused, directly or
						indirectly, by these risks and we accept no liability for
						any interference with, or damage to, your computer system,
						software or data occurring in connection with this Website.</p>
					<br>
					<p>
						<strong>Use of cookies</strong>
					</p>
					<p>
						<strong>The site uses transient or session cookies.
						</strong>Cookies are pieces of information that a website transfers
						to your computer's hard disk when you open the program
						pages. Cookies by themselves do not identify you or any user
						but they do identify your browser. Because this Site uses
					    "transient" cookies, your computer does not retain the
						information delivered in the cookie once you leave the site.
						When you log out, the transient cookie set up by the Site is
						destroyed, and no personal information is retained which
						could identify you or your browser next time you log on to
						the Site. Most web browsers are set up to accept cookies,
						and while you can set your browser to not accept cookies you
						will not be able to use this Site if you do this.
					</p>
					<p>The Site may impose limits on the size of files
						uploaded by the users into their workbook. We may also
						filter, remove or refuse to post files which interfere with
						the technical operations of the program, including files
						which threaten to overload or crash a system.</p>
					<br>
					<p>
						<strong>Privacy</strong>
					</p>
					<p>This statement sets out the National Institute for
						Mental Health and Neuro Sciences policy relating to the
						collection and use of your personal information in the
						PUSH-D Program. This Notice is in addition to the Terms of
						Use. Your registration as a PUSH-D user constitutes your
						agreement to terms of the Privacy Notice and the Terms of
						Use.</p>
					<p>Please note that this Privacy Notice applies only to
						the PUSH-D site and not to any other sites that are linked
						to the PUSH-D site or mentioned on the site.</p>
					<br>
					<p>
						<strong>Your personal information is important to
							us</strong>
					</p>
					<p>NIMHANS recognizes that your privacy is very important
						to you and that we are under a legal and ethical obligation
						to protect the integrity of your personal information. When
						you register with PUSH-D you will be asked to enter your
						username. We suggest that you use a pseudonym or a made-up
						username, your username or your browser details to any
						advertisers.</p>
					<br>
					<p>
						<strong>Why the program collects personal
							information from you</strong>
					</p>
					<p>When you enter the PUSH-D Program you will be asked to
						complete a number of tests and enter some information, which
						you may consider to be sensitive, about yourself. The
						program asks for this information in order to provide you
						with tailored and specifically relevant information about
						stress, anxiety and depression. The information is stored in
						your workbook in the PUSH-D database along with information
						about the date and time you complete each exercise.
						Information is also collected in summary form about most
						frequently visited pages. This is intended to help the
						PUSH-D designers understand how visitors use the Program.
						All the information gathered is stored on the NIMHANS server
						and is subject to stringent security measures.</p>
					<ul>
						<li>We will not use or disclose any information about
							you without your consent unless we are required to do so by
							law;</li>
						<li>We will never use your personal information to send
							you unsolicited information or "spam".</li>
					</ul>
					<p>Like most Internet sites, this Site is accessible
						worldwide. However, not all products or Services are
						available to all persons or in all geographic locations.
						PUSH-D reserves the right to limit the provision of its
						products and Services to any person, geographic area, or
						jurisdiction. This Site is not intended for use outside
						India and its content may not be most appropriate for those
						residing outside the country. You agree to comply with all
						applicable laws and local rules or restrictions relating to
						this Site.</p>
					<br>
					<p>
						<strong>Risks and benefits</strong>
					</p>
					<p>PUSH-D offers a set of tools and techniques which aim
						to benefit users by;</p>
					<ol style="list-style-type: lower-alpha;">
						<li>Helping them to better understand their sad mood</li>
						<li>Helping them to better understand the things
							(situations) that trigger their sad mood or anxious
							mood/stress.</li>
						<li>Providing suggestions for minimizing the triggers,
							and coping with and managing the symptoms of mild levels of
							sadness</li>
						<li>Providing (interactive) self-help instruction and
							guidance and exercises for managing depressive symptoms of
							low severity. The suggestions are based on the available
							research literature and commonly used psychological
							principles in management of depression.</li>
					</ol>
					<p>PUSH-D does not 'treat'�� you, or replace treatment
						provided by a health and/or mental health professional.</p>
					<p>Therefore, there are risks associated with its use,
						including;</p>
					<ol style="list-style-type: lower-alpha;">
						<li>the possibility that your symptoms persist while
							using the Program</li>
						<li>the possibility that your symptoms worsen while
							using the Program</li>
						<li>the possibility that new symptoms or health
							conditions develop while using the Program</li>
						<li>the possibility that the Program is not suitable
							for you at a particular point in time.</li>
					</ol>
					<br>
					<p>
						<strong>External links</strong>
					</p>
					<p>Links to external websites on the Program are provided
						for easy access to various sources of information for your
						convenience only. Such links do not constitute or imply an
						endorsement, sponsorship, or recommendation by NIMHANS of
						the third party, the third-party site, or the information
						contained therein. You acknowledge and agree that the
						NIMHANS or PUSH-D Team is not responsible for the
						availability of any such site and that it does not endorse
						or warrant, and is not responsible or liable for, any such
						site, its content, its privacy policy or practices, or the
						acts or omissions of its operators.PUSH-D makes no warranty
						and accepts no responsibility or liability in relation to
						any information, products, services or advice provided by
						these external links and any views or recommendations
						provided in linked sites do not necessarily represent those
						of PUSH-D. You acknowledge that you enter any third party
						websites at your own risk.</p>
					<br>
					<p>
						<strong>Copyright </strong>
					</p>
					<p>NIMHANS and the PUSH-D team respect the intellectual
						property rights of others. If you believe that your work has
						been copied in a way that constitutes copyright
						infringement, please provide the following information in
						writing to us</p>
					<ul>
						<li>A physical or electronic signature of a person
							authorized to act on behalf of the owner of the copyright.</li>
						<li>A description of the copyrighted work that you
							claim has been infringed.</li>
						<li>A description of the material that you claim to be
							infringing or to be the subject of infringing activity and
							that is to be removed or access to which is to be disabled,
							and information sufficient to permit us to locate the
							material.</li>
						<li>Information so that we can contact you, such as
							address, telephone number and e-mail address.</li>
						<li>A statement that you have a good faith belief that
							use of the material in the manner complained of is not
							authorized by the copyright owner, its agent, or the law.</li>
						<li>A statement that the information in the
							notification is accurate that you are the copyright owner
							or are authorized to act on behalf of the owner of a
							copyright that is allegedly infringed.</li>
					</ul>
					<p>Upon the receipt of a proper notice of claimed
						infringement, we shall respond at the earliest to resolve
						the claim between the notifying party and the alleged
						infringer who provided the content in issue, including,
						where applicable, removing, or disabling access to content
						claimed to be infringing or by removing or disabling access
						to links to such content.</p>
					<br>
					<p>
						<strong>Your obligations</strong>
					</p>
					<p>You are solely responsible for any content or material
						which you post or upload on the Program, or which is posted
						by another person using your user name or password. PUSH-D
						excludes all liability (to the extent permitted by law) for
						any loss, damage or expenses suffered by you or claims made
						against you arising from content or material which you post
						or upload on the Program, or which is posted by another
						person (whether using your username or password or
						otherwise).</p>
					<br>
					<p>
						<strong>Use of the Site</strong>
					</p>
					<ul>
						<li>You agree not to use the Site for unlawful
							purposes, and you agree to comply with all applicable laws,
							rules and regulations while using the Site.</li>
						<li>You agree not to use the Site for any commercial
							purposes, including any advertisement, commercial
							solicitation, or promotion of any specific goods or
							services.</li>
						<li>You agree not to collect or use any information or
							other data available via the Site inappropriately.</li>
						<li>You may not distribute, modify, copy (except as set
							forth in these Terms of Use), transmit, display, reuse,
							reproduce, publish, license, create derivative works from,
							transfer, translate, sell, reverse engineer, decompile or
							disassemble, or otherwise use the Site or the Content (as
							defined herein), except as specifically authorized in the
							Terms of Use, without written permission from NIMHANS..</li>
						<li>You agree not to use the Site to post or transmit
							any threatening, harmful, false, misleading, abusive,
							harassing, libelous, defamatory, vulgar, obscene,
							scandalous, inflammatory, pornographic, or profane material
							or any material that could constitute or encourage conduct
							that would be considered a criminal offense, give rise to
							civil liability, or otherwise violate any law.</li>
						<li>You agree not to use the Site to advertise or
							perform any commercial solicitation, or otherwise
							exploiting for any commercial purposes any portion of, use
							of or access to the Site.</li>
						<li>You agree not to incorporate any code into the code
							of the Site or to use the Site to post or transmit any
							virus, worm, Trojan Horse, time bomb, spyware, bot,
							tracking device, screen scraping software or other computer
							code, file or program that is harmful or invasive or is
							intended to damage or hijack the operation of, or to
							monitor the use or operation of the Site or any user of the
							Site.</li>
						<li>You agree not to use the Site in conjunction with
							any screen scraping software.</li>
						<li>You agree not to restrict or inhibit any other
							person from use of the Site. You agree not to interfere
							with or disrupt the operation of the Site or the servers or
							networks used to make the Site available, or violate any
							requirements, procedures, policies or regulations of such
							networks.</li>
						<li>You agree not to use the Site to harvest or collect
							personally identifiable information about users of the
							Site.</li>
						<li>You agree not to use the Site to disrespect the
							privacy or views of others.</li>
						<li>You agree not to use the Site to impersonate
							another person or supply false information about yourself
							or another person.</li>
						<li>You agree not to allow any other person or entity
							to use your identification to post or view comments, or to
							otherwise access or use the Site.</li>
						<li>You agree not to post material on the Site that
							infringes on the copyright or other intellectual property
							rights of others, or the privacy, publicity, or other
							personal rights of others.</li>
					</ul>
					<br>
					<p>
						<strong>Your Suggestions</strong>
					</p>
					<p>We appreciate your feedback or other suggestions about
						the Site, the Service and the Content, but you understand
						that we may use your feedback or other suggestions without
						any obligation to compensate you for them.</p>
					<p>For any queries or suggestions or complaints, you can
						contact us at: push.d.nimhans@gmail.com</p>
					<br>
					<p>
						<strong>Last Updated on : 16 Apr 2016</strong>
					</p>
					<hr>
					<p>
						I agree to the terms
						<button id="agree" type="button" class="btn btn-success"
							onclick="agreeButton()">Agree</button>
					</p>
					<p> Contact Us : push.d.nimhans@gmail.com</p>
				</div>
				<br>
				<br>
				<div class="row">
					<div class="col-md-8">
					</div>
					<div class="col-md-3">
						<form id="myForm" action="">
							<button id="chk" type="submit" class="btn btn-info btn-block" 
								data-toggle="tooltip" data-placement="top"
								style="text-decoration: none; margin-top: 0px; padding-top: 15px; padding-bottom: 15px;"
								title="">
								N E X T
							</button>
						</form>
					</div>
					<div class="col-md-1">
					</div>
				</div>
			</div>

			
		</div>
	</div>
	<div class="clearfix"></div>
	<br>
	<br>
	<br>
		
	<script type="text/javascript">
	
	var ctx1 = document.getElementById("myChart1").getContext("2d");
	
	var pieData = [
	            {
			        value: 40,
			        color: "#FDB45C",
			        highlight: "#FFC870",
			        label: "Completed"
			    },
	            {
	                value: 60,
	                color:"#F7464A",
	                highlight: "#FF5A5E",
	                label: "Remaining"
	            }
	        ];

	var options =
	{
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
	
	$(document).ready(function() {
	
		var myPieChart = new Chart(ctx1).Pie(pieData,options);
		
		$.ajax({
			  type: "GET",
			  url: serverURL + "users/" + userId,
			  success: function(data){
				  
		 		  $("#user-name").append(data['fname']);
	
		 		  count = 4;
		 		  
		 		  if(data['agreed'] == "true") {
					  	
		 			  $('#chk').attr("title", "You can start your journey");
		 			 
		 			  $("#agree").prop("disabled", "disabled");
		 			  
		 			  $('#myForm').attr("action", "baseline.jsp");
		 			 
					  if(data['checkpoint'] == "true") {
						  $('#chk').attr("title", "You can resume your journey");
						  $('#myForm').attr("action", "section.jsp");
					  }					  
		 		  }
		 		  else {
		 			 $('#chk').attr("title", "Please agree to the terms of use");
		 		  }
			  },
			  error: function() {
				  //alert("Error occured due to " + serverURL + "users/" + userId);
				  
			  }
		});
	});
	
	var count = 0;

	function showContent(id) {
	
		for(i=0; i<=count; i++) {
			$("#list"+i).removeClass("active");
			$('#'+i).addClass("hidden");
		}
		$('#'+id).removeClass("hidden");
		$("#list"+id).addClass("active");
	}
	
	function agreeButton() {	
		
		$.ajax({
			  type: "POST",
			  url: serverURL + "users/" + userId + "/true",
			  success: function(data){
				  location.reload();
			  },
			  error: function() {
				  alert("Error occured due to " + serverURL + "users/" + userId + "/true");
				 
			  }
		});	
	}
	
	</script>

</body>
</html>