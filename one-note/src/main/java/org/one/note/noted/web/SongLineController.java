package org.one.note.noted.web;

import org.one.note.noted.domain.SongLine;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "songlines", formBackingObject = SongLine.class)
@RequestMapping("/songlines")
@Controller
public class SongLineController {
}
