<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" ng-app="pushd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>PUSH - D</title>

	<!-- Bootstrap -->
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/slimscroll.css" rel="stylesheet">
	
	
	
    <script src="js/angular.js"></script>
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.session.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
 
    <script src="js/inc.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
    <script>
    $(document).ready(function() {
    	//$("#research_message").modal();
    	
		$("#myBtn1").click(function() {
			$("#myModal1").modal();
		});
	});
    //ForgotPassword
    $(document).ready(function() {
    	
    	var isIE = /*@cc_on!@*/false || !!document.documentMode;
    	if(isIE){
    		
    		alert("This  website  is  currently  not  compatible  with Internet Explorer. Kindly  use  chrome/Firefox/Edge browsers.");
    		return false;
    		
    	}else{
       
				$("#myBtn2").click(function() {
					$('#myModal').modal("hide");
					$("#myModal2").modal();	
				});
    	}      
	});
	
    </script>
    
	    
    <style>



.navbar {
	padding-top: 20px;
}
.row
{
margin-left : 0px;
margin-right : 0px;
}

.navbar-default {
	border-color: transparent;

}

.nav>li>a:hover {
	
	
	border-top: 5px solid #F57C00;	/*EF6C00;	/*#b3b300;*/
	background-color: transparent;
}

.panel {
	background: transparent;
}

.carousel {
	
	position: relative;
	margin-bottom: 20px;
	line-height: 1;
	overflow: hidden;
}

ul, ol {
	padding: 0px;
}

.carousel-indicators li {
    display: block;
    float: left;
    width: 10px;
    height: 10px;
    margin-left: 5px;
    text-indent: -999px;
    background-color: rgba(255, 255, 255, 0.25);
    border-radius: 5px;
}

.carousel-indicators .active {
    background-color: #FFF;
}

.carousel .item {
	-webkit-transition: opacity 1s;
	-moz-transition: opacity 1s;
	-ms-transition: opacity 1s;
	-o-transition: opacity 1s;
	transition: opacity 1s;
}

.carousel-indicators {
	position: absolute;
	top: 15px;
	right: 15px;
	z-index: 5;
	margin: 0px;
	list-style: outside none none;
}

.carousel-control {
	position: absolute;
	top: 40%;
	left: 15px;
	width: 40px;
	height: 40px;
	margin-top: -20px;
	font-size: 60px;
	font-weight: 100;
	line-height: 30px;
	color: #FFF;
	text-align: center;
}
.carousel-control.right {
    right: 15px;
    left: auto;
	background-image: none;
}
.carousel-control.left {
    background-image: none;
}
.carousel .active.left, .carousel .active.right {
	left: 0;
	opacity: 0;
	z-index: 2;
}

.carousel .next, .carousel .prev {
	left: 0;
	opacity: 1;
	z-index: 1;
}
.carousel-inner{
  width:100%;
  height:100%;
  max-width:100%;
  max-height:100%;
}
.testimonial{
	font-style: italic;
    font-weight: bold;
}

p {
font-size: 16px;
}
#display_maildetail{
color:blue;
display:none;
}
#display_maildetail2{
color:red;
display:none;
}

#display_maildetail3{
color:red;
display:none;
}

#display_maildetail1{
color:blue;
display:none;
}

.research_class{
/* color:blue; */
color:blue;
font-style:italic;
text-align:center;
}
</style>
<script>
 <!--page views code-->
</script>
	<script>
        history.forward();
        <% request.getSession().setAttribute("USERID", null); %>
        window.addEventListener("hashchange", function() { scrollBy(0, -60) });
     
    </script>
	<script>
	
					window.onload = function() {
						if (!navigator.userAgent.match('Macintosh')) {
							var element = document
									.querySelectorAll('.slimScroll');

							// Apply slim scroll plugin
							var one = new slimScroll(
									element[0],
									{
										'wrapperClass' : 'scroll-wrapper unselectable mac',
										'scrollBarContainerClass' : 'scrollBarContainer',
										'scrollBarContainerSpecialClass' : 'animate',
										'scrollBarClass' : 'scroll',
										'keepFocus' : true
									});

							// resize example
							// To make the resizing work, set the height of the container in PERCENTAGE
							window.onresize = function() {
								one.resetValues();
							}
						} else {
							document
									.write("For Mac users, this custom slimscroll styles will not be applied");
						}
					}

					$(document).ready(function() {
						$("#spinner").hide();
						$("#spinner1").hide();
						
					    $('.carousel').carousel({interval: 7000});
					    
				  	});
				</script>
</head>

