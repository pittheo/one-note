// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.web;

import java.lang.String;
import org.one.note.noted.domain.ChordPosition;
import org.one.note.noted.domain.Comment;
import org.one.note.noted.domain.SongLine;
import org.one.note.noted.domain.Tablature;
import org.one.note.noted.domain.UserAccount;
import org.one.note.noted.domain.UserProfile;
import org.one.note.noted.domain.VideoEntry;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(new ChordPositionConverter());
        registry.addConverter(new CommentConverter());
        registry.addConverter(new SongLineConverter());
        registry.addConverter(new TablatureConverter());
        registry.addConverter(new UserAccountConverter());
        registry.addConverter(new UserProfileConverter());
        registry.addConverter(new VideoEntryConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
    static class org.one.note.noted.web.ApplicationConversionServiceFactoryBean.ChordPositionConverter implements Converter<ChordPosition, String> {
        public String convert(ChordPosition chordPosition) {
            return new StringBuilder().append(chordPosition.getChord()).append(" ").append(chordPosition.getPos()).toString();
        }
        
    }
    
    static class org.one.note.noted.web.ApplicationConversionServiceFactoryBean.CommentConverter implements Converter<Comment, String> {
        public String convert(Comment comment) {
            return new StringBuilder().append(comment.getContent()).append(" ").append(comment.getCreatedAt()).append(" ").append(comment.getLastModifiedAt()).append(" ").append(comment.getTitle()).toString();
        }
        
    }
    
    static class org.one.note.noted.web.ApplicationConversionServiceFactoryBean.SongLineConverter implements Converter<SongLine, String> {
        public String convert(SongLine songLine) {
            return new StringBuilder().append(songLine.getLyrics()).append(" ").append(songLine.getOrdering()).toString();
        }
        
    }
    
    static class org.one.note.noted.web.ApplicationConversionServiceFactoryBean.TablatureConverter implements Converter<Tablature, String> {
        public String convert(Tablature tablature) {
            return new StringBuilder().append(tablature.getCreatedAt()).append(" ").append(tablature.getLastModifiedAt()).append(" ").append(tablature.getSongTitle()).append(" ").append(tablature.getArtistName()).toString();
        }
        
    }
    
    static class org.one.note.noted.web.ApplicationConversionServiceFactoryBean.UserAccountConverter implements Converter<UserAccount, String> {
        public String convert(UserAccount userAccount) {
            return new StringBuilder().append(userAccount.getUsername()).append(" ").append(userAccount.getPassword()).append(" ").append(userAccount.getHash()).append(" ").append(userAccount.getEmail()).toString();
        }
        
    }
    
    static class org.one.note.noted.web.ApplicationConversionServiceFactoryBean.UserProfileConverter implements Converter<UserProfile, String> {
        public String convert(UserProfile userProfile) {
            return new StringBuilder().append(userProfile.getFirstName()).append(" ").append(userProfile.getSurname()).append(" ").append(userProfile.getLocationName()).append(" ").append(userProfile.getCoordX()).toString();
        }
        
    }
    
    static class org.one.note.noted.web.ApplicationConversionServiceFactoryBean.VideoEntryConverter implements Converter<VideoEntry, String> {
        public String convert(VideoEntry videoEntry) {
            return new StringBuilder().append(videoEntry.getAddedAt()).append(" ").append(videoEntry.getUrl()).append(" ").append(videoEntry.getUpVotes()).append(" ").append(videoEntry.getDownVotes()).toString();
        }
        
    }
    
}