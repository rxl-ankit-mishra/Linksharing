package demo

import grails.gorm.transactions.Transactional

@Transactional
class TrendingTopicService {
    def serviceMethod() {

    }
    def TrendingTopicList(User user ){
        def allTopicList = Topic.findAll()
        def topicAndPost = [:]
        allTopicList.each { topic ->
            int count = Resource.countByTopic(topic)
            topicAndPost[topic] = count
        }
        def sortedList = topicAndPost.entrySet().toList().sort { a, b -> b.value <=> a.value }

        def newTopicList = [:].withDefault { k -> 0 }
        sortedList.each { entry ->
            newTopicList[entry.key] = entry.value
        }

        List TrendingTopicList = []
        int count = 0
        newTopicList.each{topic,topicCount->
            if(count<5){
                TrendingTopicList.add(Subscription.findByTopic(topic))
            }
            count++
        }
        List subList = []

        try{
            TrendingTopicList.each{it->

                Map result = [:]
                boolean isSubscribed
                def subCount = Subscription.countByTopic(it.topic)
                def postCount = Resource.countByTopic(it.topic)
                Topic checktopic = it.topic
                def checksubscribe = Subscription.createCriteria().count{
                    eq("topic",checktopic)
                    eq("user",user)
                }
                if(checksubscribe){
                    result.put("isSubscribed",true)
                }
                else{
                    result.put("isSubscribed",false)
                }
                result.put("subID",it.id)
                result.put("user",it.user)
                result.put("topic",it.topic)
                result.put("subCount",subCount)
                result.put("postcount",postCount)
                result.put("seriousness",it.seriousnes)


                subList.add(result)
            }
        }
        catch(Exception e){

        }
        return subList
    }
    def UserTopics(User user){
        def userTopic = Topic.createCriteria().list{
            eq("createdBy",user)
        }
        List subList = []
        userTopic.each{topic->
            Map result = [:]
            def subCount = Subscription.countByTopic(topic)
            def postCount = Resource.countByTopic(topic)
            def topicName = topic.name

            result.put("subID",topic.id)
            result.put("isSubscribed",true)
            result.put("subCount",subCount)
            result.put("postCount",postCount)
            result.put("topicName",topicName)
            result.put("user",user)
            result.put("topic",topic)

            try{
                def subObj = Subscription.createCriteria().get{
                    eq("user", user)
                    eq("topic", topic)
                }
                result.put("seriousness",subObj.seriousnes)
            }
            catch(Exception e){

            }
            subList.add(result)
        }
        return subList
    }

}
