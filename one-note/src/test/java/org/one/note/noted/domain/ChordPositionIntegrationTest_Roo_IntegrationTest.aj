// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.one.note.noted.domain.ChordPositionDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ChordPositionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ChordPositionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ChordPositionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: ChordPositionIntegrationTest: @Transactional;
    
    @Autowired
    private ChordPositionDataOnDemand ChordPositionIntegrationTest.dod;
    
    @Test
    public void ChordPositionIntegrationTest.testCountChordPositions() {
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to initialize correctly", dod.getRandomChordPosition());
        long count = org.one.note.noted.domain.ChordPosition.countChordPositions();
        org.junit.Assert.assertTrue("Counter for 'ChordPosition' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ChordPositionIntegrationTest.testFindChordPosition() {
        org.one.note.noted.domain.ChordPosition obj = dod.getRandomChordPosition();
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.ChordPosition.findChordPosition(id);
        org.junit.Assert.assertNotNull("Find method for 'ChordPosition' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ChordPosition' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ChordPositionIntegrationTest.testFindAllChordPositions() {
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to initialize correctly", dod.getRandomChordPosition());
        long count = org.one.note.noted.domain.ChordPosition.countChordPositions();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ChordPosition', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.one.note.noted.domain.ChordPosition> result = org.one.note.noted.domain.ChordPosition.findAllChordPositions();
        org.junit.Assert.assertNotNull("Find all method for 'ChordPosition' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ChordPosition' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ChordPositionIntegrationTest.testFindChordPositionEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to initialize correctly", dod.getRandomChordPosition());
        long count = org.one.note.noted.domain.ChordPosition.countChordPositions();
        if (count > 20) count = 20;
        java.util.List<org.one.note.noted.domain.ChordPosition> result = org.one.note.noted.domain.ChordPosition.findChordPositionEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'ChordPosition' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ChordPosition' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ChordPositionIntegrationTest.testFlush() {
        org.one.note.noted.domain.ChordPosition obj = dod.getRandomChordPosition();
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.ChordPosition.findChordPosition(id);
        org.junit.Assert.assertNotNull("Find method for 'ChordPosition' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyChordPosition(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ChordPosition' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ChordPositionIntegrationTest.testMerge() {
        org.one.note.noted.domain.ChordPosition obj = dod.getRandomChordPosition();
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.ChordPosition.findChordPosition(id);
        boolean modified =  dod.modifyChordPosition(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.one.note.noted.domain.ChordPosition merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'ChordPosition' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ChordPositionIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to initialize correctly", dod.getRandomChordPosition());
        org.one.note.noted.domain.ChordPosition obj = dod.getNewTransientChordPosition("");
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ChordPosition' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ChordPosition' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ChordPositionIntegrationTest.testRemove() {
        org.one.note.noted.domain.ChordPosition obj = dod.getRandomChordPosition();
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ChordPosition' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.ChordPosition.findChordPosition(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'ChordPosition' with identifier '" + id + "'", org.one.note.noted.domain.ChordPosition.findChordPosition(id));
    }
    
}
