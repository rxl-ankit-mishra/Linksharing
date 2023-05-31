package demo

class SearchController {
    def TrendingTopicService
    def SearchService
    def AdminService

    def index() {
        if (!(session.LOGGED_IN_USER)) {
            redirect(url: "/login")
            return
        }
        Long userID = session.LOGGED_IN_USER
        User user = AdminService.getUser(userID)
        List trendingTopicList = TrendingTopicService.TrendingTopicList(user)
        List topPosts = SearchService.topPostList()
        List searchOutput = SearchService.searchFunction(params,user)
        Map loadMap = ["user": user,"params":params, "trendingTopicList": trendingTopicList, "topPosts": topPosts, "postList":searchOutput]
        render(view:"index", model: loadMap)

    }
}
