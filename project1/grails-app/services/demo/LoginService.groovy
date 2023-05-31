package demo
import grails.gorm.transactions.Transactional
import org.springframework.mail.MailSender
import org.springframework.mail.SimpleMailMessage
import java.security.SecureRandom
@Transactional
class LoginService {

    MailSender mailSender
    def serviceMethod() {
    }
    def checkUser(String userInput){
        User userByEmail = User.findByEmailOrUsername(userInput.toLowerCase(),userInput.toLowerCase())
        return userByEmail
    }
    String sendForgotPasswordEmail(String email){
        User usr = User.findByEmail(email)
        if(!usr){
            return "User doesn't exist"
        }

        try{
            String subject = "Default password for your Linksharing account"
            String defaultPassword = randomPasswordGenerator()
            String  mailtext = "Your default Login password is :${defaultPassword}.Please use this as new password."
            def msg = new SimpleMailMessage();
            msg.setFrom("bhau.singh@outlook.com")
            msg.setTo(email)
            msg.setSubject(subject)
            msg.setText(mailtext)
            mailSender.send(msg)
            User user = User.findByEmail(email)
            user.password = defaultPassword
            user.save(flush:true, failOnError:true)
            return "true"
        }
        catch (Exception  e){
            return "false"
        }
    }
    def sendTopicInvite(def email,def topicName){
        User checkUser = User.findByEmail(email)
        if(!checkUser){
            return "No User"
        }
        try{
            String subject = "Invitation for the Topic"
            String  mailtext = "Your are invited for: ${topicName}."
            def msg = new SimpleMailMessage();
            msg.setFrom("bhau.singh@outlook.com")
            msg.setTo(email)
            msg.setSubject(subject)
            msg.setText(mailtext)
            mailSender.send(msg)
            return "sent"
        }
        catch (Exception  e){
            return "error"
        }
    }
    String randomPasswordGenerator(){
        String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@!#%^&*"
        int PASSWORD_LENGTH = 8

        Random random = new SecureRandom();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            password.append(randomChar);
        }
        return password.toString();
    }

}