package org.one.note.noted.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooEntity
@RooJson
public class UserProfile {

    @NotNull
    @Size(min = 2)
    private String firstName;

    private String surname;

    private String locationName;

    private Float coordX;

    private Float coordY;

    private String website;

    @NotNull
    private String thumbnailPath;
}
