package src.service;

import javax.servlet.http.HttpSession;

public interface MailService {
	boolean send(String subject, String text, String from, String to);
}
