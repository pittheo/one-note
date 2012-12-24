package org.one.note.noted.web;

import org.one.note.noted.domain.VideoEntry;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "videoentrys", formBackingObject = VideoEntry.class)
@RequestMapping("/videoentrys")
@Controller
public class VideoEntryController {
}
