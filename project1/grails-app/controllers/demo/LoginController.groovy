package demo

class LoginController {
    def LoginService

    def index() {
        if(session.LOGGED_IN_USER){
            redirect(url: "/dashboard")
             return
        }
         render(view: "index")
    }
    def loginUser(){
        String userInput = params.email
        println params.email
        User u = LoginService.checkUserExistence(userInput)

        if(u){
            session.LOGGED_IN_USER  = u.id
            println session
            redirect (url:"/dashboard")
        }
        else{
            render "user not exist"
        }
    }
}
