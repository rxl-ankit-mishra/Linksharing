package demo

class ShowUserController {
    def index() {
        if (!(session.LOGGED_IN_USER)) {
            redirect(url: "/login")
            return
        }
        User user = User.findById(session.LOGGED_IN_USER)
        def allUser = User.createCriteria().list(){
            eq("admin",false)
        }
        Map forView = ["user":user,"allUser":allUser]
        render(view:"index",model:forView)
    }
    def getUser(){
        User user = User.findById(params.userId)
        if(user.active){
            user.active = false
        }
        else{
            user.active = true
        }
        user.save(flush:true,failOnError:true)
        render("saved")
    }
}
