package demo
import grails.gorm.transactions.Transactional
@Transactional
class CreateLinkResourceService {
    def serviceMethod() {

    }
    def AllTopicSubs(def topic){
      List TopicSubscribers = Subscription.createCriteria().listDistinct{
         projections {
             property("user")
         }
         eq("topic", topic)
     }
        return TopicSubscribers
    }
    def forInboxUnread(def topic,def resource){
        try {
            List TopicSubs = AllTopicSubs(topic)
            TopicSubs.each {it ->
                ReadingItem readingItem = new ReadingItem()
                readingItem.user = it
                readingItem.resource = resource
                readingItem.isRead = false
                readingItem.save(flush: true, failOnError: true)
            }
        }
        catch(Exception e){
            return false
        }
        return true
    }
    def CreateLinkResource(def params,def userId){
        try{
            User user = User.findById(userId)
            LinkResource linkResource = new LinkResource()
            linkResource.topic = Topic.findById(Integer.parseInt(params.availableTopicDoc))
            linkResource.createdBy = user
            linkResource.description = params.description
            linkResource.url = params.resourceLink
            if(linkResource.validate()){
                linkResource.save(flush:true,failOnError:true)

                forInboxUnread(linkResource.topic,linkResource)
                return true
            }
        }
        catch(Exception e){
            return false
        }

    }
}