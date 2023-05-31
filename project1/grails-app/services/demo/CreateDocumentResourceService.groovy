package demo
import grails.gorm.transactions.Transactional
@Transactional
class CreateDocumentResourceService {
    def serviceMethod() {
    }
    int generateRandomNumber(){
        return Math.round(Math.random() * 1e6)
    }
    def AllTopicSubs(def topic){
        List TopicSubscribers = Subscription.createCriteria().listDistinct{
            projections {
                property("user")
            }
            eq("topic", topic)
        }
        return TopicSubscribers
    }

    def forInboxUnread(def topic,def resource){
        try {
            List TopicSubs = AllTopicSubs(topic)
            TopicSubs.each {it ->
                ReadingItem readingItem = new ReadingItem()
                readingItem.user = it
                readingItem.resource = resource
                readingItem.isRead = false
                readingItem.save(flush: true, failOnError: true)
            }
        }
        catch(Exception e){
            return false
        }
        return true
    }
    def createDocumentResource(def params,def userId){

        try{
            User user = User.findById(userId)
            DocumentResource documentResource = new DocumentResource()
            documentResource.createdBy = user
            documentResource.description = params.Description
            documentResource.topic = Topic.findById(Integer.parseInt(params.availableTopicDoc))

            if(params.Document.isEmpty() == false){
                def multipartFile = params.Document
                def docExtension = multipartFile.getOriginalFilename().tokenize('.')[-1]
                def bytes = multipartFile.getBytes()
                int num = generateRandomNumber()

                def url = "grails-app/assets/document/${num}.${docExtension}"
                def newFile = new File("${url}")
                newFile.createNewFile()

                newFile.append(bytes)
                documentResource.filePath = "/assets/${num}.${docExtension}"
            }

            if(documentResource.validate()){
                documentResource.save(flush:true,failOnError:true)
                forInboxUnread(documentResource.topic,documentResource)
                return true
            }
        }
        catch(Exception e){
            return false
        }

    }
}