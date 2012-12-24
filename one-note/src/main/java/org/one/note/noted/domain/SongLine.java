package org.one.note.noted.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;
import org.one.note.noted.domain.ChordPosition;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooEntity
@RooJson
public class SongLine {

    @NotNull
    @Size(min = 2)
    private String lyrics;

    @NotNull
    private Integer ordering;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<ChordPosition> chordPositions = new HashSet<ChordPosition>();
}
