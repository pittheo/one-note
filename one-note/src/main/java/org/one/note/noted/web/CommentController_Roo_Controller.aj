// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.one.note.noted.domain.Comment;
import org.one.note.noted.domain.UserAccount;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CommentController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String CommentController.create(@Valid Comment comment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("comment", comment);
            addDateTimeFormatPatterns(uiModel);
            return "comments/create";
        }
        uiModel.asMap().clear();
        comment.persist();
        return "redirect:/comments/" + encodeUrlPathSegment(comment.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CommentController.createForm(Model uiModel) {
        uiModel.addAttribute("comment", new Comment());
        addDateTimeFormatPatterns(uiModel);
        return "comments/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String CommentController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("comment", Comment.findComment(id));
        uiModel.addAttribute("itemId", id);
        return "comments/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CommentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("comments", Comment.findCommentEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Comment.countComments() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("comments", Comment.findAllComments());
        }
        addDateTimeFormatPatterns(uiModel);
        return "comments/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CommentController.update(@Valid Comment comment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("comment", comment);
            addDateTimeFormatPatterns(uiModel);
            return "comments/update";
        }
        uiModel.asMap().clear();
        comment.merge();
        return "redirect:/comments/" + encodeUrlPathSegment(comment.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String CommentController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("comment", Comment.findComment(id));
        addDateTimeFormatPatterns(uiModel);
        return "comments/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String CommentController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Comment.findComment(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/comments";
    }
    
    @ModelAttribute("comments")
    public Collection<Comment> CommentController.populateComments() {
        return Comment.findAllComments();
    }
    
    @ModelAttribute("useraccounts")
    public Collection<UserAccount> CommentController.populateUserAccounts() {
        return UserAccount.findAllUserAccounts();
    }
    
    void CommentController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("comment_createdat_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("comment_lastmodifiedat_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String CommentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
