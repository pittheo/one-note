package org.one.note.noted.web;

import java.util.ArrayList;
import java.util.List;

import org.one.note.noted.domain.Tablature;
import org.one.note.noted.domain.beans.LyricsBean;
import org.one.note.noted.domain.beans.SongBean;
import org.one.note.noted.domain.beans.UserBean;
import org.one.note.noted.domain.beans.VerseBean;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RooWebScaffold(path = "tablatures", formBackingObject = Tablature.class)
@RequestMapping("/tablatures")
@Controller
public class TablatureController {
	
	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String createForm(Model uiModel) {
        uiModel.addAttribute("tablature", new Tablature());
        String lyrics = "Slip inside the eye of your mind";
        String[] lyricsArray = lyrics.split("\\s");
        System.out.println("Lyrics Array has length of " + lyricsArray.length);
        uiModel.addAttribute("lyrics", lyricsArray);
        return "tablatures/create";
    }
	
	@RequestMapping(value="/lyrics", params = "song", method = RequestMethod.GET)
    public @ResponseBody SongBean getLyricsForSong(@RequestParam String song, Model uiModel) {
		// Get the song from a file
		
		// Return json
		SongBean songBean = new SongBean(song);
		songBean.setArtist("Kelly Clarkson");
		UserBean authorBean = new UserBean();
		authorBean.setUsername("JohnDoe");
		songBean.setAuthor(authorBean);
		songBean.setLyrics(generateLyrics());
		return songBean;
    }

	private LyricsBean generateLyrics() {
		LyricsBean lyrics = new LyricsBean();
		List<VerseBean> verses = new ArrayList<VerseBean>();
		VerseBean verse = new VerseBean();
		verse.addLine("Seems like just yesterday");
		verse.addLine("You were a part of me");
		verse.addLine("I used to stand so tall");
		verse.addLine("I used to be so strong");
		verse.addLine("Your arms around me tight");
		verse.addLine("Everything, it felt so right");
		verse.addLine("Unbreakable like nothing could go wrong");
		verses.add(verse);
		
		verse = new VerseBean();
		verse.addLine("Now I can't breathe");
		verse.addLine("No, I can't sleep");
		verse.addLine("I'm barely hanging on");
		verses.add(verse);
		
		lyrics.setVerses(verses);
		return lyrics;
	}
	
	
}
