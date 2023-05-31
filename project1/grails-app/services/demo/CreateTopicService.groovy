package demo
import Enum.SeriousnessEnum
import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional
import javax.websocket.Session
@Transactional
class CreateTopicService {
    def topicValidation(def topic,def user){
        if(!topic.validate()){
            return false
        }
        List<String> allTopicCreatedByUser = Topic.createCriteria().list(){
            projections{
                property("name")
            }
            eq("createdBy",user)
        }
        if(allTopicCreatedByUser.contains(topic.name)){
            return false
        }
        else{
            return true
        }
    }
    def createTopic(def params,def User_Id){
        User user = User.findById(User_Id)
        Topic topic = new Topic()
        topic.name = params.topicName
        topic.createdBy = user
        if(params.visibility == 'Public'){
            topic.visibility =  VisibilityEnum.PUBLIC
        }
        else{
            topic.visibility = VisibilityEnum.PRIVATE
        }
        if(topicValidation(topic,user)){
            topic.save(flush:true,failOnError: true)
            subscribeTopic(topic,user)
            return true
        }
        else{
              return false
        }
    }
    def subscribeTopic(Topic topic,User user){
        Subscription subscriber = new Subscription()
        subscriber.user = user
        subscriber.topic = topic
        subscriber.seriousnes = SeriousnessEnum.SERIOUS
        subscriber.save(flush:true,failOnError:true)
    }
}
