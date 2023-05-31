package demo
class CreateTopicController {
    def CreateTopicService
    def index() {
    }
    def createTopic(){
        boolean isTopicCreated = CreateTopicService.createTopic(params,session.LOGGED_IN_USER)
        if(isTopicCreated){
            flash.successMessage = "Topic Created Successfully"
            redirect(url: "/dashboard",model: [msg:flash.successMessage])
        }
        else{
            flash.successMessage = "Error in Creating a Topic"
            redirect(url: "/dashboard",model: [msg:flash.successMessage])
        }
    }
}
