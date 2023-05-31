package demo
import grails.gorm.transactions.Transactional
@Transactional
class InboxResourceService {
    def serviceMethod() {

    }
    def UnreadResource(def user){
        List unreadItem = ReadingItem.createCriteria().list {
            eq("user",user)
            eq("isRead",false)
            order("dateCreated","desc")
        }
        return unreadItem
    }
}
