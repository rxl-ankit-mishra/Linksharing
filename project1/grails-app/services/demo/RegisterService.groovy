package demo
import grails.gorm.transactions.Transactional
@Transactional
class RegisterService {
    def registerUser(def params){
        if(params.username.trim().length()>30 || params.email.trim().length()>40 || params.firstname.trim().length()>30 || params.lastname.trim().length()>30){
            return "size limit exceed"
        }
        if(params.username.trim().length()==0 || params.email.trim().length()==0 || params.firstname.trim().length()==0 || params.lastname.trim().length()==0){
            return "empty"
        }
        if(params.password.length() <8){
            return "password should be greater than 8 character"
        }
        if(params.password != params.confirmpassword){
            return "password not match"
        }
        User user = new User()
        user.username = params.username.toLowerCase()
        user.email = params.email.toLowerCase()
        user.firstName = params.firstname
        user.lastName = params.lastname
        user.password = params.password
       try{
            def multipartFile = params.photo
            def photoExtension = multipartFile.getOriginalFilename().tokenize('.')[-1]
            def bytes = multipartFile.getBytes()
            def url = "grails-app/assets/images/profilePicture/${params.username}.${photoExtension}"
            def newFile = new File("${url}")
            newFile.createNewFile()
            newFile.append(bytes)
            params.photo = url
            user.photo = params.photo
       }
       catch(Exception e){
            user.photo = "grails-app/assets/images/profilePicture/default.png"
       }
        if(user.validate()) {
            user.save(flush:true,failOnError:true)
            return "true"
        }
        else{
            return "false"
        }
    }
}