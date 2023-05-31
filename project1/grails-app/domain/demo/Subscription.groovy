package demo

import Enum.SeriousnessEnum

class Subscription {
    User user
    Topic topic
    SeriousnessEnum seriousnes
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user: User, topic: Topic]

    static constraints = {
    }

}
