package demo

class AllPostController {
    def index() {
        if (!(session.LOGGED_IN_USER)) {
            redirect(url: "/login")
            return
        }
        User user = User.findById(session.LOGGED_IN_USER)
        def allPost = Resource.createCriteria().list(){
        }
        Map forView = ["user":user,"allPost":allPost]
        render(view:"index",model:forView)
    }
    def getUser(){
        Resource resource = Resource.findById(params.resourceId)
        resource.delete(flush:true,failOnError:true)
        render("saved")
    }
}
