package demo
class LoginController {
    def LoginService
    def RecentShareService
    def SearchService
    def index() {
        def RecentShare = RecentShareService.AllRecents()
        List topPosts = SearchService.topPostList()
        if(session.LOGGED_IN_USER){
            redirect(url: "/dashboard")
            return
        }
        Map forViews = ["RecentShare":RecentShare,"topPosts":topPosts]
        render(view: "index", model: forViews)
    }
    def loginUser(){
        String userInput = params.email
        User user = LoginService.checkUser(userInput)

        if(user && user.password == params.password){
            session.LOGGED_IN_USER  = user.id
            redirect (url:"/dashboard")
        }
        else{
            flash.successMessage = "Either User not Registered Or Password is Incorrect"
            redirect(url: "/login",model: [msg:flash.successMessage])
        }
    }
    def topicInvite(){
        def topic = Topic.findById(params.availableTopicDoc)

        def getTopic = LoginService.sendTopicInvite(params.Email,topic.name)
        if(getTopic == "No User"){
            flash.successMessage = "User doesn't exist"
            redirect(url: "/dashboard",model: [msg:flash.successMessage])
        }
        else if(getTopic == "sent"){
            flash.successMessage = "Topic Invite Send Successfully"
            redirect(url: "/dashboard",model: [msg:flash.successMessage])
        }
        else{
            flash.successMessage = "Topic Invite Not Sent"
            redirect(url: "/dashboard",model: [msg:flash.successMessage])
        }
    }
    def sendForgotPasswordMail(){
        def ForPassword = LoginService.sendForgotPasswordEmail(params.forgotPasswordEmail)
        if(ForPassword == "User doesn't exist"){
            flash.successMessage = "User doesn't Exist"
            redirect(url: "/login",model: [msg:flash.successMessage])
        }
        else if(ForPassword == "true"){
            flash.successMessage = "Password Send Successfully"
            redirect(url: "/login",model: [msg:flash.successMessage])
        }
        else{
            flash.successMessage = "Error while sending the password"
            redirect(url: "/login",model: [msg:flash.successMessage])
        }
    }

}