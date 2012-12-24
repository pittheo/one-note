package org.one.note.noted.domain.beans;

import java.util.ArrayList;
import java.util.List;

public class LyricsBean {
	
	private List<VerseBean> verses;
	
	public LyricsBean() {
		super();
		verses = new ArrayList<VerseBean>();
	}

	public List<VerseBean> getVerses() {
		return verses;
	}

	public void setVerses(List<VerseBean> verses) {
		this.verses = verses;
	}

	

	

}
