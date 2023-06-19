package com.thanhh.java5shop.service;

import com.thanhh.java5shop.model.MailInfo;
import jakarta.mail.MessagingException;

public interface MailerService {

    void send(MailInfo mail) throws MessagingException;

    void send(String to, String subject, String body) throws MessagingException;
}
