package demo
import grails.gorm.transactions.Transactional
@Transactional
class TopicService {
    def serviceMethod() {
    }
    def getTopic(){
        def getAllTopic = Subscription.createCriteria().list(){
            topic{
                order("name")
            }
        }

        List subList = []
        getAllTopic.each { it ->
            Map result = [:]
            def subCount = Subscription.countByTopic(it.topic)
            def postCount = Resource.countByTopic(it.topic)
            def topicName = it.topic.name

            result.put("subID", it.id)
            result.put("subCount", subCount)
            result.put("postCount", postCount)
            result.put("topicName", topicName)
            result.put("topic", it.topic)

            subList.add(result)
        }
        return subList
    }

    def getTopic(def TopicId){
        return Topic.findById(TopicId)
    }
    def CurrentTopic(Topic UserTopic){
        def userTopic = []
        userTopic.add(UserTopic)

        List subList = []
        userTopic.each { topic ->
            Map result = [:]
            def subCount = Subscription.countByTopic(topic)
            def postCount = Resource.countByTopic(topic)
            def topicName = topic.name


            result.put("subID", topic.id)
            result.put("isSubscribed", true)
            result.put("subCount", subCount)
            result.put("postCount", postCount)
            result.put("topicName", topicName)
            result.put("topic", topic)
            try{
                def subObj = Subscription.createCriteria().get{

                    eq("topic", topic)
                }

                result.put("seriousness", subObj.seriousnes)
            }
            catch(Exception e){
                //nothing
            }

            subList.add(result)
        }
        return subList
    }
    def getTopicSubscribersList(def topic){
        def topicSubscribers = Subscription.createCriteria().list{
            projections{
                property("user")
            }
            eq("topic", topic)
        }

        List subsInfoList = []
        topicSubscribers.each {user->
            Map userInfo = [:]
            def TopicCount = Topic.createCriteria().count(){
                eq("createdBy", user)
            }
            def SubCount = Subscription.createCriteria().count(){
                eq("user",user)
            }
            userInfo.put("TopicCount",TopicCount)
            userInfo.put("SubCount",SubCount)
            userInfo.put("user", user)
            subsInfoList.add(userInfo)
        }
        return subsInfoList
    }
    def postList(def topic){
        def getPost = Resource.createCriteria().list(){
            eq("topic",topic)
        }
    }

}
