// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.domain;

import java.lang.String;

privileged aspect Tablature_Roo_ToString {
    
    public String Tablature.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ArtistName: ").append(getArtistName()).append(", ");
        sb.append("Author: ").append(getAuthor()).append(", ");
        sb.append("CreatedAt: ").append(getCreatedAt()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("LastModifiedAt: ").append(getLastModifiedAt()).append(", ");
        sb.append("Lines: ").append(getLines() == null ? "null" : getLines().size()).append(", ");
        sb.append("SongTitle: ").append(getSongTitle()).append(", ");
        sb.append("ThumbnailPath: ").append(getThumbnailPath()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
