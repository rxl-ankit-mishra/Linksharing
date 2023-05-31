package demo

class UsersProfileController {
    def UserSubscriptionAndTopicCountService
    def TrendingTopicService
    def SubscriptionListService
    def PostService
    def index() {
        User user = User.findById(session.LOGGED_IN_USER)
        def userTopic = TrendingTopicService.UserTopics(user)
        def userSubscription = SubscriptionListService.UserSubscription(user)
        def userPost = PostService.UserPost(user)
        def subAndTopicCount = UserSubscriptionAndTopicCountService.SubAndTopicCount(user)
        Map forView = ["user": user, "subAndTopicCount": subAndTopicCount,"userTopic":userTopic,"subscribedTopicList":userSubscription,"userPost":userPost]
        render(view: "index", model: forView)
    }

}