<body oncontextmenu="return false" onLoad="window.scroll(0, 0)" ng-controller="pushcontroller">
<!-- #ffff6a -->
	<nav class="navbar navbar-default transparent navbar-fixed-top" 
		style="background-color: #FFA726;  padding-top: 0px; margin-bottom: 0px; border-bottom: 5px solid #FFB74D;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="height: auto; color: white; text-decoration: none;">PUSH-D</a><!-- images/pushd.png -->	
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<!-- <div class="navbar-left" style="padding-top: 10px; color: white;" ><button type="button" class="btn btn-small btn-primary" onclick="window.location.href='form.html'">Depressed? Check here</button></div>-->
			<div class="collapse navbar-collapse"
				id="navbar-collapse-1">
				<ul class="nav nav-pills navbar-right" style="padding-top: 10px; color: white;">
					
					<li><a href="#about" style="color: white; text-decoration: none;"><strong>About</strong></a></li>
					<li><a href="#forwhom" style="color: white; text-decoration: none;"><strong>For whom</strong></a></li>
					<li><a href="#whattoexpect" style="color: white; text-decoration: none;"><strong>What to expect</strong></a></li>
					<li><a href="#team" style="color: white; text-decoration: none;"><strong>Team</strong></a></li>
					<!--<li><a href="#contact" style="color: white; text-decoration: none;"><strong>Contact Us</strong></a>  -->
					<li><a href="#" style="color: white; text-decoration: none;" data-toggle="modal" data-target="#contact"><strong>Contact Us</strong></a></li>
					<li><a  href="#myBtn1"
							id="myBtn1" style="color: white; text-decoration: none;"><strong>New user?<br>Register here</strong></a></li>
					<li><a href="#" style="color: white; text-decoration: none;" data-toggle="modal" data-target="#myModal"><strong>Login</strong></a></li>
				</ul>.
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="center-block" style="padding-top: 50px;">
		<div class="col-md-1">
		</div>
		<div class="col-md-10" style="padding-top: 20px; background-color: #FFF59D;" >
			<div id="myCarousel" class="carousel slide" style="margin-bottom: 0px;">
				<div class="carousel-inner">
					<div class="active item">
						<img src="images/slide1.jpg" class="img-responsive slider-image1" alt="" width="100%" height="auto"/>
					</div>
					<div class="item">
						<img src="images/slide.png" class="img-responsive slider-image" alt="" width="100%" height="auto" />
					</div>
				</div>
				<a class="carousel-control left" href="#myCarousel" data-slide="prev"><i class="fa fa-angle-left"></i></a>
				<a class="carousel-control right" href="#myCarousel" data-slide="next"><i class="fa fa-angle-right"></i></a>
			</div>
			
		</div>
		<div class="col-md-1">
		</div>
	</div>
