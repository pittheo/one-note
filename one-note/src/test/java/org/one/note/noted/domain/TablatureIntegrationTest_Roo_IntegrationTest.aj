// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.one.note.noted.domain.TablatureDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TablatureIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TablatureIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TablatureIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: TablatureIntegrationTest: @Transactional;
    
    @Autowired
    private TablatureDataOnDemand TablatureIntegrationTest.dod;
    
    @Test
    public void TablatureIntegrationTest.testCountTablatures() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to initialize correctly", dod.getRandomTablature());
        long count = org.one.note.noted.domain.Tablature.countTablatures();
        org.junit.Assert.assertTrue("Counter for 'Tablature' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TablatureIntegrationTest.testFindTablature() {
        org.one.note.noted.domain.Tablature obj = dod.getRandomTablature();
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.Tablature.findTablature(id);
        org.junit.Assert.assertNotNull("Find method for 'Tablature' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Tablature' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TablatureIntegrationTest.testFindAllTablatures() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to initialize correctly", dod.getRandomTablature());
        long count = org.one.note.noted.domain.Tablature.countTablatures();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Tablature', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.one.note.noted.domain.Tablature> result = org.one.note.noted.domain.Tablature.findAllTablatures();
        org.junit.Assert.assertNotNull("Find all method for 'Tablature' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Tablature' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TablatureIntegrationTest.testFindTablatureEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to initialize correctly", dod.getRandomTablature());
        long count = org.one.note.noted.domain.Tablature.countTablatures();
        if (count > 20) count = 20;
        java.util.List<org.one.note.noted.domain.Tablature> result = org.one.note.noted.domain.Tablature.findTablatureEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Tablature' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Tablature' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TablatureIntegrationTest.testFlush() {
        org.one.note.noted.domain.Tablature obj = dod.getRandomTablature();
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.Tablature.findTablature(id);
        org.junit.Assert.assertNotNull("Find method for 'Tablature' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTablature(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Tablature' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TablatureIntegrationTest.testMerge() {
        org.one.note.noted.domain.Tablature obj = dod.getRandomTablature();
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.Tablature.findTablature(id);
        boolean modified =  dod.modifyTablature(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.one.note.noted.domain.Tablature merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Tablature' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TablatureIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to initialize correctly", dod.getRandomTablature());
        org.one.note.noted.domain.Tablature obj = dod.getNewTransientTablature(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Tablature' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Tablature' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TablatureIntegrationTest.testRemove() {
        org.one.note.noted.domain.Tablature obj = dod.getRandomTablature();
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tablature' failed to provide an identifier", id);
        obj = org.one.note.noted.domain.Tablature.findTablature(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Tablature' with identifier '" + id + "'", org.one.note.noted.domain.Tablature.findTablature(id));
    }
    
}
