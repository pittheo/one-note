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
import org.one.note.noted.domain.Comment;
import org.one.note.noted.domain.UserAccount;
import org.one.note.noted.domain.UserAccountDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CommentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CommentDataOnDemand: @Component;
    
    private Random CommentDataOnDemand.rnd = new SecureRandom();
    
    private List<Comment> CommentDataOnDemand.data;
    
    @Autowired
    private UserAccountDataOnDemand CommentDataOnDemand.userAccountDataOnDemand;
    
    public Comment CommentDataOnDemand.getNewTransientComment(int index) {
        Comment obj = new Comment();
        setAuthor(obj, index);
        setContent(obj, index);
        setCreatedAt(obj, index);
        setLastModifiedAt(obj, index);
        setTitle(obj, index);
        return obj;
    }
    
    public void CommentDataOnDemand.setAuthor(Comment obj, int index) {
        UserAccount author = userAccountDataOnDemand.getRandomUserAccount();
        obj.setAuthor(author);
    }
    
    public void CommentDataOnDemand.setContent(Comment obj, int index) {
        String content = "content_" + index;
        obj.setContent(content);
    }
    
    public void CommentDataOnDemand.setCreatedAt(Comment obj, int index) {
        Date createdAt = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedAt(createdAt);
    }
    
    public void CommentDataOnDemand.setLastModifiedAt(Comment obj, int index) {
        Date lastModifiedAt = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setLastModifiedAt(lastModifiedAt);
    }
    
    public void CommentDataOnDemand.setTitle(Comment obj, int index) {
        String title = "title_" + index;
        obj.setTitle(title);
    }
    
    public Comment CommentDataOnDemand.getSpecificComment(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Comment obj = data.get(index);
        return Comment.findComment(obj.getId());
    }
    
    public Comment CommentDataOnDemand.getRandomComment() {
        init();
        Comment obj = data.get(rnd.nextInt(data.size()));
        return Comment.findComment(obj.getId());
    }
    
    public boolean CommentDataOnDemand.modifyComment(Comment obj) {
        return false;
    }
    
    public void CommentDataOnDemand.init() {
        data = Comment.findCommentEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Comment' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.one.note.noted.domain.Comment>();
        for (int i = 0; i < 10; i++) {
            Comment obj = getNewTransientComment(i);
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
