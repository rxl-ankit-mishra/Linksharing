package demo

import grails.gorm.transactions.Transactional

@Transactional
class RecentShareService {
    def serviceMethod() {

    }
    def AllRecents(){
        def res = Resource.createCriteria().list{
          order("lastUpdated","desc")
            maxResults 5
        }
        return res
    }
}
