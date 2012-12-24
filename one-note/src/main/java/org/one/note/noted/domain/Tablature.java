package org.one.note.noted.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.one.note.noted.domain.UserAccount;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;
import java.util.Set;
import org.one.note.noted.domain.SongLine;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooEntity
@RooJson
public class Tablature {

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date createdAt;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date lastModifiedAt;

    @ManyToOne
    private UserAccount author;

    @NotNull
    @Size(min = 2)
    private String songTitle;

    @NotNull
    @Size(min = 2)
    private String artistName;

    @NotNull
    private String thumbnailPath;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<SongLine> lines = new HashSet<SongLine>();
}
