package demo

import grails.gorm.transactions.Transactional

@Transactional
class UserTopicAndSubscriberService {
    def serviceMethod() {
    }
    def GetUserTopic(def user) {
        def UserTopic = Topic.createCriteria().list{
            eq("createdBy", user)
        }
        return UserTopic
    }
    def GetUserSubscription(def user) {
        def UserSubscription = Topic.createCriteria().list{
            eq("user", user)
        }
        return UserTopic
    }
}
