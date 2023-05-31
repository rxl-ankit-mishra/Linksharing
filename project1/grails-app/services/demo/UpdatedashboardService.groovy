package demo

import Enum.SeriousnessEnum
import grails.gorm.transactions.Transactional

@Transactional
class UpdatedashboardService {
    def serviceMethod() {

    }
    boolean updateSeriousness(Map params){
        try{
            Subscription sub = Subscription.get(params.subid)
            if(params.seriousness == 'CASUAL')
                sub.seriousness = SeriousnessEnum.CASUAL
            else if(params.seriousness == 'SERIOUS')
                sub.seriousness = SeriousnessEnum.SERIOUS
            else
                sub.seriousness = SeriousnessEnum.VERY_SERIOUS

            return true
        }
        catch(Exception e){
            return false
        }
    }


    boolean updateVisibility(Map params){
        try{
            Topic topic = Topic.get(params.topicid)
            if(params.visibility == 'PRIVATE')
                topic.visibility = VisibilityEnum.PRIVATE
            else
                topic.visibility = VisibilityEnum.PUBLIC

            return true
        }
        catch(Exception e){
            return false
        }
    }

    boolean updateTopicName(Map params){
        try{
            Topic topic = Topic.get(params.topicid)
            topic.name = params.topicname
            return true
        }
        catch(Exception e){
            return false
        }

    }

    boolean deleteTopic(Map params){
        try{
            Topic topic = Topic.findById(params.topicid)
            topic.delete()
            return true
        }
        catch(Exception e){
            return false
        }

    }

    boolean subscribeTopic(Map params, def user){
        try{
            Topic topic = Topic.findById(params.topicID)
            Subscription sub = new Subscription();
            sub.user = user;
            sub.topic = topic;
            sub.seriousnes = SeriousnessEnum.CASUAL
            sub.save(flush: true, failOnError:true)
            return true
        }
        catch (Exception e){
            return false
        }
    }

    boolean unsubscribeTopic(Map params, def user){
        try{
            Topic topic = Topic.findById(params.topicID)
            def sub = Subscription.findByTopicAndUser(topic,user)
            sub.delete()
            return true
        }
        catch (Exception e){
            return false
        }
    }

    boolean markAsRead(User user, Resource resource){
        ReadingItem item = ReadingItem.createCriteria().get{
            eq("user", user)
            eq("resource", resource)
        }
        if(item){
            item.isRead = true
            return true
        }
        return false
    }

    boolean subscribeInvitedTopic(User user, Long topicId){

        Topic topic = Topic.findById(topicId)

        try{
            Subscription sub = new Subscription();
            sub.user = user;
            sub.topic = topic;
            sub.seriousness = SeriousnessEnum.CASUAL
            sub.save(flush: true, failOnError:true)
            return true
        }
        catch (Exception err){
            return false
        }

    }
    def allTopicsAlphabeticalOrder(){

    }
}
