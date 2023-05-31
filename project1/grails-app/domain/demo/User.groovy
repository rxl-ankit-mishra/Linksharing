package demo
class User {
    String email
    String username
    String firstName
    String lastName
    String password
    String photo;
    Boolean admin = false
    Boolean active = true
    Date dateCreated
    Date lastUpdated
    static constraints = {
        email unique: true
        username unique: true
        password blank: false
        lastName nullable: true
        photo nullable: true
    }
    static hasMany = [topics: Topic,subscriptions: Subscription, resources: Resource, resourceRatings: ResourceRating, readingItems: ReadingItem]
    static mapping = {
        table 'LocalUser'
    }
}

