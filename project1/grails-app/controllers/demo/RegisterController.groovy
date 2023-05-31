package demo
class RegisterController {
    def RegisterService
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

    def registerUser(){
        String user =  RegisterService.registerUser(params)
        if(user == "size limit exceed"){
            flash.successMessage = "Input Size Limited Exceeded"
            redirect(url: "/login",model: [msg:flash.successMessage])
        }
        else if(user == "empty") {
            flash.successMessage = "Input Feild Should Not be Empty "
            redirect(url: "/login", model: [msg: flash.successMessage])
        }
        else if(user == "password should be greater than 8 character"){
            flash.successMessage = "Password Should be greater than 8 character"
            redirect(url: "/login", model: [msg: flash.successMessage])
        }
        else if(user == "password not match"){
            flash.successMessage = "Password and Confirm Password Should be Same"
            redirect(url: "/login", model: [msg: flash.successMessage])
        }
        else if(user == "true"){
            flash.successMessage = "User Registered successfully"
            redirect(url: "/login",model: [msg:flash.successMessage])
        }
        else{
            flash.successMessage = "Error While Registering"
            redirect(url: "/register",model: [msg:flash.successMessage])
        }
    }
}