<div class=" border mt-2 border bg-secondary rounded d-flex p-1">
    <h5 class="col-sm-6 text-white">Trending Topics</h5>

    <p class="col-sm-3"></p>
    <a class="col-sm-3" style="text-decoration: none" >View All</a>
</div>

<g:each in="${trendingTopicList}" var="subscribedTopic">

    <div class="card p-1 bg-opacity-50" style="background-color: white">
        <div class="container-fluid">

            <div class="row d-flex align-items-center">
                <div class="col-sm-2 ">
                    <g:img dir="images" file="${subscribedTopic["topic"].createdBy.photo.substring(25)}" height = "56" width="60" class="centered" id="imgHolderTrendingList-${subscribedTopic["topic"].id}" name="imgHolderTrendingList-${subscribedTopic["topic"].id}"/>
                </div>

                <div class="col-sm-1"></div>

                <div class="col-sm-8">
                    <div class="card-block">
                        <a href="#" id="topicnameTrending-${subscribedTopic["topic"].id}" class="card-link col-sm-6 subscriptionTopicNameTag" style="text-decoration: none" >${subscribedTopic["topic"].name}</a>
                        <button id="saveTrending-${subscribedTopic["topic"].id}" value="saveBtn" name="saveBtn" onclick="saveButtonTrendingList()"  class="subscriptionSaveBtn offset-1" style="display: none">Save</button>
                        <button id="cancelTrending-${subscribedTopic["topic"].id}" value="cancelBtn" name="cancelBtn" onclick="cancelButtonTrendingList()" class="subscriptionCancelBtn" style="display: none">Cancel</button>
                    </div>

                    <div class="card-block d-flex">
                        <p class="col-sm-4">@${subscribedTopic["topic"].createdBy.username}</p>

                        <p class="col-sm-6">Subscriptions</p>

                        <p class="col-sm-2">Posts</p>
                    </div>

                    <div class="card-block d-flex">

                        <g:if test="${(subscribedTopic["topic"].createdBy==user)  }">
                            <a href="#" class="card-link col-sm-6" style="text-decoration: none; visibility: hidden">Empty</a>

                        </g:if>

                        <g:elseif test="${subscribedTopic["isSubscribed"] && !(subscribedTopic["topic"].createdBy==user)  }">
                            <a href="/updatedashboard/unsubscribeTopic?topicID=${subscribedTopic["topic"].id}" class="card-link col-sm-6" style="text-decoration: none">Unsubscribe</a>

                        </g:elseif>

                        <g:else>
                            <a href="/updatedashboard/subscribeTopic?topicID=${subscribedTopic["topic"].id}" class="card-link col-sm-6" style="text-decoration: none">Subscribe</a>
                        </g:else>

                        <a href="#" class="card-link col-sm-3" style="text-decoration: none">${subscribedTopic["subsCount"]}</a>
                        <a href="#" class="card-link col-sm-3" style="text-decoration: none">${subscribedTopic["postCount"]}</a>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px">

                <div class=" col-sm-7 mt-3">

                    <g:if test="${subscribedTopic["topic"].createdBy==user || user.admin==true  }">

                        <g:select name="${subscribedTopic["subID"]}" id="${subscribedTopic["subID"]}" class="subscriptionsSeriousnessPicker " from="${['CASUAL','SERIOUS','VERY_SERIOUS'] - ["${subscribedTopic["seriousness"]}"]}" value="${subscribedTopic["seriousness"]}"
                                  noSelection="${['':subscribedTopic["seriousness"]]}" />


                        <g:select name="${subscribedTopic["topic"].id}" id="${subscribedTopic["topic"].id}" class="subscriptionsVisibilityPicker" from="${['PUBLIC','PRIVATE'] - ["${subscribedTopic["topic"].visibility}"]}" value="${subscribedTopic["topic"].visibility}"
                                  noSelection="${['':subscribedTopic["topic"].visibility]}" />

                    </g:if>


                </div>

                <div class=" col-sm-5">


                    <g:if test="${subscribedTopic["topic"].createdBy==user || user.admin==true  }">

                        <button type="button" id="editTrending-${subscribedTopic["topic"].id}" class="btn btn-sm chat-icon mt-2 subscriptionEditBtnTrending" >
                            <g:img dir="images" file="Icons/edit_icon.jpeg" height = "23" width="23" style="border-radius: 3px;"/>
                        </button>

                        <button type="button" id="del-${subscribedTopic["topic"].id}" class="btn btn-sm chat-icon mt-2 subscriptionDeleteBtn" >
                            <g:img dir="images" file="Icons/delete_icon.png" height = "30" width="30" style="border-radius: 3px;"/>
                        </button>

                        <button type="button" class="btn btn-sm chat-icon mt-2" >
                            <g:img dir="images" file="Icons/invite.png" height = "24" width="24" style="border-radius: 3px;"/>
                        </button>

                    </g:if>


                </div>

            </div>

        </div>

    </div>
    <br>

</g:each>


<script>

    // AJAX to change seriousness in subscribed topics
    $(document).ready(function(){
        $(".subscriptionsSeriousnessPicker").click(function(){
            $.ajax({url: "/updatedashboard/updateSubscriptionsSeriousness?subid="+this.id+"&seriousness="+this.value, success: function(result){
                    window.location.reload();
                }});
        });
    });

    // AJAX to change visibility in subscribed topics
    $(document).ready(function(){
        $(".subscriptionsVisibilityPicker").click(function(){
            console.log(this.id)
            console.log(this.value)

            $.ajax({url: "/updatedashboard/updateSubscriptionsVisibility?topicid="+this.id+"&visibility="+this.value, success: function(result){
                    window.location.reload();
                }});

        });
    });

    // AJAX to edit button in subscription list
    $(document).ready(function(){
        $(".subscriptionEditBtnTrending").click(function(){
            let id = this.id.substring(13);
            console.log(id)
            let tag = document.querySelector('#topicnameTrending-' + id);
            let saveBtn = document.querySelector('#saveTrending-'+ id);
            let cancelBtn = document.querySelector('#cancelTrending-'+ id);

            tag.contentEditable = true;
            tag.focus()

            saveBtn.style.display = "inline-block"
            cancelBtn.style.display = "inline-block"

        });
    });

    // AJAX to delete button in Trending list
    $(document).ready(function(){
        $(".subscriptionDeleteBtn").click(function(){

            $.ajax({url: "/updatedashboard/deleteTopic?topicid="+this.id.substring(4), success: function(result){
                    window.location.reload();
                }});

        });
    });


    // AJAX to cancel button in Trending list
    function cancelButtonTrendingList(){
        // did some changes,review them
        let id = event.target.id.substring(15)
        let tag = document.querySelector('#topicnameTrending-' + id);
        let saveBtn = document.querySelector('#saveTrending-'+ id);
        let cancelBtn = document.querySelector('#cancelTrending-'+ id);

        saveBtn.style.display = "none"
        cancelBtn.style.display = "none"
        tag.contentEditable = false;

    }

    // AJAX to save button in Trending list
    function saveButtonTrendingList(){

        let id = event.target.id.substring(13)
        let tag = document.querySelector('#topicnameTrending-' + id);
        let saveBtn = document.querySelector('#saveTrending-'+ id);
        let cancelBtn = document.querySelector('#cancelTrending-'+ id);

        let topicName = tag.text

        saveBtn.style.display = "none"
        cancelBtn.style.display = "none"
        tag.contentEditable = false;

        $.ajax({url: "/updatedashboard/updateSubscriptionsTopicName?topicid="+id+"&topicname="+topicName, success: function(result){
                window.location.reload();
            }});

    }
</script>

