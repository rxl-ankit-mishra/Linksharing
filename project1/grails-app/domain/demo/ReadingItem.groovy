package demo

class ReadingItem {
    User user;
    Resource resource;
    Boolean isRead;
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User, resource: Resource]

    static constraints = {
        isRead nullable: false, blank: false
    }
}
