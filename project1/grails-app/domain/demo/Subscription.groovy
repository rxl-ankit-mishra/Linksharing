package demo

import Enum.SeriousnessEnum

class Subscription {

    User user
    Topic topic
    SeriousnessEnum seriousnes
    Date dateCreated
    Date lastUpdated

// add dateCreated

    static belongsTo = [user: User, topic: Topic]

    static constraints = {
    }

}
