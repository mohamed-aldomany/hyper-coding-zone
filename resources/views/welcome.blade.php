{{-- @include('partials.header') --}}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Hyper Coding Zone</title>
    <link rel="shortcut icon" href="/Image/MainPage/wel.png" type="image/x-icon" /> 
    <!-- Styles -->
    <link href="/css/user/userCSS.css" rel="stylesheet">
    <link rel="stylesheet" href="css/animate.min.css">
</head> 

<body data-spy="scroll" data-target="#navbarResponsive">

<div id="home">
	@include('partials.navbar')
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000">
		{{-- <ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
		</ol> --}}
		<div class="carousel-inner" role="listbox">
			<!-- slide 0 -->
			<div class="carousel-item active" style="background-image: url(Image/MainPage/computers.png) ">
				<div class="carousel-caption text-center">
					<img src="/Image/logo.png" style="position:relative;bottom:70px;height:60%;">
					<h3>Hyper Coding Zone</h3>
				</div>
			</div>
			<!-- slide 1 -->
			<div class="carousel-item" style="background-image: url(Image/MainPage/computers.png) ">
				<div class="carousel-caption text-center">
					<h1>Welcome To HCZ</h1>
					<h3>Free Online Web Technologies</h3>
				</div>
			</div>
			<!-- slide 2 -->
			<div class="carousel-item" style="background-image: url(Image/MainPage/computers-2.png) ">
				<div class="carousel-caption text-center">
					<h1>HCZ Courses</h1>
					<h3>Free Online Web Courses & Articles</h3>
				</div>
			</div>
			<!-- slide 3 -->
			<div class="carousel-item" style="background-image: url(Image/MainPage/computers-4.jpg) ">
				<div class="carousel-caption text-center">
					<h1>Community Page</h1>
					<h3>Shared Your Questions Or Problems Through The Community Page</h3>
				</div>
			</div>
			<!-- slide 4 -->
			<div class="carousel-item" style="background-image: url(Image/MainPage/computers-5.jpg) ">
				<div class="carousel-caption text-center">
					<h1>Academic Page</h1>
					<h3>We put to you more than a path in the web field to walk on it</h3>
				</div>
			</div>
			<!-- slide 5 -->
			<div class="carousel-item" style="background-image: url(Image/MainPage/computers-6.jpg) ">
				<div class="carousel-caption text-center">
					<h1>Exam Page</h1>
					<h3>You can test your abilities on each course more than once</h3>
				</div>
			</div>
		</div>
	</div>
</div>

<!--- Services ---->
<div id="services" class="services">
	<div class="container">
		<h2 class="wow fadeInUp">Services</h2>
		<p class="wow fadeInUp" data-wow-delay="0.4">Lorem Ipsum is simply dummy text of the printing and typesettin dummy text</p>
		<div class="row">
			<div class="col-lg-3 col-md-3 wow fadeInLeft" data-wow-delay="1.8s">
				<i class="fas fa-film"></i>
				<h4>Courses</h4>
				<p>Lorem Ipsum passages, and more recently with desktop publishing software</p>
			</div>
			<div class="col-lg-3 col-md-3 wow fadeInLeft" data-wow-delay="1.4s">
				<i class="fas fa-satellite-dish"></i>
				<h4>Community</h4>
				<p>Lorem Ipsum passages, and more recently with desktop publishing software</p>
			</div>
			<div class="col-lg-3 col-md-3 wow fadeInLeft" data-wow-delay="0.8s">
				<i class="fa fa-database" aria-hidden="true"></i>
				<h4>Exams</h4>
				<p>Lorem Ipsum passages, and more recently with desktop publishing software</p>
			</div>
			<div class="col-lg-3 col-md-3 wow fadeInLeft" data-wow-delay="0.4s">
				<i class="fa fa-university" aria-hidden="true"></i>
				<h4>Academic</h4>
				<p>Lorem Ipsum passages, and more recently with desktop publishing software</p>
			</div>
		</div>
	</div>
</div>
<!---- End Services ---->

