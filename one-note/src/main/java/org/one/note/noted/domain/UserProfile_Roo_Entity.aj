// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.one.note.noted.domain.UserProfile;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserProfile_Roo_Entity {
    
    declare @type: UserProfile: @Entity;
    
    @PersistenceContext
    transient EntityManager UserProfile.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long UserProfile.id;
    
    @Version
    @Column(name = "version")
    private Integer UserProfile.version;
    
    public Long UserProfile.getId() {
        return this.id;
    }
    
    public void UserProfile.setId(Long id) {
        this.id = id;
    }
    
    public Integer UserProfile.getVersion() {
        return this.version;
    }
    
    public void UserProfile.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserProfile.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserProfile.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserProfile attached = UserProfile.findUserProfile(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserProfile.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserProfile.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public UserProfile UserProfile.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserProfile merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager UserProfile.entityManager() {
        EntityManager em = new UserProfile().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserProfile.countUserProfiles() {
        return entityManager().createQuery("SELECT COUNT(o) FROM UserProfile o", Long.class).getSingleResult();
    }
    
    public static List<UserProfile> UserProfile.findAllUserProfiles() {
        return entityManager().createQuery("SELECT o FROM UserProfile o", UserProfile.class).getResultList();
    }
    
    public static UserProfile UserProfile.findUserProfile(Long id) {
        if (id == null) return null;
        return entityManager().find(UserProfile.class, id);
    }
    
    public static List<UserProfile> UserProfile.findUserProfileEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM UserProfile o", UserProfile.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
