package com.thanhh.java5shop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailInfo {
    private String from;
    private String to;
    private String[] cc;
    private String[] bcc;
    private String subject;
    private String body;
    private String[] attachments;

    public MailInfo(String to, String subject, String body) {
        this.from = "CR7SHOP";
        this.to = to;
        this.subject = subject;
        this.body = body; }
}