{{-- Prices --}}
<div id="pricing" class="pricing">
    <div class="container">
		<h2 class="wow fadeInUp">Feauture Courses</h2>
            <p class="wow fadeInUp" data-wow-delay="0.4">orem Ipsum passages, and more recently with desktop publishing software</p>
        <div class="row">
            <div class="col-lg-3 col-md-3 wow flipInY" data-wow-delay="0.8s">
                <div class="packages">
                    <h4>Course</h4>
                    <h1>free</h1>
                    <b>Monthly</b>
                    <p>Lorem Ipsum passages, and more recently with desktop</p>
                    <hr>
                    <li>100 Users</li>
                    <li>SSL Certificate</li>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 wow flipInY" data-wow-delay="1.2s">
                <div class="packages">
                    <h4>Course</h4>
                    <h1>free</h1>
                    <b>Monthly</b>
                    <p>Lorem Ipsum passages, and more recently with desktop</p>
                    <hr>
                    <li>100 Users</li>
                    <li>SSL Certificate</li>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 wow flipInY" data-wow-delay="1.6s">
                <div class="packages">
                    <h4>Course</h4>
                    <h1>free</h1>
                    <b>Monthly</b>
                    <p>Lorem Ipsum passages, and more recently with desktop</p>
                    <hr>
                    <li>100 Users</li>
                    <li>SSL Certificate</li>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 wow flipInY" data-wow-delay="2s">
                <div class="packages">
                    <h4>Course</h4>
                    <h1>free</h1>
                    <b>Monthly</b>
                    <p>Lorem Ipsum passages, and more recently with desktop</p>
                    <hr>
                    <li>100 Users</li>
                    <li>SSL Certificate</li>
                </div>
            </div>
        </div>
    </div>
</div>
{{-- End Prices --}}

<!--- Team ----->  
<div id="team" class="team">
    <div class="container">
		<h2 class="wow fadeInUp">Meet our team</h2>
        <p class="wow fadeInUp" data-wow-delay="0.4">Lorem Ipsum passages, and more recently with desktop publishing software</p>    
		<div class="row">
            <div class="col-lg-4 col-md-3 wow fadeInLeft" data-wow-delay="2s">
                <img src="images/team/team-1.jpg" class="img-circle" alt="">
                <h4>John Doe</h4>
                <b>CEO and Founder</b>
                <p>Lorem Ipsum passages, and more recently with desktop publishing software</p>
                <a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
                <a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a>
                <a href="#"><i class="fab fa-pinterest" aria-hidden="true"></i></a>
            </div>
            <div class="col-lg-4 col-md-3  wow fadeInLeft"  data-wow-delay="1.6s">
                <img src="images/team/team-2.jpg" class="img-circle" alt="">
                <h4>John Doe</h4>
                <b>CEO and Founder</b>
                <p>Lorem Ipsum passages, and more recently with desktop publishing software</p>
                <a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
                <a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a>
                <a href="#"><i class="fab fa-pinterest" aria-hidden="true"></i></a>
            </div>
            <div class="col-lg-4 col-md-3  wow fadeInLeft"  data-wow-delay="1.2s">
                <img src="images/team/team-3.jpg" class="img-circle" alt="">
                <h4>John Doe</h4>
                <b>CEO and Founder</b>
                <p>Lorem Ipsum passages, and more recently with desktop publishing software</p>
                <a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
                <a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a>
                <a href="#"><i class="fab fa-pinterest" aria-hidden="true"></i></a>
			</div>
        </div>
    </div>
</div>
<!--- End Team ---->

<!--- Clients ---->
<div id="client" class="clients">
    <div class="container">
		<h2 class="wow fadeInUp">Trusted by</h2>
        <p class="wow fadeInUp" data-wow-delay="0.4">Lorem Ipsum passages, and more recently with desktop publishing software</p>
		<div class="row">
            <div class="col-lg-3 col-md-3 wow fadeInLeft" data-wow-delay="2s">
                <li><img src="images/clients/client1.png" alt=""></li>
            </div>
            <div class="col-lg-3 col-md-3 wow fadeInLeft" data-wow-delay="1.6s">
                <li><img src="images/clients/client2.png" alt=""></li>
            </div>
            <div class="col-lg-3 col-md-3 wow fadeInLeft" data-wow-delay="1.2s">
                <li><img src="images/clients/client3.png" alt=""></li>
            </div>
            <div class="col-lg-3 col-md-3 wow fadeInLeft" data-wow-delay="0.8s">
                <li><img src="images/clients/client4.png" alt=""></li>
            </div>
        </div>
    </div>
</div> 
<!---- End Clients ----->

<!--- start Contact Section -->
<div id="contact-form">
	<div class="row">
		<div class="col-md-6 contact">
			<h1>Contact Form</h1>
			<form>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Your Name" required>
				</div>
				<div class="form-group">
					<input type="email" class="form-control"  placeholder="Your Email" required>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Subject" required>
				</div>
				<div class="form-group">
					<textarea class="form-control" rows="6" placeholder="Your Message" required></textarea>
				</div>
				<button type="submit" class="btn btn-primary btn-lg btn-block">Send</button>
			</form>
		</div>
		<div class="col-md-6 contact-info">
			<h1>Contact Information</h1>
			<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia dese mollit anim id est laborum.</p>
			<p>
				<strong>Email:</strong><br>hyper_coding_zone@yahoo.com<br>
				<strong>Phone:</strong><br>(203) 123-6666
			</p>		
		</div>
	</div>	
</div> 
</div>
@include('partials.footer')
{{-- @include('partials.scripts') --}}
    <script src="js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
</body>
</html>