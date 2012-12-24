package org.one.note.noted.services;

import org.one.note.noted.domain.SongEntry;
import org.one.note.noted.domain.UserAccount;
import org.springframework.mail.MailException;

public interface NotificationService {

	boolean sendAccountActivationEmail(UserAccount user, String activationLink) throws MailException;

	boolean sendSupportOnBetEmail(UserAccount user, UserAccount supporter, SongEntry songEntry) throws MailException;
	
	boolean sendCommentOnBetEmail(UserAccount user, UserAccount author, SongEntry songEntry, String comment) throws MailException;
	
	//boolean sendWinnerEmail(final UserAccount user, final SongEntry songEntry, final UserAccount winner, boolean accepted) throws MailException, VelocityException;
	
	//boolean sendWinnerRequestEmail(final UserAccount user, final Bet bet, final WinnerRequest winnerRequest) throws MailException, VelocityException;
	
}
