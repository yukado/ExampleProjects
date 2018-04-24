package user;

  
import java.util.Properties;
import javax.mail.*;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  
  
public class Mailer {  
public static void send(String to,String subject,String msg){  
  
final String user="mycomshop-autoreply@hotmail.com";//change accordingly  
final String pass="SdeedS:isneS1409!";  
  
//1st step) Get the session object    
Properties props = new Properties();            
            props.setProperty("mail.host", "smtp.live.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");
  
Session session;
    session = Session.getDefaultInstance(props,  
            new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user,pass);
                }  
            });
//2nd step)compose message  
try {  
 MimeMessage message = new MimeMessage(session);  
 message.setFrom(new InternetAddress(user));  
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
 message.setSubject(subject);  
 message.setText(msg);  
   
 //3rd step)send message  
 Transport.send(message);  
  
   
  
 } catch (MessagingException e) {  
    throw new RuntimeException(e);  
 }  
      
}  
}
