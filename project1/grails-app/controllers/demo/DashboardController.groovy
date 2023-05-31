package demo
import grails.converters.JSON
class DashboardController {
    def UserSubscriptionAndTopicCountService
    def CreateDocumentResourceService
    def CreateLinkResourceService
    def SubscriptionListService
    def TrendingTopicService
    def InboxResourceService
    def TopicService
    def index() {
        if (!(session.LOGGED_IN_USER)) {
            redirect(url: "/login")
            return
        }
        User user = User.findById(session.LOGGED_IN_USER)
        def allTopic = TopicService.getTopic()
        def subAndTopicCount = UserSubscriptionAndTopicCountService.SubAndTopicCount(user)
        List subscribedTopicList = SubscriptionListService.subscriptionList(user)
        List trendingTopicList = TrendingTopicService.TrendingTopicList(user)
        List inboxResourceList = InboxResourceService.UnreadResource(user)
        Map forView = ["user": user, "subAndTopicCount": subAndTopicCount, "subscribedTopicList": subscribedTopicList,"trendingTopicList":trendingTopicList,"inboxResourceList":inboxResourceList,"allTopic":allTopic]
        render(view: "index", model: forView)
    }
    def createDocumentResource() {
       try{
           boolean documentResource = CreateDocumentResourceService.createDocumentResource(params, session.LOGGED_IN_USER)

           if (documentResource) {
               flash.successMessage = "DocumentResource Added Successfully"
               redirect(url: "/dashboard",model: [msg:flash.successMessage])
           }
           else{
               flash.successMessage = "DocumentResource Not Added"
               redirect(url: "/dashboard",model: [msg:flash.successMessage])
           }
       }
        catch(Exception e){
            flash.successMessage = "DocumentResource Not Added"
            redirect(url: "/dashboard",model: [msg:flash.successMessage])
        }

    }
    def createLinkResource(){
        boolean LinkResource = CreateLinkResourceService.CreateLinkResource(params,session.LOGGED_IN_USER)
        if(LinkResource){
            flash.successMessage = "LinkResource Added Successfully"
            redirect(url: "/dashboard",model: [msg:flash.successMessage])
        }
        else{
            flash.successMessage = "LinkResource Not Added"
            redirect(url: "/dashboard",model: [msg:flash.successMessage])
        }
    }
    def loadSubscribedTopics(){
        User user = User.findById(session.LOGGED_IN_USER)
        def result = Subscription.createCriteria().list{
            projections{
                topic{
                    property("id")
                    property("name")
                }
            }
            eq("user",user)
        }
        Map subscribersMap = [key:result]
        render subscribersMap as JSON
    }
}
