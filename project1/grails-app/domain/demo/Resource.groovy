package demo
class Resource {
    Topic topic
    User createdBy
    String description
    Date dateCreated
    Date lastUpdated

    static belongsTo = [createdBy: User, topic: Topic]

    static hasMany = [readingItem: ReadingItem, resourceRating: ResourceRating]

    static mapping = {
        table "LocalResource"
    }

    static constraints = {
        description nullable:false ,blank:false
    }
}
