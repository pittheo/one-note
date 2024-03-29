// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.one.note.noted.domain.UserProfileDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserProfileIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserProfileIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserProfileIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: UserProfileIntegrationTest: @Transactional;
    
    @Autowired
    private UserProfileDataOnDemand UserProfileIntegrationTest.dod;
    
    @Test
    public void UserProfileIntegrationTest.testCountUserProfiles() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to initialize correctly", dod.getRandomUserProfile());
        long count = org.one.note.noted.domain.UserProfile.countUserProfiles();
        org.junit.Assert.assertTrue("Counter for 'UserProfile' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserProfileIntegrationTest.testFindUserProfile() {
        org.one.note.noted.domain.UserProfile obj = dod.getRandomUserProfile();
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.UserProfile.findUserProfile(id);
        org.junit.Assert.assertNotNull("Find method for 'UserProfile' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'UserProfile' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UserProfileIntegrationTest.testFindAllUserProfiles() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to initialize correctly", dod.getRandomUserProfile());
        long count = org.one.note.noted.domain.UserProfile.countUserProfiles();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'UserProfile', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.one.note.noted.domain.UserProfile> result = org.one.note.noted.domain.UserProfile.findAllUserProfiles();
        org.junit.Assert.assertNotNull("Find all method for 'UserProfile' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'UserProfile' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserProfileIntegrationTest.testFindUserProfileEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to initialize correctly", dod.getRandomUserProfile());
        long count = org.one.note.noted.domain.UserProfile.countUserProfiles();
        if (count > 20) count = 20;
        java.util.List<org.one.note.noted.domain.UserProfile> result = org.one.note.noted.domain.UserProfile.findUserProfileEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'UserProfile' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'UserProfile' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UserProfileIntegrationTest.testFlush() {
        org.one.note.noted.domain.UserProfile obj = dod.getRandomUserProfile();
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.UserProfile.findUserProfile(id);
        org.junit.Assert.assertNotNull("Find method for 'UserProfile' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserProfile(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'UserProfile' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserProfileIntegrationTest.testMerge() {
        org.one.note.noted.domain.UserProfile obj = dod.getRandomUserProfile();
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.UserProfile.findUserProfile(id);
        boolean modified =  dod.modifyUserProfile(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.one.note.noted.domain.UserProfile merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'UserProfile' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserProfileIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to initialize correctly", dod.getRandomUserProfile());
        org.one.note.noted.domain.UserProfile obj = dod.getNewTransientUserProfile(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'UserProfile' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'UserProfile' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UserProfileIntegrationTest.testRemove() {
        org.one.note.noted.domain.UserProfile obj = dod.getRandomUserProfile();
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'UserProfile' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.UserProfile.findUserProfile(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'UserProfile' with identifier '" + id + "'", org.one.note.noted.domain.UserProfile.findUserProfile(id));
    }
    
}
