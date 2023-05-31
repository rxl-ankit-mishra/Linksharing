package demo
import grails.converters.JSON

class PostController {
    def TrendingTopicService
    def PostService
    def AdminService
    def index() {
        Long userID = session.LOGGED_IN_USER
        User user = AdminService.getUser(userID)

        Resource resource = PostService.getResource(Long.parseLong(params.postId))
        String resourceRating = PostService.getResourceRating(user,resource)
        List trendingTopicList = TrendingTopicService.TrendingTopicList(user)
        Long postRatingCount = PostService.getPostRaters(resource)
        def avgPostRating = PostService.getAvgPostRating(resource)
        boolean isSubscribed = PostService.isSubscribedToTopic(user, resource.topic)

        Map loadMap = ["user": user, "resource":resource, "resourceRating": resourceRating, "trendingTopicList": trendingTopicList, "postRatingCount": postRatingCount, "avgPostRating": avgPostRating, "isSubscribed":isSubscribed]
        render(view:"index", model: loadMap)
    }
    def rating(){

        Long userID = session.LOGGED_IN_USER
        User user = AdminService.getUser(userID)
        Resource resource = PostService.getResource(Long.parseLong(params.postId))

        def res = PostService.rating(user, resource, Integer.parseInt(params.rating))

        Long postRatingCount = PostService.getPostRaters(resource)
        def avgPostRating = PostService.getAvgPostRating(resource)
        List rating = [postRatingCount, avgPostRating]

        render rating as JSON
    }

    def deletePost(){

        def result = PostService.deletePost(params)

//        if(result){
//            flash.successMessage = "Post Deleted Successfully"
//            redirect(controller: "dashboard",model: [msg:flash.successMessage])
//        }
//        else {
//            flash.failMessage = "Error in deleting post"
//            redirect(controller: "dashboard" ,model: [msg:flash.failMessage])
//        }

    }

}
