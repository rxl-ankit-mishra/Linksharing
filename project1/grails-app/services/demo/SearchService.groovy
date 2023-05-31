package demo
import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional
import java.util.Calendar

@Transactional
class SearchService {
    def serviceMethod() {

    }
    List topPostList(){
        def calendar = Calendar.getInstance()
        def startDate

        startDate = calendar.clearTime()

        List posts = ResourceRating.createCriteria().list{
            projections{
                groupProperty('resource')
                avg('score', 'avg_score')
            }
            resource{
                topic{
                    eq("visibility", VisibilityEnum.PUBLIC)
                }
//                ge("dateCreated", startDate.time)
            }
            order('avg_score','desc')
            maxResults 5
        }

        List topPosts = []
        posts.each{item->
            topPosts.add(item[0])
        }

        return topPosts

    }
    def searchFunction(Map params,def User){
        print User.properties
        if(params.searchInput.trim()==''){
            return Resource.list()
        }
        else{
            return Resource.createCriteria().listDistinct{
                createAlias('topic', 't')
                or{
                    ilike('t.name', "%${params.searchInput}%")
                    ilike("description", "%${params.searchInput}%")
                }
            }
        }
    }
}
