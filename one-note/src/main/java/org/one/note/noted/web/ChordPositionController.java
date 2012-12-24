package org.one.note.noted.web;

import org.one.note.noted.domain.ChordPosition;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "chordpositions", formBackingObject = ChordPosition.class)
@RequestMapping("/chordpositions")
@Controller
public class ChordPositionController {
}
