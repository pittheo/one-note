package org.one.note.noted.domain.beans;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

public class VerseBean {
	
	@JsonProperty("linesList")
	private List<String> lines;
	
	public VerseBean() {
		super();
		lines = new ArrayList<String>();
	}

	public List<String> getLines() {
		return lines;
	}

	public void setLines(List<String> lines) {
		this.lines = lines;
	}
	
	public void addLine(String line) {
		this.lines.add(line);
	}

	@Override
	public String toString() {
		return "VerseBean [lines=" + lines + "]";
	}
	
}
