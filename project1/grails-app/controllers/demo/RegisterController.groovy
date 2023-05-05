package demo
class RegisterController {
    def RegisterService

    def index() {
        if(session.LOGGED_IN_USER_ID) {
            redirect(url: "/dashboard")
            return
        }
        render (view : "index")
    }

    def registerUser() {
        User u = new User();
        u.username = params.username
        u.email = params.email
        u.firstName = params.firstname
        u.lastName = params.lastname
        u.password = params.password

        u.save(flush:true,failonError:true)

        if((u.validate())&& params.confirmpassword == params.password) {
            redirect(url: "/login")
        }

        else{
            render  "not correct"
        }
    }

}
