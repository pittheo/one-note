<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>

<html lang="en"><head>
    <meta charset="utf-8">
    <title>OneNote. Let's rewrite music, together!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/one-note/styles/bootstrap.css" rel="stylesheet">
    <link href="/one-note/styles/one-note.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="/one-note/styles/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">OneNote.com</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="/one-note/">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-form pull-right">
              <input class="span2" type="text" placeholder="Email">
              <input class="span2" type="password" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

	<div id="mission-statement" class="row">
		Let's rewrite music, together!
	</div>
	<div class="row tagline">
		Collaborate to create the world's best chords collection!
	</div>
	
    <div class="container">
    <div id="main-form">
  	  <div class="row">
  	  	<div class="span12">
  	  		<form id="search-form" action="/search/" method="get" class="clearfix uniForm one-note-form module-search">
            <!--<label for="id_location" class="inline search-location-inline-label inline-label" style="font-size: 20px; font-family: myriad-pro-semi-condensed-1, myriad-pro-semi-condensed-2, Arial, sans-serif; font-weight: bold; line-height: normal; letter-spacing: normal; top: 134px; left: 170px; width: 490px;">Where are you going?</label>-->
            <input type="text" placeholder="Which song do you want to play?" name="location" id="id_location" class="ui-autocomplete-input inline-label-field" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true" style="color: rgb(33, 33, 33);">
            <!--<button class="gidsy-button green-button left" loadingtext="Search" id="search-submit">Search</button>-->
          </form>
  	  	</div>
  	  </div>
  	  <div class="row">
  	    <div class="span4 offset4">
          <a href="/one-note/tablatures/?form"><button class="gidsy-button green-button" loadingtext="Search" id="search-submit">Create your own version</button></a>
        </div>
  	  </div>
	  </div>
      <!-- Example row of columns -->
      <div id="showcase" class="row">
<ul class="a masonry" data-behavior="do_masonry shadowbox" data-tout="false" style="position: relative; height: 738px; width: 964px;">
	<li style="position: absolute; top: 0px; left: 0px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3869/memes" data-json="/stories/3869.json" class="">
			<img src="/one-note/images/albums/adele.jpg">
			<b>Adele</b>
			<ul class="">
				<li class="i_l">2173</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	
	
	<li style="position: absolute; top: 0px; left: 246px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3865/events" data-json="/stories/3865.json" class="">
			<img src="/one-note/images/albums/oasis.jpg">
			<b>Oasis - Definitely Maybe</b>
			<ul class="">
				<li class="i_l">1192</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	<li style="position: absolute; top: 0px; left: 492px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3861/most-listened-to-songs" data-json="/stories/3861.json" class="">
			<img src="/one-note/images/albums/amy.jpg">
			<b>Amy Winehouse - Back to Black</b>
			<ul class="">
				<li class="i_l">4981</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	<li style="position: absolute; top: 0px; left: 738px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3866/movies" data-json="/stories/3866.json" class="">
			<img src="/one-note/images/albums/pink-floyd.jpg">
			<b>Pink Floyd - The Division Bell</b>
			<ul class="">
				<li class="i_l">2282</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	<li style="position: absolute; top: 246px; left: 0px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3868/check-ins" data-json="/stories/3868.json" class="">
			<img src="http://s3.amazonaws.com/FacebookHackers-production/stories/homepage_images/000/003/868/story_thumb.png">
			<b>Check-Ins</b>
			<ul class="">
				<li class="i_l">1252</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	<li style="position: absolute; top: 246px; left: 246px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3862/public-figures" data-json="/stories/3862.json" class="">
			<img src="http://s3.amazonaws.com/FacebookHackers-production/stories/homepage_images/000/003/862/story_thumb.png">
			<b>Public Figures</b>
			<ul class="">
				<li class="i_l">1131</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	<li style="position: absolute; top: 246px; left: 492px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3867/most-read-books" data-json="/stories/3867.json" class="">
			<img src="http://s3.amazonaws.com/FacebookHackers-production/stories/homepage_images/000/003/867/story_thumb.png">
			<b>Most Read Books</b>
			<ul class="">
				<li class="i_l">3602</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	<li style="position: absolute; top: 246px; left: 738px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3870/technology" data-json="/stories/3870.json" class="">
			<img src="http://s3.amazonaws.com/FacebookHackers-production/stories/homepage_images/000/003/870/story_thumb.png">
			<b>Technology</b>
			<ul class="">
				<li class="i_l">1435</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	<li style="position: absolute; top: 492px; left: 0px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3871/politics" data-json="/stories/3871.json" class="">
			<img src="http://s3.amazonaws.com/FacebookHackers-production/stories/homepage_images/000/003/871/story_thumb.png">
			<b>Politics</b>
			<ul class="">
				<li class="i_l">682</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	<li style="position: absolute; top: 492px; left: 246px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3872/television" data-json="/stories/3872.json" class="">
			<img src="http://s3.amazonaws.com/FacebookHackers-production/stories/homepage_images/000/003/872/story_thumb.png">
			<b>Television</b>
			<ul class="">
				<li class="i_l">2704</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
	<li style="position: absolute; top: 492px; left: 492px;" class="masonry-brick">
		<a href="http://www.facebookstories.com/stories/3906/sports" data-json="/stories/3906.json" class="">
			<img src="https://s3.amazonaws.com/FacebookHackers-production/stories/homepage_images/000/003/906/story_thumb.png">
			<b>Sports</b>
			<ul class="">
				<li class="i_l">625</li>
				
			</ul>
			<span class="i_a i_v"></span>
		</a>
	</li>
