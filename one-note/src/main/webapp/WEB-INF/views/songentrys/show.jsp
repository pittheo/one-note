<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootstrap, from Twitter</title>
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
    <link href="styles/bootstrap-responsive.css" rel="stylesheet">

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
          <a class="brand" href="#">SomeBrand</a>
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
		Share your talent!
	</div>
	<div class="row tagline">
		Pick a song to provide the chords for.
	</div>

	
    <div class="container">
	  <div class="row">
	  	<div class="offset4 span8">
	  		<form class="form-search">
	  			<input type="text" class="search-query autosuggest-title" placeholder="Type something…">
	  		</form>
	  	</div>
	  </div>
      <!-- Example row of columns -->
      <div id="explanation-steps" class="row">
      	<div class="span4 info-step">
      		<p>Search your favourite song in the search box.</p>
      	</div>
      	<div class="span4 info-step">
      		<p>Click on any word on the lyrics to enter a chord.</p>
      	</div>
      	<div class="span4 info-step">
      		<p>Select your favourite videos.</p>
      	</div>
      </div>

      <div class="row">
        <div class="span6 lyrics-area">
          <h2 id="song-title"></h2>
          <div id="lyrics-area">
          	<!--<c:forEach var="word" items="${lyrics}" varStatus="index">
            	<span position="${index.index}" class="chordable">${word}</span>
            </c:forEach>-->
          </div>
		  <a id="submit-tablature" class="btn btn-large btn-primary" href="/one-note/tablatures/" style="display: none;">Submit!</a>		
        </div>
        <div class="span6">
		    <!--  <div class="span2">
	          <h2>Videos</h2>
		    </div>-->  
	
	        <div id="videos-sidebar" style="display: none;" class="span6">
	          <h2>Videos</h2>
	          <div id="playing-video-area">                                                                                                                         
		          <!-- <iframe width="530" height="315" src="http://www.youtube.com/embed/WJggXSqO9fs" frameborder="0" allowfullscreen></iframe> -->
	          </div> 
	          
	          <jsp:include page="media.jsp" />                                                                                              
		    </div>
       </div>
      </div>
      
      <hr>
      <footer>
        <p>&copy; one-note.com 2012</p>
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
	<script type="text/javascript" src="/one-note/js/googleSearch.js" /></script>

    <script type="text/javascript"> 
		$(document).ready(function() {
			
			var songEntry = {};
			songEntry.lyricsAndChords = {};
			songEntry.videos = [];
			songEntry.lyricsAndChords.chordPositions = [];
			songEntry.lyricsAndChords.lyrics = {};

			$('#submit-tablature').click(function(ev) {
				ev.preventDefault();
				alert("CHORDS: " + JSON.stringify(songEntry));
			});
			
			// Autosuggest for the name field
			$.ajax({
				type: "GET",
				url: "/one-note/songentrys/search?q=&json=true",	
			
				success: function(json) {
					var songsResults = json;
					
					// Autosuggest for the name field
					$("input[type=text].autosuggest-title").tokenInput(songsResults, {
						theme: "facebook",
						propertyToSearch: "value",
						tokenLimit: 1,
						hintText: "Type a song title",
				        noResultsText: "No results found.",
				        searchingText: "Searching...",
				        tokenDelimiter: "_",
				        onAdd: function (item) {
		                    // Search for lyrics
		                    findLyricsForSong(item.value);
		                    
		                    // Search for videos
		                    $('#videos-sidebar').show();
		                    searchVideo(item.value + " cover piano");
		                },
					});	
				}
			});
			
			
			var findLyricsForSong = function(songTitle) {
				$('#explanation-steps').hide();
				$.ajax({
					type: "GET",
					url: "/one-note/tablatures/lyrics?song=" + songTitle + "&json=true",	
				
					success: function(json) {
						songEntry.title = songTitle;
						songEntry.lyricsAndChords.lyrics = json;
						var song = json;
						$('#song-title').text(song.title);
						var lyricsText = "";
						var verses = song.lyrics.verses;
						for (var i=0; i<verses.length; i++) {
							var verse = verses[i];
							for (var j=0; j<verse.lines.length; j++) {
								var line = verse.lines[j];
								var words = line.split(" ");
								
								lyricsText = lyricsText + "<p>";
								for (var k=0; k<words.length; k++) {
									var word = words[k];
									var pos = "v"+i+"-l"+j+"-w"+k;
									lyricsText = lyricsText + '<span position="' + pos + '" class="chordable">' + word + "</span> ";
								}
								lyricsText = lyricsText + "</p>";
								
							}
							lyricsText = lyricsText + "<br/>";
						}
						$('#lyrics-area').html(lyricsText);
						$('#submit-tablature').show();
						
						$('.chordable').click(function(ev) {
							alert($(this).text() + " is clicked. Position " + $(this).attr("position"));
							var chord = prompt("Please enter a chord","");

							if (chord != null) {
								$(this).text($(this).text() + " (" + chord + ")");
							}
							
							var chordPosition = {
								chord: chord,
								position: pos
							};
							songEntry.lyricsAndChords.chordPositions.push(chordPosition);
							alert("CHORDS: " + JSON.stringify(songEntry.lyricsAndChords));
						});
						
						var config = {
								'q':'Madonna', 
								'videosBlock':'video-search-area',
								'type':'search',
								'results':8,
								'order':'most_relevance',
								'player':'embed',
								'layout':'thumbnails',
								'titleLength' : 40,
								'addLabel' : 'Add to short list',
								'removeLabel' : 'Remove from short list',
								'keepBlock' : '',
								'callback' : 'displayVideos',
								'videoSearchEnabled' : 'true',
								'mainVideoBlock' : 'playing-video-area',
						};
					
					    setupGoogleVideoSearch(config);
					}
				});
			};
			
			var cb = function(searchResults) {
				displayMainVideo(searchResults[0]);
				
				for (var i=0; i<searchResults.length; i++) {
					songEntry.videos.push(searchResults[i].playUrl);
				}
			};
			
			function searchVideo(searchTerm) {
				var config = {
						'q':searchTerm, 
						'block':'youtubeDiv',
						'type':'search',
						'results':8,
						'order':'most_relevance',
						'player':'embed',
						'layout':'thumbnails',
						'titleLength' : 40,
						'addLabel' : 'Add to short list',
						'removeLabel' : 'Remove from short list',
						'keepBlock' : '',
						'callback' : 'displayVideos',
						'videoPlaybackBlock' : 'videosArea' 
						
				};
				
				searchVideos(searchTerm, cb);
				
				// populate the input box
				$('input.gsc-input').val(searchTerm);
				
				//insertVideos(config);
			};
			
		});
		
		function loadVideo(playerUrl, autoplay, title) {
			  alert("In Load Video");
			  var iframeHtml = '<iframe width="530" height="315" src="' + playerUrl + '" frameborder="0" allowfullscreen></iframe>';
			  document.getElementById('playing-video-area').innerHTML = iframeHtml;
		};
		
	</script>
  </body>
</html>
