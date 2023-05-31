package demo

class ProfileController {
    def UserSubscriptionAndTopicCountService
    def UpdateProfileService
    def TrendingTopicService
    def index(){
        if (!(session.LOGGED_IN_USER)) {
            redirect(url:"/login")
            return
        }
        User user = User.findById(session.LOGGED_IN_USER)
        def subAndTopicCount = UserSubscriptionAndTopicCountService.SubAndTopicCount(user)
        def userTopic = TrendingTopicService.UserTopics(user)
        Map forView = ["user": user, "subAndTopicCount": subAndTopicCount,"userTopic":userTopic]
        render(view: "index", model: forView)
    }
    def UpdateDetails(){
     String updateProfile = UpdateProfileService.UpdateProfileDetails(session.LOGGED_IN_USER,params)
        if(updateProfile == "Username already Exist") {
            flash.successMessage = "Username Already Exist"
            redirect(url: "/Profile",model: [msg:flash.successMessage])
        }
        else if(updateProfile == "True") {
            flash.successMessage = "Updated User details Successfully"
            redirect(url: "/Profile",model: [msg:flash.successMessage])
        }
        else if(updateProfile == "photonotUpdated"){
            flash.successMessage = "Photo not Updated"
            redirect(url: "/Profile",model: [msg:flash.successMessage])
        }
        else{
            flash.successMessage = "User details Not Updated"
            redirect(url: "/Profile",model: [msg:flash.successMessage])
        }
    }
    def UpdatePassword(){
        boolean updatePassword = UpdateProfileService.UpdatePassword(session.LOGGED_IN_USER,params)
        if(updatePassword){
            flash.successMessage = "Updated User Password Successfully"
            redirect(url: "/Profile",model: [msg:flash.successMessage])
        }
        else{
            flash.successMessage = "User details Not Updated"
            redirect(url: "/Profile",model: [msg:flash.successMessage])
        }
    }
}
