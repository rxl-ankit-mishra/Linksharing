package demo
import grails.gorm.transactions.Transactional
@Transactional
class UserSubscriptionAndTopicCountService {
    def serviceMethod() {

    }
    def SubAndTopicCount(def user) {
        def TopicCount = Topic.createCriteria().count(){
            eq("createdBy", user)
        }
        def SubscriptionCount = Subscription.createCriteria().count(){
            eq("user",user)
        }
        ArrayList<Integer>SubAndTopCount = new ArrayList<>()
        SubAndTopCount.add(TopicCount)
        SubAndTopCount.add(SubscriptionCount)
        return SubAndTopCount
    }
}
