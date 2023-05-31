package demo

import grails.gorm.transactions.Transactional

@Transactional
class AdminService {

    def serviceMethod() {

    }
    User getUser(Long userId){
        User user;
        try{
            user = User.findById(userId)
        }
        catch (Exception err){

        }
        return user
    }

    List users(){
        List userList = User.createCriteria().list{
            eq("admin", false)
        }
        return userList
    }

    def userActivation(def userId){
        User user = User.get(Integer.parseInt(userId))
        if(user.active)
            user.active = false
        else
            user.active = true

    }
}
