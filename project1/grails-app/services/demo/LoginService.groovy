package demo

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {

    def serviceMethod() {

    }
    def checkUserExistence(String userInput){
        if(userInput.contains('@')){
           User userByEmail = User.findByEmail(userInput)
           return userByEmail
        }
        User userByuserName = User.findByUsername(userInput)
        return userByuserName
    }
}
