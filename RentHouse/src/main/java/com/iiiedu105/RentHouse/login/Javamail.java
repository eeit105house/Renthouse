package com.iiiedu105.RentHouse.login;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Javamail {
	public static void main(String[] args) {

        //user
        String user = "iiieeit105";
        //password
        String pwd = "yqfuudsxzjrzbloh";

        //接收者的email.
        String to = "h28288822@gmail.com";

        //寄件人的email
        String from = "iiieeit105@gmail.com";

        // 寄件的smtp伺服器
        String host = "smtp.gmail.com";

        // 主旨
        String subject = "租你幸福，開通帳號驗證信";

        //內文
        String body = "Java程式發送出來的信";

        // 建立一個Properties來設定Properties
        Properties properties = System.getProperties();

        //設定傳輸協定為smtp
        properties.setProperty("mail.transport.protocol", "smtp");
        //設定mail Server
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "465");
        //需要驗證帳號密碼
        properties.put("mail.smtp.auth", "true");
        //Bypass the SSL authentication
        properties.put("mail.smtp.ssl.enable", false);
//        properties.put("mail.smtp.starttls.enable", false);
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		//帳號，密碼
        SmtpAuthenticator authentication
        = new SmtpAuthenticator(user, pwd);


        // 建立一個Session物件，並把properties傳進去
        Session mailSession = Session.
                getDefaultInstance(properties, authentication);

        try {
            //建立一個 MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);

            // 設定寄件人
            message.setFrom(new InternetAddress(from));

            // 設定收件人
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));

            // 設定主旨
            message.setSubject(subject);

            //設定內文
            message.setText(body);

            Transport transport = mailSession.getTransport();

            // 傳送信件         
            transport.send(message);

            System.out.println("發送成功");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }


}
