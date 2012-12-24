package org.one.note.noted.domain.beans;

public class SongBean {
	
	private Long id;
	private String title;
	private UserBean author;
	private String artist;
	
	private LyricsBean lyrics;
	
	public SongBean(String title) {
		super();
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public UserBean getAuthor() {
		return author;
	}

	public void setAuthor(UserBean author) {
		this.author = author;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public LyricsBean getLyrics() {
		return lyrics;
	}

	public void setLyrics(LyricsBean lyrics) {
		this.lyrics = lyrics;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	

	

}
