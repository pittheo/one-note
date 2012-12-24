
	var timer; //needed to loop through thumbnails
	var _config = {};
	
	var getVideoId = function(url) {
	    var match_start = url.indexOf('=');
	    var match_end = url.indexOf('&');
	    if (match_start) {
	      id = url.substring(match_start+1,match_end);
	      return id;
	    }
	};
	
	var clearList = function(ul) {
		var list = document.getElementById(ul);
		while (list.firstChild) 
		 {
		    list.removeChild(list.firstChild);
		 }		
	};
	
	var hideOverlay = function() {
		var overlay = document.getElementById('embed_overlay');
		overlay.style.display = 'none';
		overlay.innerHTML = "";
	};
	
	var ytPlayerDiv;
	var ytPlayer = {};
	var videoOverlay = function(id,block) {
		alert("In videoOverlay for " + id + " at " + block);
		if(!ytPlayer[block]){
			var objBody = document.getElementById(block);
			ytPlayerDiv = document.createElement('div');
			ytPlayerDiv.setAttribute("id", block+"_video");
			objBody.insertBefore(ytPlayerDiv, objBody.firstChild);
			ytPlayer[block] = true;
		}
		ytPlayerDiv.innerHTML = "Loading video player... <a href=\"http://www.youtube.com/watch?v="+id+"\">Not Loading?</a>";
		var flashvars = {};
		var params = {};
		params.wmode = "transparent";
		params.allowfullscreen = "true";
		var attributes = {};
	
		alert("block: " + block);
		//create flash object.
		if(swfobject){
			alert("swfobject: " + swfobject);
			swfobject.embedSWF("http://www.youtube.com/v/"+id, block+"_video", "310", "320", "8", "false", flashvars, params, attributes);
		}else{
			//no SwfObject JS include
			alert("NO SWF OBJECT. JS INCLUDE");
			ytPlayerDiv.innerHTML = '<div id="embed_overlay"><a href="javascript:hideOverlay()" id="close">Close</a><br /><object width="310" height="320"><param name="movie" value="http://www.youtube.com/v/'+id+'"><param name="autoplay" value="1"><param name="wmode" value="transparent"><embed src="http://www.youtube.com/v/'+id+'&autoplay=1" type="application/x-shockwave-flash" wmode="transparent" width="310" height="320"></embed></object></div>';
		}
	};
	
	var mousOverImage = function(name,id,nr) {
	
		if(name)
			imname = name;
		//make border orange
		imname.style.borderColor = 	'orange';
	
		imname.src = "http://img.youtube.com/vi/"+id+"/"+nr+".jpg";
		nr++;
		if(nr > 3)
			nr = 1;
		timer =  setTimeout("mousOverImage(false,'"+id+"',"+nr+");",1000);
	
	};
	
	var mouseOutImage = function(name,border) {
	
		if(name) {
			imname = name;
		}
		//make border back to greyish
		imname.style.border = border;
		if(timer) {
			clearTimeout(timer);
		}
	};
	
	//var loadVideo = function(playerUrl, autoplay) {
	//	  swfobject.embedSWF(
	//	      playerUrl + '&rel=1&border=0&fs=1&autoplay=' + 
	//	      (autoplay?1:0), 'player', '290', '250', '9.0.0', false, 
	//	      false, {allowfullscreen: 'true'});
	//};
	
	var listVideos = function(json) {
		if(!_config.player){
			_config.player = 'embed';
		}
		if(!_config.layout){
			_config.layout = 'full';
		}
	
	  div = document.getElementById(_config.block);
	  div.innerHTML = ''; //empty
	  
	  var ul = document.createElement('ul');
	  ul.setAttribute('id', 'youtubelist');
	  if(json.feed.entry){
		  for (var i = 0; i < json.feed.entry.length; i++) {
		    var entry = json.feed.entry[i];
		    var title = entry.title.$t.substr(0, 15);
		    for (var k = 0; k < entry.link.length; k++) {
		      if (entry.link[k].rel == 'alternate') {
		        url = entry.link[k].href;
		        break;
		      }
		    }
	   	
	
	   	var thumb = entry['media$group']['media$thumbnail'][1].url;
	
	    var li = document.createElement('li');
		//var overlayLink = 'javascript:videoOverlay(\''+getVideoId(url)+'\',\''+_config.block+'\');';
	    var overlayLink = 'javascript:videoOverlay(\''+getVideoId(url)+'\',\''+_config.block+'\');';
	
	    if(_config.layout == 'thumbnails'){
	
			if(_config.player ==  'embed'){
	        	li.innerHTML = '<a href="'+overlayLink+'"><img style="border:'+_config.imgstyle+'" src="'+thumb+'" alt="'+entry.title.$t+'"  onmouseout="mouseOutImage(this,\''+_config.imgstyle+'\')" onmouseover="mousOverImage(this,\''+getVideoId(url)+'\',2)"></a>';
			}else{
				//_config.player = link
	        	li.innerHTML = '<a href="'+url+'"><img style="border:'+_config.imgstyle+'" src="'+thumb+'" alt="'+entry.title.$t+'" onmouseout="mouseOutImage(this,\''+_config.imgstyle+'\')" onmouseover="mousOverImage(this,\''+getVideoId(url)+'\',2)"></a>';
			}
	    } else {
			//_config.layout = full
			if(_config.player ==  'embed'){
				li.innerHTML = entry.content.$t.replace(url,overlayLink);
			} else {
				//_config.player = link
				li.innerHTML = entry.content.$t;
			}
	    }	
	
	    ul.appendChild(li);
		}
	  } else {
	  	div.innerHTML = 'No Youtube videos found for your query:<br>Type:\''+_config.type+'\'<br>Query: \''+cgf.q+'\'';
	  }
	
	  div.appendChild(ul);
	};
	
	
	
		
	function loadVideo(playerUrl, autoplay, title) {
		  alert("In Load Video");
		  if(!_config.videoPlaybackBlock) {
			_config.videoPlaybackBlock = 'primaryVideo';
		  }
		  //swfobject.embedSWF(
		  //    playerUrl + '&rel=1&border=0&fs=1&autoplay=' + 
		  //    (autoplay?1:0), 'player', '500', '420', '9.0.0', false, 
		  //    false, {allowfullscreen: 'true'});
		  var iframeHtml = '<iframe width="530" height="315" src="' + playerUrl + '" frameborder="0" allowfullscreen></iframe>';
		  document.getElementById(_config.videoPlaybackBlock).innerHTML = iframeHtml;
		  //$("#video-modal").dialog({
		//	  	width: 540,
		//	  	height: 500,
		//		modal: true,
		//		title: title
		 // });
	
	};

	function displayVideos(data) {
		alert("in show");
		if(!_config.player) {
			_config.player = 'embed';
		}
		if(!_config.layout) {
			_config.layout = 'full';
		}
		if(!_config.titleLength) {
			_config.titleLength = 20;
		}
		if(!_config.addLabel) {
			_config.addLabel = 'Add';
		}
		if(!_config.removeLabel) {
			_config.removeLabel = 'Remove';
		}
		
	  var feed = data.feed;
	  var entries = feed.entry || [];
	  var html = ['<ul class="videos">'];
	  for (var i = 0; i < entries.length; i++) {
	    var entry = entries[i];
	    var fullTitle = entry.title.$t;
	    var shortTitle = fullTitle.substr(0, _config.titleLength);
	    var thumbnailUrl = entries[i].media$group.media$thumbnail[0].url;
	    var playerUrl = entries[i].media$group.media$content[0].url;
	    html.push('<li>',
	              '<span class="titlec" onclick="loadVideo(\'', playerUrl, '\', true, \'' + shortTitle + '\')">', shortTitle, '...</span><br /><img onclick="loadVideo(\'', playerUrl, '\', true, \'' + fullTitle + '\')" src="', 
	              thumbnailUrl, '" width="170" height="137"/>', '</span>',
	              "<span id=\"0\" class=\'addVideo\'>" + _config.addLabel + "</span></li>");
	  }
	  html.push('</ul><br style="clear: left;"/>');
	  document.getElementById(_config.block).innerHTML = html.join('');
	  //if (entries.length > 0) {
	  //  loadVideo(entries[0].media$group.media$content[0].url, false);
	  //}
	};

	
	
	
	
	var ytQuery = 0;
	var ytInit = {};
	
	var insertVideos = function(config) {
		if(config) {
			_config = config; 	
		}
		if(!_config.block) {
			console.error("You should provide a block element. For example a div for the results to go into.");
		} else { 
			if(!_config.type) {
				document.getElementById(_config.block).innerHTML = 'You must provide a type: search, user, playlist, featured in the insertVideos function.';
			} else {
				document.getElementById(_config.block).innerHTML = 'Loading YouTube videos. Please wait...';
				//create a javascript element that returns our JSON data.
				var script = document.createElement('script');
				script.setAttribute('id', 'jsonScript');
				script.setAttribute('type', 'text/javascript');
				
				//a counter
				ytQuery++; 
				
				if(!_config.results) {
					_config.results = 10;
				}
				if(!_config.order){
					_config.orderby = 'relevance';
					_config.sortorder = 'descending';
				}
				
				if(!_config.callback) {
					_config.callback = 'ytInit';
				}
				
				switch(_config.order){
					case "new_first":
					_config.orderby = 'published';
					_config.sortorder = 'ascending';				
					break;
					
					case "highest_rating":
					_config.orderby = 'rating';
					_config.sortorder = 'descending';				
					break;
					
					case "most_relevance":
					_config.orderby = 'relevance';
					_config.sortorder = 'descending';				
					break;
				}
					
				//what data do we need: a search, a user search, a playlist
				switch(_config.type) {
					case "search":
					script.setAttribute('src', 'http://gdata.youtube.com/feeds/videos?vq='+_config.q+'&max-results='+_config.results+'&alt=json-in-script&callback='+_config.callback+'&orderby='+_config.orderby+'&sortorder='+_config.sortorder);
					break;
			
					case "user":
					script.setAttribute('src', 'http://gdata.youtube.com/feeds/users/'+_config.q+'/uploads?max-results='+_config.results+'&alt=json-in-script&callback='+_config.callback+'&orderby='+_config.orderby+'&sortorder='+_config.sortorder);
					break;
					
					case "playlist":
					script.setAttribute('src', 'http://gdata.youtube.com/feeds/playlists/'+_config.q+'?max-results='+_config.results+'&alt=json-in-script&callback='+_config.callback+'&orderby='+_config.orderby+'&sortorder='+_config.sortorder);
					break;
					
					case "featured":
					script.setAttribute('src', 'http://gdata.youtube.com/feeds/api/standardfeeds/recently_featured?alt=json-in-script&callback='+_config.callback+'&start-index=1&max-results='+_config.results+'&orderby='+_config.orderby+'&sortorder='+_config.sortorder);
					break;
			
				}	
			
				//ytInit[ytQuery] = function(root) { listVideos(root,_config);  };
				//ytInit[ytQuery] = function(root) {
				// 	alert("in ytInit");
				//	showMyVideos2(root);  
				//};
				//attach script to page, this will load the data into our page and call the funtion ytInit[ytQuery]
				document.documentElement.firstChild.appendChild(script);
			};
		};
	};
