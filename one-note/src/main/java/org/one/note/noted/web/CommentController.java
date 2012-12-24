package org.one.note.noted.web;

import org.one.note.noted.domain.Comment;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "comments", formBackingObject = Comment.class)
@RequestMapping("/comments")
@Controller
public class CommentController {
}
