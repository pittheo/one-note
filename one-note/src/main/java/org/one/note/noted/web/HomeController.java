package org.one.note.noted.web;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.one.note.noted.domain.SongEntry;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RequestMapping("/")
@Controller
public class HomeController {

	@RequestMapping(value = "/contactUs", method = RequestMethod.GET)
    public String createForm(Model uiModel) {
        return "/contact";
    }
	
	@RequestMapping(value = "/most-popular", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public List<SongEntry> getMostPopularSongs(Model uiModel) {
		// Search the database for the most popular song entries
		List<SongEntry> mostPopularEntries = SongEntry.findAllSongEntrys();
		// Return json
		return mostPopularEntries;
    }



	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }

}
