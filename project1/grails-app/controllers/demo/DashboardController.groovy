package demo

class DashboardController {

    def index() {
        render(view:"index")
    }

    def createTopic(){
        boolean isTopicCreated = CreateTopicService.createTopic(params,session.LOGGED_IN_USER);
        if(isTopicCreated){
            redirect(url:"/dashBoard")
        }
        else{
            render("invalid data")
        }
    }

}




