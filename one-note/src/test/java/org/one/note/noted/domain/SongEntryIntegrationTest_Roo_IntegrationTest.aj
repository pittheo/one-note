// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.one.note.noted.domain.SongEntryDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SongEntryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SongEntryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SongEntryIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: SongEntryIntegrationTest: @Transactional;
    
    @Autowired
    private SongEntryDataOnDemand SongEntryIntegrationTest.dod;
    
    @Test
    public void SongEntryIntegrationTest.testCountSongEntrys() {
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to initialize correctly", dod.getRandomSongEntry());
        long count = org.one.note.noted.domain.SongEntry.countSongEntrys();
        org.junit.Assert.assertTrue("Counter for 'SongEntry' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SongEntryIntegrationTest.testFindSongEntry() {
        org.one.note.noted.domain.SongEntry obj = dod.getRandomSongEntry();
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.SongEntry.findSongEntry(id);
        org.junit.Assert.assertNotNull("Find method for 'SongEntry' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'SongEntry' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SongEntryIntegrationTest.testFindAllSongEntrys() {
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to initialize correctly", dod.getRandomSongEntry());
        long count = org.one.note.noted.domain.SongEntry.countSongEntrys();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'SongEntry', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.one.note.noted.domain.SongEntry> result = org.one.note.noted.domain.SongEntry.findAllSongEntrys();
        org.junit.Assert.assertNotNull("Find all method for 'SongEntry' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'SongEntry' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SongEntryIntegrationTest.testFindSongEntryEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to initialize correctly", dod.getRandomSongEntry());
        long count = org.one.note.noted.domain.SongEntry.countSongEntrys();
        if (count > 20) count = 20;
        java.util.List<org.one.note.noted.domain.SongEntry> result = org.one.note.noted.domain.SongEntry.findSongEntryEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'SongEntry' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'SongEntry' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SongEntryIntegrationTest.testFlush() {
        org.one.note.noted.domain.SongEntry obj = dod.getRandomSongEntry();
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.SongEntry.findSongEntry(id);
        org.junit.Assert.assertNotNull("Find method for 'SongEntry' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySongEntry(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'SongEntry' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SongEntryIntegrationTest.testMerge() {
        org.one.note.noted.domain.SongEntry obj = dod.getRandomSongEntry();
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.SongEntry.findSongEntry(id);
        boolean modified =  dod.modifySongEntry(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.one.note.noted.domain.SongEntry merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'SongEntry' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SongEntryIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to initialize correctly", dod.getRandomSongEntry());
        org.one.note.noted.domain.SongEntry obj = dod.getNewTransientSongEntry(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'SongEntry' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'SongEntry' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SongEntryIntegrationTest.testRemove() {
        org.one.note.noted.domain.SongEntry obj = dod.getRandomSongEntry();
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'SongEntry' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.SongEntry.findSongEntry(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'SongEntry' with identifier '" + id + "'", org.one.note.noted.domain.SongEntry.findSongEntry(id));
    }
    
}
