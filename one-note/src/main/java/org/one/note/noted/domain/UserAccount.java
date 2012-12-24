package org.one.note.noted.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.one.note.noted.domain.UserProfile;
import javax.persistence.ManyToOne;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findUserAccountsByUsernameEqualsAndPasswordEquals", "findUserAccountsByUsernameLike", "findUserAccountsByEmailEqualsAndPasswordEquals", "findUserAccountsByEmailEquals", "findUserAccountsByVerifiedNot", "findUserAccountsByUsernameEquals" })
@RooJson
public class UserAccount {

    @NotNull
    @Size(min = 2)
    private String username;

    @NotNull
    @Size(min = 2)
    private String password;

    @NotNull
    @Size(min = 2)
    private String hash;

    private transient String emailRetype;

    private Boolean verified;

    @NotNull
    @Size(min = 2)
    private String email;

    @ManyToOne
    private UserProfile profile;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date createdAt;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date verifiedAt;
}
