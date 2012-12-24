package org.one.note.noted.domain.beans;

public class AutocompleteVO {
	
	private String value;
	private String key;
	
	public AutocompleteVO(String value, String key) {
		super();
		this.value = value;
		this.key = key;
	}

	public String getValue() {
		return value;
	}
	
	public void setValue(String value) {
		this.value = value;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	
	

}
