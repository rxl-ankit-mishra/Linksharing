package demo

class AllTopicController {

    def index() {
        if (!(session.LOGGED_IN_USER)) {
            redirect(url: "/login")
            return
        }
        User user = User.findById(session.LOGGED_IN_USER)
        def allTopic = Topic.createCriteria().list(){
        }
        Map forView = ["user":user,"allTopic":allTopic]
        render(view:"index",model:forView)
    }
    def getUser(){
        Topic topic = Topic.findById(params.topicId)
        topic.delete(flush:true,failOnError:true)
        render("saved")
    }
}
