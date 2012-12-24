package org.one.note.noted.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.one.note.noted.domain.SongEntry;
import org.one.note.noted.domain.Tablature;
import org.one.note.noted.domain.VideoEntry;
import org.one.note.noted.domain.beans.AutocompleteVO;
import org.one.note.noted.domain.beans.SongBean;
import org.one.note.noted.domain.beans.UserBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/songentrys")
@Controller
public class SongEntryController {
	public static final Map<String, Integer> songMap = new HashMap<String, Integer>();
			
	static {
		songMap.put("Hit me baby one more time - Britney Spears", new Integer(1));
		songMap.put("Don't look back in anger - Oasis", new Integer(2));
		songMap.put("All Hands against his own - The Black Keys", new Integer(3));
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String show(@PathVariable("id") Long id, Model model) {
		SongEntry songEntry = SongEntry.findSongEntry(id);
		model.addAttribute("song", toSongBean(songEntry));
		
		return "songentrys/show";
    }
	
	@RequestMapping(method = RequestMethod.POST)
    public String addSongEntry(HttpServletRequest request, Model uiModel) {
		String title = request.getParameter("songTitle");
		String[] chordPositions = request.getParameterValues("chordPositions");
		String[] videoArray = request.getParameterValues("savedVideos");
		
		System.out.println("Title: " + title);
		System.out.println("Videos: " + videoArray);
		System.out.println("chordPositions: " + chordPositions);
		
		SongEntry songEntry = new SongEntry();
		
		Tablature tablature = new Tablature();
		//tablature.setArtistName(artistName);
		Date now = new Date();
		tablature.setCreatedAt(now);
		tablature.setLastModifiedAt(now);
		tablature.setSongTitle(title);
		songEntry.setTablature(tablature);
		
		// Persist the saved videos
		List<VideoEntry> videoEntries = new ArrayList<VideoEntry>();
		for (String videoPath : videoArray) {
			VideoEntry videoEntry = new VideoEntry();
			videoEntry.setThumbnailUrl(videoPath);
			videoEntries.add(videoEntry);
		}
		songEntry.setVideos(videoEntries);
		
		// songEntry.persist();
		
		return "redirect:/";
    }
	
	
	@RequestMapping(value="/similar", params = "song", method = RequestMethod.GET, headers = "Accept=application/json")
    public @ResponseBody List<SongEntry> getSimilarEntries(@RequestParam String song, Model uiModel) {
		// Search the database to see if there are any other song entries
		List<SongEntry> similarEntries = SongEntry.findAllSongEntrys();
		// Return json
		return similarEntries;
    }

	
	@RequestMapping(value = "/search", params = "json", method = RequestMethod.GET)
    public @ResponseBody List<AutocompleteVO> search(@RequestParam String q, HttpServletRequest request, HttpSession session) {
        System.out.println("SearchTerm: " + q);
        List<AutocompleteVO> matchingSongs = new ArrayList<AutocompleteVO>();

        for (String title : songMap.keySet()) {
        	AutocompleteVO song = new AutocompleteVO(title, String.valueOf(songMap.get(title)));
        	matchingSongs.add(song);
        }
		
		return matchingSongs;
	}
	
	private SongBean toSongBean(SongEntry songEntry) {
		SongBean songBean = new SongBean(songEntry.getTablature().getSongTitle());
    	songBean.setId(songEntry.getId());
    	songBean.setArtist(songEntry.getTablature().getArtistName());
    	UserBean authorBean = new UserBean();
    	authorBean.setUsername(songEntry.getTablature().getAuthor().getUsername());
    	authorBean.setThumbnailUrl(songEntry.getTablature().getAuthor().getProfile().getThumbnailPath());
    	authorBean.setId(songEntry.getTablature().getAuthor().getId());
    	songBean.setAuthor(authorBean);
    	return songBean;
	}
	
	/*private VideoInfo toVideoInfo(String videoString) {
		System.out.println(videoString);
		String[] videoArgs = videoString.split("####");
		
		// 1) Absolute url
		// 2) Title
		// 3) Thumbnail url
		String absoluteUrl = videoArgs[0];
		String imgTitle = videoArgs[1];
		String imgThumbnailUrl = videoArgs[2];
		String author = null;
		
		VideoInfo videoInfo = new VideoInfo();
		videoInfo.setOriginalPath(absoluteUrl);
		videoInfo.setTitle(imgTitle);
		videoInfo.setThumbnailPath(imgThumbnailUrl);
		videoInfo.setAuthor(author);
		videoInfo.setCreatedAt(new Date());
		
		return videoInfo;
	}*/
	
}