</ul>
      </div>
      
      <div class="row">
        <div class="top-users span3">
          <h2>Top users</h2>
          <img src="/one-note/images/users/user1.png">
          <img src="/one-note/images/users/user2.jpeg">
          <img src="/one-note/images/users/user3.jpeg">
          <img src="/one-note/images/users/user4.jpeg">
          <img src="/one-note/images/users/user5.png">
          <img src="/one-note/images/users/user6.jpeg">
          <img src="/one-note/images/users/user1.png">
          <img src="/one-note/images/users/user4.jpeg">
          <img src="/one-note/images/users/user1.png">
          <img src="/one-note/images/users/user1.png">
          <img src="/one-note/images/users/user4.jpeg">
          <img src="/one-note/images/users/user6.jpeg">
          <img src="/one-note/images/users/user1.png">
          <img src="/one-note/images/users/user1.png">
          <img src="/one-note/images/users/user3.jpeg">
          <img src="/one-note/images/users/user5.png">
          <img src="/one-note/images/users/user1.png">
          <img src="/one-note/images/users/user4.jpeg">
          <img src="/one-note/images/users/user1.png">                                                                                                                        
        </div>
      </div>
      
      <hr>
      <footer>
        <p>© one-note.com 2012</p>
      </footer>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/one-note/js/jquery.min.js"></script>
    <script src="/one-note/js/bootstrap-transition.js"></script>
    <script src="/one-note/js/bootstrap-alert.js"></script>
    <script src="/one-note/js/bootstrap-modal.js"></script>
    <script src="/one-note/js/bootstrap-dropdown.js"></script>
    <script src="/one-note/js/bootstrap-scrollspy.js"></script>
    <script src="/one-note/js/bootstrap-tab.js"></script>
    <script src="/one-note/js/bootstrap-tooltip.js"></script>
    <script src="/one-note/js/bootstrap-popover.js"></script>
    <script src="/one-note/js/bootstrap-button.js"></script>
    <script src="/one-note/js/bootstrap-collapse.js"></script>
    <script src="/one-note/js/bootstrap-carousel.js"></script>
    <script src="/one-note/js/bootstrap-typeahead.js"></script>
    <!-- JS & CSS for autocomplete-->
	<link rel="stylesheet" type="text/css" href="/one-note/styles/token-input.css">
	<link rel="stylesheet" type="text/css" href="/one-note/styles/token-input-facebook.css">
	<script type="text/javascript" src="/one-note/js/jquery.tokeninput.js"></script>
	<script src="http://www.google.com/jsapi?key=AIzaSyA5m1Nc8ws2BbmPRwKu5gFradvD_hgq6G0" type="text/javascript"></script>
	<!--<script type="text/javascript" src="/one-note/js/ytcp.js" /></script>-->
	<script type="text/javascript" src="/one-note/js/googleSearch.js"></script><script src="http://www.google.com/uds/?file=search&amp;v=1" type="text/javascript"></script><link href="http://www.google.com/uds/api/search/1.0/981037b0e11ff304c7b2bfd67d56a506/default+en.css" type="text/css" rel="stylesheet"><script src="http://www.google.com/uds/api/search/1.0/981037b0e11ff304c7b2bfd67d56a506/default+en.I.js" type="text/javascript"></script>

    <script type="text/javascript"> 
		$(document).ready(function() {
			
		});
	</script>
  
</body>
</html>