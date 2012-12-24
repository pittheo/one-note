package org.one.note.noted.domain.beans;

public class UserBean {
	
	private Long id;
	private String username;
	private String thumbnailUrl;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	@Override
	public String toString() {
		return "UserBean [id=" + id + ", username=" + username
				+ ", thumbnailUrl=" + thumbnailUrl + "]";
	}
		
	

}
