package com.iiiedu105.RentHouse.login;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SmtpAuthenticator extends Authenticator {

    private String USER;
    private String PASSWORD;

    //空的建構子
    public SmtpAuthenticator() {

        super();
    }

    //可以讓外部傳送帳號密碼進來的建構子
    public SmtpAuthenticator(String user, String password) {
        this();
        this.USER = user;
        this.PASSWORD = password;
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        String username = USER;
        String password = PASSWORD;
        if ((username != null) && (username.length() > 0)
                && (password != null)
                && (password.length() > 0)) {

            return new PasswordAuthentication(username, password);
        }

        return null;
    }

}