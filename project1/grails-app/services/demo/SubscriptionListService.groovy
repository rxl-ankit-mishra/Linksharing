package demo
import grails.gorm.transactions.Transactional
@Transactional
class SubscriptionListService {

    def serviceMethod() {

    }
    def UserSubscription(def user){
        def userSubscriptions = Subscription.createCriteria().list{
            eq("user",user)
            order("dateCreated","desc")
        }

        List UsersubList = []
        userSubscriptions.each{it->
            Map result = [:]
            def subsCount = Subscription.countByTopic(it.topic)
            def postCount = Resource.countByTopic(it.topic)
            result.put("subID", it.id)
            result.put("user",it.user)
            result.put("topic",it.topic)
            result.put("seriousness",it.seriousnes)
            result.put("subsCount",subsCount)
            result.put("postCount",postCount)
            UsersubList.add(result)
        }

        return UsersubList
    }


    HashMap<String, Date> sortByDateAsValue(HashMap<String, Date> hm)
    {
        // Create a list from elements of HashMap
        List<Map.Entry<String, Date> > list =
                new LinkedList<Map.Entry<String, Date> >(hm.entrySet());

        // Sort the list
        Collections.sort(list, new Comparator<Map.Entry<String, Date> >() {
            public int compare(Map.Entry<String, Date> o1,
                               Map.Entry<String, Date> o2)
            {
                return (o1.getValue()).compareTo(o2.getValue());
            }
        });

        // put data from sorted list to hashmap
        HashMap<String, Date> temp = new LinkedHashMap<String, Date>();
        Collections.reverse(list)
        for (Map.Entry<String, Date> aa : list) {
            temp.put(aa.getKey(), aa.getValue());
        }
        return temp;
    }


    List subscriptionList(User user){


        List tempSubList = Subscription.createCriteria().list{
            eq("user",user)
        }
        Map sub_topic_map = [:]
        tempSubList.each{ sub->
            sub_topic_map.put(sub.topic.id, sub.id)
        }

        Map topicMapWithResourceLastUpdated = [:]
        tempSubList.each{ sub->
            def res = Resource.createCriteria().list{
                projections {
                    property("lastUpdated")
                }
                eq("topic", sub.topic)
                order("lastUpdated", "desc")
            }
            if(!res[0]){
                Date defaultDate = new Date()
                defaultDate.setMonth(1)
                topicMapWithResourceLastUpdated.put(sub.topic.id,defaultDate)
            }
            else{
                topicMapWithResourceLastUpdated.put(sub.topic.id,res[0])
            }
        }
        Map sortedTopics = sortByDateAsValue(topicMapWithResourceLastUpdated)

        List finalSubList = []
        sortedTopics.each{topicID,topicLastUpdated->
            finalSubList.add(sub_topic_map.get(topicID))
        }

        List subscriptionList = []
        int count = 0;
        finalSubList.each{ subID->
            def l = Subscription.findById(subID)
            if(count < 5){
                subscriptionList.add(l)
            }
            count++;

        }

        // To get the rows of Subscription table.
        List subsList = []

        subscriptionList.each{it->
            Map result = [:]
            int subsCount = Subscription.countByTopic(it.topic)
            int postCount = Resource.countByTopic(it.topic)
            result.put("subID", it.id)
            result.put("user",it.user)
            result.put("topic",it.topic)
            result.put("seriousness",it.seriousnes)
            result.put("subsCount",subsCount)
            result.put("postCount",postCount)
            subsList.add(result)
        }
        return subsList
    }
}
