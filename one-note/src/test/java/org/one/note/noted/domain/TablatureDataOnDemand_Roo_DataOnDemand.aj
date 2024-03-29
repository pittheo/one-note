// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.domain;

import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.one.note.noted.domain.Tablature;
import org.one.note.noted.domain.UserAccount;
import org.one.note.noted.domain.UserAccountDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect TablatureDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TablatureDataOnDemand: @Component;
    
    private Random TablatureDataOnDemand.rnd = new SecureRandom();
    
    private List<Tablature> TablatureDataOnDemand.data;
    
    @Autowired
    private UserAccountDataOnDemand TablatureDataOnDemand.userAccountDataOnDemand;
    
    public Tablature TablatureDataOnDemand.getNewTransientTablature(int index) {
        Tablature obj = new Tablature();
        setArtistName(obj, index);
        setAuthor(obj, index);
        setCreatedAt(obj, index);
        setLastModifiedAt(obj, index);
        setSongTitle(obj, index);
        setThumbnailPath(obj, index);
        return obj;
    }
    
    public void TablatureDataOnDemand.setArtistName(Tablature obj, int index) {
        String artistName = "artistName_" + index;
        obj.setArtistName(artistName);
    }
    
    public void TablatureDataOnDemand.setAuthor(Tablature obj, int index) {
        UserAccount author = userAccountDataOnDemand.getRandomUserAccount();
        obj.setAuthor(author);
    }
    
    public void TablatureDataOnDemand.setCreatedAt(Tablature obj, int index) {
        Date createdAt = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedAt(createdAt);
    }
    
    public void TablatureDataOnDemand.setLastModifiedAt(Tablature obj, int index) {
        Date lastModifiedAt = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setLastModifiedAt(lastModifiedAt);
    }
    
    public void TablatureDataOnDemand.setSongTitle(Tablature obj, int index) {
        String songTitle = "songTitle_" + index;
        obj.setSongTitle(songTitle);
    }
    
    public void TablatureDataOnDemand.setThumbnailPath(Tablature obj, int index) {
        String thumbnailPath = "thumbnailPath_" + index;
        obj.setThumbnailPath(thumbnailPath);
    }
    
    public Tablature TablatureDataOnDemand.getSpecificTablature(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Tablature obj = data.get(index);
        return Tablature.findTablature(obj.getId());
    }
    
    public Tablature TablatureDataOnDemand.getRandomTablature() {
        init();
        Tablature obj = data.get(rnd.nextInt(data.size()));
        return Tablature.findTablature(obj.getId());
    }
    
    public boolean TablatureDataOnDemand.modifyTablature(Tablature obj) {
        return false;
    }
    
    public void TablatureDataOnDemand.init() {
        data = Tablature.findTablatureEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Tablature' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.one.note.noted.domain.Tablature>();
        for (int i = 0; i < 10; i++) {
            Tablature obj = getNewTransientTablature(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
