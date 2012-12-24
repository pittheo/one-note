package org.one.note.noted.web;

import org.one.note.noted.domain.UserProfile;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "userprofiles", formBackingObject = UserProfile.class)
@RequestMapping("/userprofiles")
@Controller
public class UserProfileController {
}
