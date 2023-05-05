package demo

import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional

import javax.websocket.Session

@Transactional
class CreateTopicService {

    def serviceMethod() {

    }
    def topicVal(){
    }

    def createTopic(def params,def User_Id){
        User user = new User(findBy(User_Id))
        Topic topic = new Topic()

        topic.name = params.topic
        topic.createdBy = user

        if(params.visiblity == 'public'){
            topic.visibility = VisibilityEnum.PUBLIC
        }
        else{
            topic.visibility = VisibilityEnum.PRIVATE
        }

        topic.save(flush:true,failOnError: true)
        //create criteria
//        if(topicVal(topic,user)){
//
//                return true
//        }
//        else{
//              return false
//        }

    }


}
