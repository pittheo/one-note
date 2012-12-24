package org.one.note.noted.web;

import javax.servlet.http.HttpSession;

import org.one.note.noted.domain.UserAccount;

public class AuthenticationManager {

	public static boolean isUserLoggedIn(HttpSession session) {
		UserAccount loggedUser = (UserAccount)session.getAttribute("loggedUser");
		return loggedUser != null;
	}
	
}