<div class="row">
	<div id="body" style="padding: 20px 50px; background-color: #FFF59D"> <!--#FFF59D #FFFF6A -->
		<div class="row">
			<div class="col-md-4 col-md-push-8" style="padding-top: 24px;">
			<div style="border:1px solid blue;margin-bottom:5px;background-color: white;">
			 <p class="research_class" style="padding-top:10px;">PUSH-D is freely available for use as a self-help tool.</p>
			 <p class="research_class" style="padding-top:10px;">In addition, PUSH-D is currently being tested/researched as a combination package:</p><br>
        <p class="research_class">PUSH-PLUS (internet-based self help program + a few face-to-face sessions + weekly telephonic support)</p><br><br>
        <p class="research_class">Interested to know more/register?</p>
        <p class="research_class">Drop in a message to 9483029609 or mail us at</p>
        <p class="research_class">push.d.nimhans@gmail.com</p>
        </div>
				<img alt="" src="images/news.jpg" class="img-responsive">
			</div>
			<div class="col-md-8 col-md-pull-4" style="padding-top: 20px;">
				<div id="about" class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">About</h3>
					</div>
					<div class="slimScroll" style="overflow-y: auto; height: 680px; width: 100%">
						<div class="panel-body text-justify" style="padding-right: 10px;">
							<div>
								<h5><strong>What is PUSH-D ?</strong></h5>
								<p><strong>PUSH-D (Practice and Use Self-Help for Depression)</strong> is a computer-based self-care program which is meant to empower individuals by offering a space to learn, strengthen and practice psychological skills that can be useful in dealing with depressive symptoms.</p>
								<p>This program is <strong>NOT</strong> meant for diagnosis of depression and is not a substitute for professional services provided by a mental health professional.</p>
							</div>
							<br>
							<div>
								<h5><strong>Why was PUSH-D developed ?</strong></h5>
								<p>Depression is a common mental health concern which affects a large proportion of individuals at any given point of time. Depression can impact our functioning and quality of life even when the symptoms are mild in severity or too minimal to label it as clinical depression or a disorder.</p>
								<p>Depression is a condition for which effective intervention methods are available. However, many individuals suffering from depression do not have sufficient information and resources to deal with it effectively or to reach out for professional help.</p>
								<p>The World Health Organization(WHO) recommends that a variety of services and approaches, including self-care approaches need to be developed in all countries to support the unmet needs of individuals with common mental health concerns.</p>
								<p>Self-help/self-care is the first level of mental health care which is likely to benefit a large number of individuals dealing with common mental health concerns, while a smaller number of individuals require additional help such as face-to face consultations with mental health professionals and intensive treatment. Self-care is similar to first aid. An individual can use it by himself/herself to hasten recovery.</p>
								<p>PUSH-D program has been developed for individuals who are experiencing low severity/mild levels of depression. It is meant to help such individuals to help themselves to deal with depression and enhance their functioning and well-being.However, this program is NOT meant for diagnosis of depression and is NOT a substitute for help provided by a mental health professional.</p>
								<p>It is based on same psychotherapeutic or psychological approaches that have been applied in the management of depression in face-face therapy interactions. The techniques incorporated in this program are based on principles of Cognitive Behaviour Therapy (CBT), Interpersonal Therapy(IPT), Supportive Therapy as well as Positive Psychology. Majority of the techniques used in this program are an integral part of interventions for depression that are based on available research evidence.</p>
								<p>A unique feature of this self-care program is that it adds a touch of professional contact through periodic mobile prompts and emails to help keep up your motivation to complete the program.</p>
							</div>
						</div>
					</div>		
				</div>			
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-4 col-md-push-8" style="padding-top: 20px;">
				<img  id="forWhomImg" alt="" src="images/first.png" class="img-responsive">
			</div>
			<div id="forWhom" class="col-md-8 col-md-pull-4" style="padding-top: 20px;">
				<div id="forwhom" class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">For Whom</h3>
					</div>
					<div class="panel-body text-justify" style="padding-right: 10px;">
						<div>
							<h5><strong>PUSH-D for Whom</strong></h5><br>
							<p><strong>Is this program suitable for me?</strong></p>
							<p>This self-care program is designed for individuals who have mild levels (low severity) of depressive symptoms.</p>
							<p>If you wish to register for this program, you will first need to undergo an initial screening (an initial evaluation process online, when  you register) which will help us determine whether this self-care program is suitable for you or not. In case   your depression is at moderate to severe levels or if there is more than one mental health problem then, you would benefit from seeking other forms of treatment/more intensive treatments under direct care of a mental health professional and we would advise you regarding the same, following the screening/evaluation process.</p>
							<p><strong>I experience some anxiety, in addition to depression. Will I benefit from this program?</strong></p>
							<p>The essential sections of the program target depressive symptoms though certain strategies described therein can also be useful for anxiety symptoms. Moreover, a few subsections in the Optional section of this program have content that may be used to manage anxiety symptoms. In case  your anxiety symptoms  are  very significant/dominant, these   would require to be independently handled as PUSH-D is not designed  to target specific  anxiety symptoms.</p>
							<p><strong>I am already undergoing treatment for depression. Will this program be of any use for me?</strong></p>
							<p>This is a self-care program for people who have mild levels of depressive symptoms and want to try it as a first-line management. </p>
							<p>If you are already undergoing treatment for depression, either in the form of medication or psychotherapy/counselling, you can check with your mental health consultant about the additional utility of taking up this program. It is likely that the program content may supplement your ongoing treatment, but it would be best to discuss this with your consultant first. Moreover, even if you decide to register for this program, you would still be required to go through  an  online evaluation process. </p><br>
							<p><strong>Note</strong> : PUSH-D program was pilot tested as part of an ICMR funded research project. The results of pilot testing and associated papers have been published in scientific journals and are listed in the Reference section of PUSH-D program.</p><br>
						</div>
					</div>		
				</div>			
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-4 col-md-push-8" style="padding-top:20px;">
				<img alt="" src="images/what_to_expect_latest.PNG" class="img-responsive">
			</div>
			<div class="col-md-8 col-md-pull-4" style="padding-top: 20px;">
				<div id="whattoexpect" class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">What To Expect</h3>
					</div>
					<div class="panel-body text-justify" style="padding-right: 10px;">
						<div>
							<p>You should note the following features of this program for depression:</p>
							<ul style="padding-left: 25px;">
								<li><p><strong>Self-driven and yet assisted : </strong>This program is primarily self-driven but we will help you to keep up your motivation through periodic mobile prompts and emails.</p></li>
								<li><p><strong>Self-scheduling : </strong>You can schedule your own week-days and timings to go over the program content/exercises and learn from the program.</p></li>	
								<li><p><strong>At your home/other convenient location : </strong>You need not travel to a center/hospital/clinic to access and complete this program. You can access it from the convenience of your home/other location. </p>
									<p><strong>Note : </strong>If you are experiencing any kind of crisis at the time of registration or while using this program, the PUSH-D team will strongly recommend that you seek immediate and direct consultation with a trained mental health professional/connect to a helpline/other appropriate emergency service.</p>
								</li>	
								<li><p><strong>Computer-based/mobile-based : </strong>The program requires you to access your desktop/laptop/smartphone.: PUSH-D mobile app can be downloaded from Google Play Store, while the web-based version can be accessed via desktop/laptop. As PUSH-D is an intensive, interactive self-help course, several users prefer accessing it via the web-version. </p></li>	
								<li><p><strong>Internet-based : </strong>You need to have access to internet for going through almost all of its content.</p></li>	
								<li><p><strong>Confidentiality : </strong>You can access this program in the privacy of your own chosen place. You will have to use an assigned user id and password to log on to the program. You can change your password subsequently. The information that you provide while going through the program will be stored in a secure server. Your identity will not be revealed to anyone other than the resource-team, before registration or during and after the program with the exception of instances where there is risk of harm to self or to others.</p></li>	
								<li><p><strong>No passive reading of content : </strong>Requires your active involvement in terms of filling forms, completing some exercises etc.</p></li>	
								<li><p><strong>Use your workbook : </strong>You will have access to a workbook  which would contain all the information you  fill in (e.g. your responses to a questionnaire, the goals you set/the plans you make)  so that you can reflect upon and refer back to your own self-discoveries and commitments made during the program</p></li>	
								<li><p><strong>Progress monitor : </strong>You will have constant access to  feedback regarding the extent to which you have completed the program/number of exercises you have completed/number of times and duration of your log-in. This is expected to help you track your own efforts and involvement in the program.</p></li>	
								<li><p><strong>Program Sections : </strong>These are sections of the program ordered in a sequence. These are sections typically helpful for individuals with depressive symptoms. Apart from this, there are some optional sections that you can explore at any point and use depending on your need/concerns.</p></li>
								<li><p><strong>Evaluation and feedback : </strong>The online evaluation during the registration process is meant  to  provide   you  a basic/crude  feedback about   your depressive symptoms and functioning, so that  you may choose an appropriate  course of action. A face-to face professional consultation is helpful in all instances to  decide the  best options  for a given individual. We recommend you to consult a mental health professional for face-to face detailed evaluation for any mental health concern.  PUSH-D is merely a self-care tool for empowering you with  a few strategies  to deal with depressive symptoms. It is Not a substitute for professional evaluation  and treatment. .</p></li>	
							</ul>
						</div>
					</div>		
				</div>			
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-4 col-md-push-8" style="padding-top: 20px;">
				<img alt="" src="images/DSC_6072_edited-1.jpg" class="img-responsive">
				<img alt="" src="images/new.png" class="img-responsive" style="padding-top: 20px;">
				<br>
				<div class="panel panel-primary">
				<div class="panel-heading">
						<h3 class="panel-title text-capitalize">What the users have expressed</h3>
					</div>
					<div style="background-color:#FEE7D3;">
                 <marquee direction="up" onmouseover="this.stop()" onmouseout="this.start()" scrolldelay="200"> <div class="panel-body text-justify" style="height: 300px; width: 100%">
                   
                  <div>
				 	<ul class="testimonial" style="padding-left: 25px;">
								<li><p>Availability of PUSH-D itself made me feel that there is something to help me. This thought was itself motivating</p></li>
								<li><p>Activities stimulated my interests and thoughts to make me talk to people</p></li>	
								<li><p>The results brought about in me by the PUSH-D motivated me to move further. </p></li>	
								<li><p>Every step in completion of PUSH-D manifested changes in me </p></li>		
								<li><p>I feel connected with the team</p></li>
								<li><p>I found it scientific and relevant. I am highly benefitted by the program</p></li>
								<li><p>It was very informative and educative. It helped me chase my targets.</p></li>
								<li><p>Every section was unique in itself</p></li>
								<li><p>The use of activities/exercises and other contents from PUSH-D were very interesting and has made a huge impact on me.</p></li>
								<li><p>PUSH-D is very helpful for working people like me who can't take out time to go to a mental health professional</p></li>
								<li><p>The module was very engaging and insightful</p></li>
								<li><p>It was very convenient to use. It will be useful to people who are not able to share their problems with others. </p></li>
								<li><p>The division of the material into knowledge point, tool box, practice point, commitment etc aids in clarity and the concepts just seep in</p></li>
								<li><p>It brought a ray of hope for me when I was feeling lost. It was a fantastic program </p></li>
								<li><p>It helped me to understand that I have ways to fight my depression without medications</p></li>
								<li><p>It was very good and really helped me when I was in need of it </p></li>
								<li><p>It is very diverse and dynamic. It has colorful charts, posters, videos, diagrams and scales. That breaks the monotony and encourages engagement</p></li>
								<li><p>It has great sayings which perfectly describe the sections and set the correct mood for the topic.</p></li>
								<li><p>It gives a record of how 'i am doing'. How much time I have spent on the website, how many exercises I have completed, how far I have to go. This personalisation is great!</p></li>
								<li><p>I love the work sheets. These make it practically possible to implement what is being taught. It makes it practical in daily life. We can actually keep these sheets in pocket and keep doing them through the day as and when challenge arises/ we find time.</p></li>
								<li><p>I think the biggest road block for any depressed person is personal work. I believe this self help app encourages us to negotiate through that block of self-work. One has to sit down, one has to do it and one cannot go ahead till one section is completed. It kind of forces us into action.</p></li>
								<li><p>Great initiative for helping a large number of people</p></li>
							</ul>
				   </div>
                </div></marquee>
                </div>
                </div>
				<br>
				<div class="panel panel-primary">
				<div class="panel-heading">
						<h3 class="panel-title text-capitalize">Visit</h3>
					</div>
                  <div class="panel-body text-justify">
                   <b>No.of Page views : 78 </b>
                   <!-- <li>Total users : {{users}} </li> -->
                </div>
                </div>
			</div>
			
			<div class="col-md-8 col-md-pull-4" style="padding-top: 20px;">
				<div id="team" class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title text-capitalize">About The Core Resource Team</h3>
					</div>
					<div class="panel-body text-justify" style="padding-right: 10px;">
						<div>
							<p><strong>Dr. Seema Mehrotra </strong>trained as a clinical psychologist at the National Institute of Mental Health and Neuro Sciences, Bangalore and went on to complete her PhD work in 1996 from Nagpur University. Her PhD work was situated at the interface between psycho-oncology and psychology of well-being.</p>
							<p>She served at faculty positions in Clinical Psychology at Kasturba Medical College, Manipal for almost a decade before joining NIMHANS as a faculty in 2002. She currently serves as Professor of Clinical Psychology at NIMHANS, Bangalore. </p>
							<p>Her responsibilities entail being in charge of Clinical Psychology services of an adult psychiatry unit, coordinating the activities of the Positive Psychology Unit and serving as a consultant at the NIMHANS Centre for Wellbeing (NCWB). She runs a positive mental health clinic called Flourish at NCWB.</p>
							<p>Dr. Seema Mehrotra has 22 years of clinical, teaching and research experience in the field of Clinical Psychology. Her clinical work spans a gamut of psychological interventions suitable for adults with diverse mental health issues. </p>
							<p>She has developed preventive and promotive intervention program modules for young adults in the community. She has acted as primary supervisor of research at M Phil and PhD levels for more than two dozen scholars and has led research projects funded by ICMR, ICSSR and CSIR. She has published papers in national and international peer reviewed and indexed journals and authored chapters in books. Her areas of research include mental health promotion, application of positive psychology using a public health framework, adaptation to major life events, intentional self-development and emotional regulation.  </p>
							<hr style="border: 1px solid #337AB7">
							<p><strong>Dr.Paulomi M. Sudhir </strong>trained as a clinical psychologist at the National Institute of Mental Health and Neuro Sciences, Bangalore and subsequently completed her PhD at NIMHANS in 1998. Her doctoral work was in the area of behavioral medicine, and involved delivering a behavioral and cognitive intervention program in patients with type-1 diabetes. </p>
							<p>She then worked at the Department of Clinical Psychology at NIMHANS as Clinical Psychologist, Junior Scientific Officer and subsequently joined as faculty at the Department in 2004. She currently holds the position of Professor of Clinical Psychology at NIMHANS, Bangalore. </p>
							<p>Her Clinical responsibilities are being a consultant at the Behavioural Medicine Unit as well as a consultant at the Community Mental Health Unit. In addition she is also a consultant at the NIMHANS Centre for Wellbeing (NCWB), where she runs the Stress and Lifestyle Clinic along with her team. </p>
							<p>Dr. Paulomi has nearly 20 years of clinical, teaching and research experience in the field of Clinical Psychology. She specializes in behavioural and cognitive behavioural therapies (CBT) for a wide array of clinical conditions and is actively involved in teaching and training post graduates and professionals. She has supervised research at M Phil and PhD in the areas of her interest that also include health psychology and mindfulness based interventions.  Dr. Paulomi has received grants to carry our studies from ICMR and ICSSR and she has published papers in national and international peer reviewed and indexed journals and authored chapters in books on CBT and work stress.</p>
							<hr style="border: 1px solid #337AB7">
							<p><strong>Dr. Girish Nagaraja Rao </strong>is a Professor of Epidemiology, Centre for Public Health, NIMHANS. He is a medical graduate with a postgraduate degree in Community Medicine and is trained in epidemiological methods. He has been associated with nearly 50 research projects at NIMHANS since the past decade. The activities have ranged from doing independent research to being a co-investigator to guiding student research at both undergraduate, postgraduate, super-specialty and doctorate levels. The sample sizes have also varied from less than 100 to nearly 50,000 and have adopted different study designs ranging from simple cross sectional studies to mixed study designs. The key areas of research have been geriatric mental health, maternal mental health, alcohol epidemiology, health economics and community mental health. The focus has been on health systems with a public health perspective leading on to operational and translational research. With a penchant for teaching, he professes participatory learning adopting adult learning principles. Dr.Girish was the co-investigator for the India component of the World Mental Health Survey : Bangalore study and is currently the Co-Principal Investigator for the National Mental Health Survey.</p>
							<hr style="border: 1px solid #337AB7">
							<p><strong>Dr. Jagadisha Thirthalli  </strong>is a professor of psychiatry, working as faculty in the department of psychiatry at NIMHANS. Additionally, he heads the Psychiatric Rehabilitation Services in the department.</p>
							<p>He obtained his MD degree in Psychiatry from NIMHANS in 1998 and since then has worked as a Senior Resident and an Assistant Professor in a general hospital psychiatry unit in Manipal, Karnataka before joining NIMHANS as a faculty in 2002. </p>
							<p>He has keen interest in making psychiatric and psychological help available to the people who need them in the community. His team has been serving two rural communities for psychiatric care for more than a decade. </p>
							<p>As part of his clinical work and research he liaises closely with departments of Clinical Psychology, Psychiatric Social Work and Epidemiology. He has more than 100 publications in peer-reviewed pubmed-indexed journals and has completed about 20 funded research projects as principal or co-investigator. Dr. Thirthalli has been supervising psychotherapy training of psychiatry trainees since 1999. </p>
						</div>
				
						
				</div>
				</div>		
				<div class="col-md-15" style="padding-top: 20px;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Technology Support</h3>
					</div>
					<div class="panel-body text-justify" style="padding-right: 10px;">
						
						<p>PUSH-D was developed by a team of young scholars under the leadership of Professor T.K. Srikanth, E-Health Research Center, International Institute of Information Technology (IIIT-B), Bangalore. The program is supported on an ongoing basis by the team at IIIT-B and NIMHANS Data Center, led by Ms. Sindhu M.G. </p>
				
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div class="clearfix"></div>
<div class="footer">
			
				<div style="text-align:center;background-color:#FFF59D;padding-top:10px;padding-bottom:10px;">
					<a href="privacypolicy.html"><span  style="color:blue;font-weight:bold;"><u>Privacy Policy</u></span></a>
				</div>

			</div>
	<!-- --------Model ------------------------ -->
	<div class="modal fade" id="contact" role="dialog">
		<div class="modal-dialog modal-lg" >
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success text-center" style="background: #4CAF50;color: white">
					<h5>Contact Us</h5>
				</div>
				<div class="text-justify" style="padding: 20px 50px;">If you wish to know the registration process or have any other queries, write to us at push.d.nimhans@gmail.com.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------- -->		
			
			<div class="container">
			<div class="modal fade" id="myModal1" role="dialog"
				style="padding-top: 94px;">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header"
							style="padding: 7px 50px; background-color: #FFA726;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 style="background-color: #FFA726;">Sign-up
								<span></span> 
							</h4>
						</div>
						<div class="modal-body" style="padding: 40px 50px;background-color:#FFF59D;"
							>
							<form name="signinform">
								<div class="form-group">
									<label for="usrname">Email</label> <input type="email"
										autocomplete="off" class="form-control" 
										id="usrname" placeholder="Enter email" 
										onfocus="this.placeholder = ''">
								</div>
								<button type="submit" id="signupSubmit"
									onclick="signup()" class="btn btn-warning btn-block">
									<span class="glyphicon glyphicon-log-in"></span> Sign up
								</button>
								<p style="padding-top:20px;" id="display_maildetail">We have sent a link to your registered email id. Please click on that link to continue.</p>
								<p style="padding-top:20px;" id="display_maildetail2"><b>Email already registered</b></p>
								<!-- <p style="padding-top:20px;" id=""><b>Registration of new users is temporarily not available</b></p> -->
								<div class="form-group" style="text-align: center;"
									ng-show="spinner">
									<i id="spinner" class="fa fa-spinner fa-spin"
										style="font-size: 30px; color: #9e6d6f;"></i>
								</div>
							</form>
						</div>

						<div class="modal-body" style="padding: 40px 50px;"
							ng-show="modalview1"></div>

						<div class="modal-footer">
							<button type="submit"
								class="btn btn-danger btn-default pull-left"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> Cancel
							</button>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- forgotPassword -->
		 
		 <div class="container">
			<div class="modal fade" id="myModal2" role="dialog"
				style="padding-top: 94px;">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header"
							style="padding: 7px 50px; background-color: #FFA726;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 style="background-color: #FFA726;">Please enter registered email Id
								<span></span> 
							</h4>
						</div>
						<div class="modal-body" style="padding: 40px 50px;background-color:#FFF59D;"
							>
							<form name="signinform">
								<div class="form-group">
									<label for="usrname1">Email</label> <input type="email"
										autocomplete="off" class="form-control" 
										id="usrname1" placeholder="Enter email" 
										onfocus="this.placeholder = ''">
								</div>
								<button type="submit" 
									onclick="forgotpwd()" id="forgetSubmit" class="btn btn-warning btn-block">
									<span class="glyphicon glyphicon-log-in"></span> Submit
								</button>
								<p style="padding-top:20px;" id="display_maildetail1">We have sent a link to your registered email id. Please click on that link to continue.</p>
								<p style="padding-top:20px;" id="display_maildetail3"><b>Email Not registered Please login As New User.</b></p>
								<div class="form-group" style="text-align: center;"
									ng-show="spinner">
									<i id="spinner1" class="fa fa-spinner fa-spin"
										style="font-size: 30px; color: #9e6d6f;"></i>
								</div>
							</form>
						</div>

						<div class="modal-body" style="padding: 40px 50px;"
							ng-show="modalview1"></div>

						<div class="modal-footer">
							<button type="submit"
								class="btn btn-danger btn-default pull-left"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> Cancel
							</button>

						</div>
					</div>
				</div>
			</div>
		</div>
		 
		 
		 
						
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-primary">
					Login
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="login.jsp" method="post">
				<div class="modal-body">
						<div class="form-group">
							<input
								type="text" class="form-control" onkeyup="hide()" style="color: black;" id="userName" name="userName"
								placeholder="Registered Email Id">
						</div>
						<div class="form-group">
							<input
								type="password" class="form-control" onkeyup="hide()" style="color: black;" id="userPassword" name="userPassword"
								placeholder="Password">
						</div>
						<div class="form-group">
						<!-- <a href="#" onclick="return func();">New user?</a> -->
						<a href="#" id="myBtn2" >Forgot Password?</a>
						</div>
						<div class="form-group">
						<p id="new" class="hidden"><small>If you wish to know the registration process, write to us at push.d.nimhans@gmail.com.</small></p>
						</div>
						<p> 
						<div class="form-group text-center">
							<span id="err" class="hidden" style="color: red">Wrong username and password</span>
						</div>
				</div>
				
				<div class="modal-footer">
					<!-- <button type="submit" class="btn btn-success pull-right">Login</button> -->
					<button type="button" onclick="login()" class="btn btn-success pull-right">LOGIN</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	<!--  modal to display link to open/install app when the application is opened from mobile browser -->
	<div id="myModal_mobile_browser" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Message</h4>
      </div>
      <div class="modal-body">
        <p>You seem to be using a mobile screen. PUSH-D browser version works best with desktop/laptop. We strongly recommend to use the mobile app version if you are not using desktop/laptop. You can download the app from Play Store. Please click below to open/install PUSH-D app.</p>
      <a href='https://play.google.com/store/apps/details?id=ac.nimhans.pushd&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' width="100" height="50"
				style="margin-left: 30%; margin-right: 30%;" src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png'/></a>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!--  modal to display -->
	<div id="research_message" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       
      </div>
      <div class="modal-body" style="background-color:#FFF59D;border-top:2px solid blue;border-bottom:2px solid blue;">
        <p class="research_class">PUSH-D is currently being tested/researched as a combination package:</p><br>
        <p class="research_class">PUSH-PLUS (internet-based self help program + a few face-to-face sessions + weekly telephonic support)</p><br><br>
        <p class="research_class">Interested to know more/register?</p>
        <p class="research_class">Drop in a message to 9483029609 or mail us at</p>
        <p class="research_class">push.d.nimhans@gmail.com</p>
        
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		
	
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/slimscroll.js"></script>
	
	<script type="text/javascript">
	
		function hide() {
			$('#err').addClass("hidden");
		}
		function func()
		{
			$('#new').removeClass("hidden");
		}
		function login() {
			
			var strDIV;
             var isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
               var element = document.getElementById('text');
                if (isMobile) {
                        strDIV="Mobile";
               } else {
            	       strDIV="Desktop";
           }
			
			formData = "name="+($('#userName').val().toLowerCase()) + "&pwd=" + $('#userPassword').val() + "&app_type="+strDIV+" Browser";
			
			$.ajax({
				
				  type: "POST",
				  url: serverURL + "users/s/new_login",
				  data: formData,
				  success: function(data) {
					  	var userid = data;
					  	if( userid != "invalid") {
					  		
					  		var res = userid.split("@@##");
					  		if(res[0]=="not"){
					  			localStorage.setItem("srs_id", res[1]);
					  			alert("You have not completed the registration process,please complete the registration before login,userName&password will be same as you given before");
					  			window.location.href = "register1.html";
					  			
					  		}else if(userid == "inactiveUser"){
					  			
					  			 alert("Your PUSH-D account is deactivated as it is six weeks since you registered. Please contact push.d.nimhans@gmail.com for re-activation of your PUSH-D account ");	
					  				
					  		}else{
					  			
					  			
					  			window.location.replace("login.jsp?id="+res[1]);
					  		}
					  			
						} 
				   	 	else {
				   	 		$('#err').removeClass("hidden");
				   	 	
				   	 	}
				  },
				  error: function() {
					  alert("Error: server encountered an internal error. Please try again after some time ");
					
					  
				  } 
			});
		}
		
		$(document).ready(function(){
			$(window).resize(function(){
				setHeight();
			});
			
			function setHeight(){
				var height = $('.slider-image1').parent().height();
			    $('.carousel-inner').css('min-height',height+'px');
			}
			setHeight();
	
			$.ajax({
				  type: "GET",
				  url: serverURL + "users/siteVisits/1/1",
				  success: function(data){
					 
					 // console.log("correct site visits count.."+data);
				  },
				  error: function() {
					  alert("Error: server encountered an internal error. Please try again after some time ");
					  
				  }
			});
			
			
		})
		
		function signup() {
			$("#spinner").show();
			var email= $('#usrname').val().toLowerCase();
			
			$('#signupSubmit').prop('disabled',true);
			
			 var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

		        if (reg.test(email) == false) 
		        {
		        	 alert('Please enter valid email address');
		        	 $('#signupSubmit').prop('disabled',false);
		             return false;
		        }else{
		        	
			$.ajax({
				  type: "POST",
				  url: serverURL + "users/verifyEmailId/"+email,
				  data: email,
				  success: function(data){
					  
					  $("#spinner").hide();
					  
					 if(data > 0){
						
							  $('#display_maildetail2').show();
							  $('#signupSubmit').prop('disabled',false);
							  
							 
					 }else{
						
						 
							  $('#display_maildetail').show();
							  $('#signupSubmit').prop('disabled',true);
							 //reg count 
							  $.ajax({
								  type: "GET",
								  url: serverURL + "users/siteVisits/1/2",
								  success: function(data){
									 
									  //console.log("correct site visits count.."+data);
								  },
								  error: function() {
									  alert("Error: server encountered an internal error. Please try again after some time ");
									  
								  }
							});
							  
							  
							
					 }
					  
				  },
				  error: function() {
					  alert("Error: server encountered an internal error. Please try again after some time ");
					 
				  } 
			});
			
			
		        }
			
			}
		        
		
		
		//forgotpassword
		function forgotpwd() {
			$("#spinner1").show();
			var email= $('#usrname1').val().toLowerCase();
			$('#forgetSubmit').prop('disabled',true);
			
			 var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

		        if (reg.test(email) == false) 
		        {
		        	 alert('Please enter valid email address');
		        	 $('#forgetSubmit').prop('disabled',false);
		             return false;
		        }else{
			
			
		$.ajax({
				  type: "POST",
				  url: serverURL + "users/forgotpassword/"+email,
				  data: email,
				  success: function(data){
					
					$("#spinner1").hide();
					  
					  if(data <= 0){
							
						  $('#display_maildetail3').show();
						  $('#forgetSubmit').prop('disabled',false);
						 
				     }else{
				    	
						  $('#display_maildetail1').show();
						  $('#display_maildetail3').hide();
						  $('#forgetSubmit').prop('disabled',true);
						
				      }
					  
					 
				  },
				  error: function() {
					  alert("Error: server encountered an internal error. Please try again after some time ");
					 
				  } 
			});
			
			
		        }
			}
		
		$(document).ready(function(){
			if ($(window).width() < 500) {
				$("#myModal_mobile_browser").modal('show');
				
				
			
			}
			});
		
	</script>
</body>
</html>