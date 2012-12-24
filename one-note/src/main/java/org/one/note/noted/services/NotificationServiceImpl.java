package org.one.note.noted.services;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.one.note.noted.domain.SongEntry;
import org.one.note.noted.domain.UserAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

public class NotificationServiceImpl extends Thread implements NotificationService {

	@Autowired
	private transient JavaMailSender mailSender;

	private VelocityEngine velocityEngine;

	public static final String ADMIN_USER = "admin@betit.com";
	public static final String ACCOUNT_ACTIVATION_SUBJECT = "Welcome to Betit!";
	public static final String SUPPORT_ON_BET_SUBJECT_2 = " now supports you on your bet!";
	public static final String COMMENT_ON_BET_SUBJECT_2 = " has posted a comment on your bet!";
	public static final String WINNER_DECIDED_ON_BET_SUBJECT = "And the winner is...";
	public static final String WINNER_REQUEST_DECLINED_SUBJECT_2 = " does not agree on the winner!";
	

	@Override
	public boolean sendAccountActivationEmail(final UserAccount user, final String activationLink)
			throws MailException, VelocityException {
		System.out.println("*** Sending mock account activation email to "
				+ user.getEmail() + " with link: " + activationLink);
		// String emailMessage = "<h1>Hello " + username + "!</h1>\n" +
		// "<p>Welcome to betit!</p>\n\n" +
		// "Click on this link to activate your account.\n" + activationLink;

		// Build the model
		// Map<String, Object> model = new HashMap<String, Object>();
		// model.put("user", username);
		// model.put("activationLink", activationLink);

		// String template = null;
		// try {
		// // notificationTemplate.vm must be in your classpath
		// template =
		// VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,
		// "accountActivationTemplate.vm", model);
		// } catch (VelocityException e) {
		// throw new MailSendException(e.getMessage(), e);
		// }
		// sendMessage(ADMIN_USER, ACCOUNT_ACTIVATION_SUBJECT,
		// "petros.theocharous@gmail.com", template);
		// System.out.println("*** Email message sent. OK ***");
		// return true;
		(new Thread() {
			public void run() {
				MimeMessagePreparator preparator = new MimeMessagePreparator() {
					public void prepare(MimeMessage mimeMessage) throws Exception {
			
						MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
						message.setTo("petros.theocharous@gmail.com");
						message.setFrom(ADMIN_USER);
						message.setSubject(ACCOUNT_ACTIVATION_SUBJECT);
			
						// Build the model
						Map<String, Object> model = new HashMap<String, Object>();
						model.put("user", user);
						model.put("activationLink", activationLink);
			
						String text = VelocityEngineUtils.mergeTemplateIntoString(
								velocityEngine, "accountActivationTemplate.vm", model);
						message.setText(text, true);
					}
				};
				mailSender.send(preparator);
				System.out.println("*** Email message sent. OK ***");
		
			}
		}
		).start();

		return true;
	}

	public void sendMessage(String mailFrom, String subject, String mailTo,
			String message) {
		org.springframework.mail.SimpleMailMessage simpleMailMessage = new org.springframework.mail.SimpleMailMessage();
		simpleMailMessage.setFrom(mailFrom);
		simpleMailMessage.setSubject(subject);
		simpleMailMessage.setTo(mailTo);
		simpleMailMessage.setText(message);
		mailSender.send(simpleMailMessage);
	}

	public boolean sendSupportOnBetEmail(final UserAccount user,
			final UserAccount supporter, final SongEntry songEntry) throws MailException,
			VelocityException {
		System.out.println("*** Sending mock support on bet email to "
				+ user.getEmail());

		(new Thread() {
			public void run() {
				MimeMessagePreparator preparator = new MimeMessagePreparator() {
					public void prepare(MimeMessage mimeMessage) throws Exception {
		
						MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
						message.setTo("petros.theocharous@gmail.com");
						// message.setTo(user.getEmail());
						message.setFrom(ADMIN_USER);
						message.setSubject(supporter.getUsername()
								+ SUPPORT_ON_BET_SUBJECT_2);
		
						// Build the model
						Map<String, Object> model = new HashMap<String, Object>();						
						model.put("user", user);
						model.put("supporter", supporter);
						model.put("bet", songEntry);
		
						String text = VelocityEngineUtils.mergeTemplateIntoString(
								velocityEngine, "supportOnBetTemplate.vm", model);
						message.setText(text, true);
					}
				};
				mailSender.send(preparator);
				System.out.println("*** Email message sent. OK ***");
			}
		}
		).start();
		
		return true;
	}

	public boolean sendCommentOnBetEmail(final UserAccount user,
			final UserAccount author, final SongEntry songEntry, final String comment) throws MailException,
			VelocityException {
		System.out.println("*** Sending mock comment on bet email to "
				+ user.getEmail());

		(new Thread() {
			public void run() {
				MimeMessagePreparator preparator = new MimeMessagePreparator() {
					public void prepare(MimeMessage mimeMessage) throws Exception {

						MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
						message.setTo("petros.theocharous@gmail.com");
						// message.setTo(user.getEmail());
						message.setFrom(ADMIN_USER);
						message.setSubject(author.getUsername()
								+ COMMENT_ON_BET_SUBJECT_2);

						// Build the model
						Map<String, Object> model = new HashMap<String, Object>();
						model.put("user", user);
						model.put("author", author);
						model.put("bet", songEntry);
						model.put("comment", comment);

						String text = VelocityEngineUtils.mergeTemplateIntoString(
								velocityEngine, "commentOnBetTemplate.vm", model);
						message.setText(text, true);
					}
				};
				mailSender.send(preparator);
				System.out.println("*** Email message sent. OK ***");
			}
		}
		).start();

		return true;
	}

	
	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	public void run() {
		System.out.println("Inside the run method. Sending email...");
		for (int i = 0; i < 10000000; i++) {
			System.out.print("");
		}

		// try {
		// this.wait(3000);
		// } catch (InterruptedException e) {
		// TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		System.out.println("Email sent!");
	}

	public static void main(String[] args) {
		final NotificationServiceImpl n = new NotificationServiceImpl();
		
		System.out.println("*** Enter ***");
		n.start();
		
		(new Thread() {
			public void run() {
				System.out.println("Sending email...");
				for (int i = 0; i < 10000000; i++) {
					System.out.print("");
				}
				//n.sendAccountActivationEmail("petros", "petrs@sdf.com", "sdfdsfdsfsdfdsfsdfdsfsdf");
				System.out.println("Email sent!");
			}
		}
		).start();
		System.out.println("*** Exit ***");
		/*for (int i = 0; i < 4; i++) {
			System.out.println("*** Enter " + i + " ***");
			if (i % 2 == 0) {
				Thread t = new NotificationServiceImpl();
				t.start();
			}
			System.out.println("*** Exit " + i + " ***");
		}
*/
	}

}
