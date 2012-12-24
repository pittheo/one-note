package org.one.note.noted.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.one.note.noted.domain.UserAccount;
import javax.persistence.ManyToOne;
import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooEntity
@RooJson
public class VideoEntry {

    @ManyToOne
    private UserAccount author;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date addedAt;

    @NotNull
    @Size(min = 2)
    private String url;

    @NotNull
    private Integer upVotes;

    @NotNull
    private Integer downVotes;

    @NotNull
    @Size(min = 2)
    private String thumbnailUrl;
}
