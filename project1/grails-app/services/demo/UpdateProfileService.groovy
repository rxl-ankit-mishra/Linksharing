package demo
import grails.gorm.transactions.Transactional
@Transactional
class UpdateProfileService {
    def UpdateProfileDetails(def userId,def params){
        User user = User.findById(userId)
        if(params.username) {
            if (!(checkUniqueUsername(params.username))) {
                user.username = params?.username
            } else {
                return "User name already Exist"
            }
        }
//        if(params.firstname){
            user.firstName = params?.firstname?:user.firstName
//        }
//        if(params.lastname){
            user.lastName = params.lastname?:user.lastName
//        }

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
            if(params.photo.isEmpty() == false){
                return "photonotUpdated"
            }
        }

        if(user.validate()) {
            user.save(flush:true,failOnError:true)
            return "True"
        }
        else{
             return "False"
        }
    }
    boolean checkUniqueUsername(String username){
        return User.findByUsername(username)
    }
    def UpdatePassword(def userId,def params){
        User user = User.findById(userId)
        if(params.password == params.confirmpassword){
            user.password = params.password
            user.save(flush:true)
            return true
        }
        else{
            return false
        }
    }
}
