    /*
    *  How to create a search box that automatically searches as the user types.
    */
    
    google.load('search', '1');
    
    var _config = {};
    
   
   	  //this.currentState_ = this.options_.startingState;
   	  if (google.loader.ClientLocation) {
		//alert("GEO LOCATE WAS SUCCESSFULL!");
		var loc = google.loader.ClientLocation;
		var address = google.loader.ClientLocation.address;
		//alert("My Location is: (" + loc.lat + ", " + loc.lng + ") - " + address.city + ", " + address.region + ", " + address.country);
		// geo locate was successful.
   	  } else {
   		//alert("GEO LOCATE WAS not SUCCESSFULL!");
   	  }
    
   	var markerSet = false;
	var map;
	var geocoder;
	
	var coordX;
	var coordY;
	var address;
	var country;
	var zoomLevel;

    
    var timerId;
    var imgInput;
    var videoInput;
    var localInput;
    var imgLastSearch = 0;
    var videoLastSearch = 0;
    var localLastSearch = 0;
    var imgContentDiv;
    var videoContentDiv;
    var localContentDiv;
    var keptItemsCounter = 0;
    var imgSearch;
    var videoSearch;
    var localSearch;
    
    function searchImages(query) {
      imgLastSearch++;
      imgSearch = new google.search.ImageSearch();
      imgSearch.setSearchCompleteCallback(this, imgSearchComplete, [imgSearch, imgLastSearch]);
      imgSearch.execute(query + " poster");
    }
    
    function searchVideos(query, callback) {
        //alert("Searching videos for " + query);
        videoLastSearch++;
        videoSearch = new google.search.VideoSearch();
        videoSearch.setSearchCompleteCallback(this, videoSearchComplete, [videoSearch,videoLastSearch,callback]);
        videoSearch.execute(query + " piano cover");
    }
    
    function searchLocal(query) {
        localLastSearch++;
        localSearch = new google.search.LocalSearch();
        localSearch.setCenterPoint("Greece");
        localSearch.setSearchCompleteCallback(this, localSearchComplete, [localSearch,localLastSearch]);
        localSearch.execute(query);
        
        searchVideos(query);
        searchImages(query);
    }
    
    function autoSearchImages() {
      // we're in the event's scope, that means this keyword = the input box.
      var query = this.value;
    
      // clear timer if there is one, set a new timer to do a search
      if (timerId) {
        window.clearTimeout(timerId);
        timerId = null;
      }
      timerId = window.setTimeout('searchImages(\'' + query + '\')', 250);
    }
    
    function autoSearchVideos() {
        // we're in the event's scope, that means this keyword = the input box.
        var query = this.value;
      
        // clear timer if there is one, set a new timer to do a search
        if (timerId) {
          window.clearTimeout(timerId);
          timerId = null;
        }
        timerId = window.setTimeout('searchVideos(\'' + query + '\', function(res) {})', 250);
      }
    
    function autoSearchLocal() {
        // we're in the event's scope, that means this keyword = the input box.
        var query = this.value;
      
        // clear timer if there is one, set a new timer to do a search
        if (timerId) {
          window.clearTimeout(timerId);
          timerId = null;
        }
        timerId = window.setTimeout('searchLocal(\'' + query + '\')', 250);
      }
    
    function removeFromKept(keptItemId) {
    	//$("#uploaded_media#" + keptItemId).
    	alert("to remove item " + keptItemId);
    	// Also delete the hidden fields. They should not be submitted!
    }
    
    function imageKeepHandler(url, thumbnailUrl, title) {
    	//alert("in keep handler!: " + videoPlayUrl + " -> " + thumbnailUrl);
    	keptItemsCounter++;
    	// Add the thumbnail Url into the uploadedImages section
    	var imgClass = "";
    	if (keptItemsCounter == 1) {
    		imgClass = "class='profile'";
    	}
    	
    	var prevHtml = $('#mediaToKeep ul').html();
    	
    	var newImageAddedString = "<li>" + "<a class='imgLink' href='" + url + "' title='" + title + "'>" +
    	"<img " + imgClass + " src='" + thumbnailUrl + "' width='60' height='72' alt='' />" + 
    	"</a>" +
    	"<div><a class='remove' id='" + keptItemsCounter + "' onclick=\"removeFromKept('" + keptItemsCounter + "'); return false;\" href=''>remove</a></div>" +
    	"</li>";
    	
    	// TODO: Add the hidden elements
    	$('#mediaToKeep ul').html(prevHtml + newImageAddedString);
    	//alert($('#mediaToKeep').html());
    	
    	//var uploadedVideosArea = document.getElementById('uploaded_media');
    	//uploadedVideosArea.appendChild(newResultsSpan);
    	
    	// Save info as hidden fields
    	// 1) name
    	// 2) image url
    	// 3) thumbnailurl
    	// Build a "####" separated string
    	var separator = "####";
    	var savedImageString = url + separator + title + separator + thumbnailUrl;
    	
    	var inputFieldString = "<input type=\"hidden\" name=\"savedImages\" value=\"" + savedImageString + "\">";
    	prevHtml = $('#mediaToKeep').html();
    	$('#mediaToKeep').html(prevHtml + inputFieldString);
    	
    	//if (keptItemsCounter == 1) {
        //	inputFieldString = "<input type=\"hidden\" name=\"profileImage\" value=\"" + savedImageString + "\">";
        //	prevHtml = $('#mediaToKeep').html();
        //	$('#mediaToKeep').html(prevHtml + inputFieldString);
    	//}
    	$('#mediaToKeep a.imgLink').fancybox();
    }
    
    function videoKeepHandler(videoPlayUrl, url, thumbnailUrl, title) {
    	keptItemsCounter++;
    	// Add the thumbnail Url into the uploadedImages section
    	var newResultsSpan = document.createElement('span');
    	
    	newResultsSpan.innerHTML = "<img id='" + keptItemsCounter + "' class='gs-kept-item' onclick=\"loadVideo('" + videoPlayUrl + "', 'true', '" + title + "')\" src='" + thumbnailUrl + "' width='60' height='45'></img>" +
    	"<span><a id='" + keptItemsCounter + "' onclick=\"removeFromKept('" + keptItemsCounter + "'); return false;\" href=''>remove</a></span>";
    	var uploadedVideosArea = document.getElementById('mediaToKeep');
    	uploadedVideosArea.appendChild(newResultsSpan);
    	
    	// Save info as hidden fields
    	// 1) name
    	// 2) video url
    	// 3) thumbnailurl
    	// Build a "####" separated string
    	var separator = "####";
    	var savedVideoString = url + separator + title + separator + thumbnailUrl;
    	//alert(savedVideoString);
    	//alert("items counter: " + keptItemsCounter);
    	
    	var inputFieldString = "<input type=\"hidden\" name=\"savedVideos\" value=\"" + savedVideoString + "\">";
    	var prevHtml = $('#mediaToKeep').html();
    	$('#mediaToKeep').html(prevHtml + inputFieldString);
    	
    	$('#mediaToKeep a.imgLink').fancybox();
    }
    
    
    var keepHandler = function(result) {
    	  var node = result.html.cloneNode(true);

    	  //if ( result.GsearchResultClass ==  GvideoSearch.RESULT_CLASS || result.GsearchResultClass ==  GimageSearch.RESULT_CLASS ) {
    	    // scale down the image
    	    var imgs = node.getElementsByTagName("img");
    	    var imageScaler = {width:60,height:45};
    	    for (var imageIndex=0; imageIndex < imgs.length; imageIndex++) {
    	      GSearch.scaleImage(result.tbWidth, result.tbHeight, imageScaler,imgs[imageIndex]);
    	    }
    	    this.clipCount++;
    	    this.messageClips.appendChild(node);
    	  //}
   	};

    
    
    
    function imgSearchComplete(searcher, searchNum) {
        // Only display results if this search was the last one done.
        if (searchNum == imgLastSearch) {
          // clear last search if it exists
          var lastResults = document.getElementById('results');
          if (lastResults) {
            lastResults.parentNode.removeChild(lastResults);
          }
      
          var results = searcher.results;
          var newResultsDiv = document.createElement('div');
          newResultsDiv.id = 'results';
          newResultsDiv.innerHTML += "<div class='gs-result gs-imgResult'><table>";
          for (var i = 0; i < results.length; i++) {
            var result = results[i];
            
            var title = result.titleNoFormatting;
            var thumbnailUrl = result.tbUrl;
            var datePublished = result.published;
            var publisher = result.publisher;
            var mediaUrl = result.url;
            
           var resultHTML = "<tr>" +      
            "<td class='gs-image-box'>" +
              "<div class='gs-image-box'>" +
                "<a class='gs-image' href='" + mediaUrl + "'>" +
                  "<img class='gs-image' src='" + thumbnailUrl + "'></img>" +
               "</a>" +
              "</div>" +
            "</td>" +
           " <td class='gs-text-box'>" +
              "<div class='gs-text-box'>" +
               " <div class='gs-title'>" +
               "   <a class='gs-title' href='" + mediaUrl + "'>" + title + "</a>" +
               " </div>" +
               " <div class='gs-snippet'></div>" +
              " <div class='gs-keep-item'>" +
                  "<a class='gs-keep' onclick=\"imageKeepHandler('" + result.url + "', '" + thumbnailUrl +"', '" + title + "'); return false;\" href=''>add this <img src='/betit/images/plus.gif'></a>" +
               " </div>" +
              "</div>" +
            "</td>" +
           "</tr>";
            
            
            newResultsDiv.innerHTML += resultHTML;
          }
          newResultsDiv.innerHTML += "</table></div>";
          imgContentDiv.appendChild(newResultsDiv); 

          // Enable the fancybox plugin
          $("#imgSearchContainer").find("#results").find(".gs-image-box").find("a").each(function(i) {
        	  $(this).fancybox();
          });
        }
      }
    
    
    function videoSearchComplete(searcher, searchNum, callback) {
        // Only display results if this search was the last one done.
        if (searchNum == videoLastSearch) {
          // clear last search if it exists
          var lastResults = document.getElementById('results');
          if (lastResults) {
            lastResults.parentNode.removeChild(lastResults);
          }
      
          var results = searcher.results;
          var newResultsDiv = document.createElement('div');
          newResultsDiv.id = 'results';
          newResultsDiv.innerHTML += "<div class='video-results'>";
          
          for (var i = 0; i < results.length; i++) {
            var result = results[i];
            
            var playerUrl = result.playUrl;
            var title = result.title;
            var thumbnailUrl = result.tbUrl;
            var datePublished = result.published.substring(0, 10);
            var publisher = result.publisher;
            // Collect the authors
			var author = result.author;
			
           var resultHTML = "<div class='video-item'>" +      
              "<div class='video-image'>" +
                "<a class='gs-image'>" +
                  "<img class='gs-image' onclick=\"loadVideo('" + playerUrl + "', 'true', '" + title + "')\" src='" + thumbnailUrl + "'></img>" +
               "</a>" +
             "<img class='subscribe' onclick=\"videoKeepHandler('" + playerUrl + "', '" + result.url + "', '" + thumbnailUrl +"', '" + title + "'); return false;\" src='../images/like-off.png'>" +
             "<span class='title'>" +
             "   <a class='gs-title' onclick=\"loadVideo('" + playerUrl + "', 'true', '" + title + "')\">" + title + "</a>" +
             " </span>" +
             "</div>" +
             "<div class='video-info'>" +
             "<div class='publication-date'>" + datePublished + "</div>" +
             " <div class='author'>" +
             "added by " +
             "<a href='" + author + "'>" + author +"</a>" +
             " </div>" +
              //" <div class='gs-keep-item'>" +
              //    "<a class='gs-keep' onclick=\"videoKeepHandler('" + playerUrl + "', '" + result.url + "', '" + thumbnailUrl +"', '" + title + "'); return false;\" href=''>add this <img src='/betit/images/plus.gif'></a>" +
              // " </div>" +
              "</div>" +
              "<div>";
            
            newResultsDiv.innerHTML += resultHTML;
          }
          newResultsDiv.innerHTML += "</div>";
          videoContentDiv.appendChild(newResultsDiv);
          callback(results);
        }
        
    }
    
    var displayMainVideo = function(res) {
    	var mainVideoBlock = document.getElementById(_config.mainVideoBlock); 
    	//var iframeHtml = '<iframe width="530" height="315" src="' + res.playUrl + '" frameborder="0" allowfullscreen></iframe>';
    	var iframeHtml = '<object width="530" height="315"><param name="movie" value="' + res.playUrl + '"><param name="allowFullScreen" value="true"><embed src="' + res.playUrl + '" type="application/x-shockwave-flash" allowfullscreen="true" width="530" height="315"></object>';
    	
		mainVideoBlock.innerHTML = iframeHtml;
    };
    
    

    
    
    function _onLoad(initialQuery) {
      //var searchControl = new google.search.SearchControl();
    
      // So the results are expanded by default
      //options = new google.search.SearcherOptions();
      //options.setExpandMode(google.search.SearchControl.EXPAND_MODE_OPEN);
    
      // Create a video searcher and add it to the control
      //searchControl.addSearcher(new google.search.VideoSearch(), options);
      //searchControl.draw(document.getElementById("video-search-area"));
      
      // Video Search
      videoContentDiv = document.getElementById('video-search-area');
      videoInput = new google.search.SearchForm(true, videoContentDiv);
      
      videoInput.input.onkeyup = autoSearchVideos;
      
      //videoInput.setOnSubmitCallback = function() {
      //  search(videoInput.input.value);
      //};
      if (initialQuery) {
      	searchVideos(initialQuery);
      }
      //searchControl.execute("ytchannel:NBA");
    }
    
    var setupGoogleVideoSearch = function(config) {
		if (config) {
			_config = config;
        	google.setOnLoadCallback(_onLoad(config.initialQuery));
		}
    };
