package org.one.note.noted.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
@RooJson
public class SongEntry {

    @ManyToOne
    private Tablature tablature;

    @ManyToMany(cascade = CascadeType.ALL)
    private List<VideoEntry> videos = new ArrayList<VideoEntry>();
}
