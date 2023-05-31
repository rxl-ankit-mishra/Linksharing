package demo
class TopicController {
    def TopicService
    def index() {
        Topic topic = TopicService.getTopic(Long.parseLong(params.topicId))
        def CurrTopic = TopicService.CurrentTopic(topic)
        def subsList = TopicService.getTopicSubscribersList(topic)
        def postList = TopicService.postList(topic)

        Map forView = ["subsList":subsList,"userPost":postList,"userTopic":CurrTopic]
        render(view:"index",model:forView)
    }
}
