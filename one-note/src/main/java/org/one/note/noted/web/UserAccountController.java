package org.one.note.noted.web;

import java.util.List;

import org.one.note.noted.domain.UserAccount;
import org.one.note.noted.domain.beans.AutocompleteVO;
import org.one.note.noted.services.NotificationService;
import org.one.note.noted.util.EnvProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RooWebScaffold(path = "useraccounts", formBackingObject = UserAccount.class)
@RequestMapping("/useraccounts")
@Controller
public class UserAccountController {
	
	public static final String WELCOME_SUBJECT = "Welcome to Betit!";
	public static final String WELCOME_MESSAGE = "Welcome to Betit. You can now access your inbox and start making your bets social!";
	
	@Autowired
    private NotificationService notificationService;
	
	@Autowired
	private EnvProperties envProperties;
	

	
	public NotificationService getNotificationService() {
		return notificationService;
	}

	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}

	public EnvProperties getEnvProperties() {
		return envProperties;
	}

	public void setEnvProperties(EnvProperties envProperties) {
		this.envProperties = envProperties;
	}
	
	
}
