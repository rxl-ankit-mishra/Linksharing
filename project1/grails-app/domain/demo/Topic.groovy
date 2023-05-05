package demo

import Enum.VisibilityEnum

class Topic {
    String name
    User createdBy
    VisibilityEnum visibility
    Date dateCreated
    Date lastUpdated

    static belongsTo = [createdBy: User]

    static hasMany = [subscriptions : Subscription, resources : Resource]

    static constraints = {
    }

}
