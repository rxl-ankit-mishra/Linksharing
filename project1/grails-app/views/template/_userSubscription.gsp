
<g:each in="${subscribedTopicList}" var="userSubscription">

    <div class="card p-1 bg-opacity-50" style="background-color: white">
        <div class="container-fluid">

            <div class="row d-flex align-items-center">
                <div class="col-sm-1"></div>
                <div class="col-sm-8">
                     <div class="card-block">
                        <div>${userSubscription.topicName}</a>
%{--                        <button id="save-${subscribedTopic["topic"].id}" value="saveBtn" name="saveBtn" onclick="saveButtonSubList()"  class="subscriptionSaveBtn offset-1" style="display: none">Save</button>--}%
%{--                        <button id="cancel-${subscribedTopic["topic"].id}" value="cancelBtn" name="cancelBtn" onclick="cancelButtonSubList()" class="subscriptionCancelBtn" style="display: none">Cancel</button>--}%
    </div>
                    <div class="card-block d-flex">

                        <p class="col-sm-6">Subscriptions</p>

                        <p class="col-sm-2">Posts</p>
                    </div>

                    <div class="card-block d-flex">



%{--                        <g:if test="${(subscribedTopic["topic"].createdBy==user)  }">--}%
%{--                            <a href="#" class="card-link col-sm-6" style="text-decoration: none; visibility: hidden">Empty</a>--}%

%{--                        </g:if>--}%

%{--                        <g:else>--}%
%{--                            <a href="/updatedashboard/unsubscribeTopic?topicID=${subscribedTopic["topic"].id}" class="card-link col-sm-6" style="text-decoration: none">Unsubscribe</a>--}%

%{--                        </g:else>--}%



                        <a href="#" class="card-link col-sm-3" style="text-decoration: none">${userSubscription["subCount"]}</a>
                        <a href="#" class="card-link col-sm-3" style="text-decoration: none">${userSubscription["postCount"]}</a>
                    </div>
                </div>
            </div>

%{--            <div class="row" style="margin-top: 10px; margin-bottom: 10px">--}%

%{--                <div class=" col-sm-7 mt-3">--}%
%{--                    <g:select name="${subscribedTopic["subID"]}" id="${subscribedTopic["subID"]}" class="subscriptionsSeriousnessPicker " from="${['CASUAL','SERIOUS','VERY_SERIOUS'] - ["${subscribedTopic["seriousness"]}"]}" value="${subscribedTopic["seriousness"]}"--}%
%{--                              noSelection="${['':subscribedTopic["seriousness"]]}" />--}%


%{--                    <g:if test="${subscribedTopic["topic"].createdBy==user || user.admin==true  }">--}%
%{--                        <g:select name="${subscribedTopic["topic"].id}" id="${subscribedTopic["topic"].id}" class="subscriptionsVisibilityPicker" from="${['PUBLIC','PRIVATE'] - ["${subscribedTopic["topic"].visibility}"]}" value="${subscribedTopic["topic"].visibility}"--}%
%{--                                  noSelection="${['':subscribedTopic["topic"].visibility]}" />--}%
%{--                    </g:if>--}%

%{--                </div>--}%

%{--                <div class=" col-sm-5">--}%


                    %{--                    <g:if test="${subscribedTopic["topic"].createdBy==user || user.admin==true  }">--}%

                    %{--                        <button type="button" id="edit-${subscribedTopic["topic"].id}" class="btn btn-sm chat-icon mt-2 subscriptionEditBtn" >--}%
                    %{--                            <g:img dir="images" file="Icons/edit_icon.jpeg" height = "23" width="23" style="border-radius: 3px;"/>--}%
                    %{--                        </button>--}%

                    %{--                        <button type="button" id="del-${subscribedTopic["topic"].id}" class="btn btn-sm chat-icon mt-2 subscriptionDeleteBtn" >--}%
                    %{--                            <g:img dir="images" file="Icons/delete_icon.png" height = "30" width="30" style="border-radius: 3px;"/>--}%
                    %{--                        </button>--}%

                    %{--                    </g:if>--}%

                    %{--                    <button type="button" class="btn btn-sm chat-icon mt-2" >--}%
                    %{--                        <g:img dir="images" file="Icons/invite.png" height = "24" width="24" style="border-radius: 3px;"/>--}%
                    %{--                    </button>--}%

%{--                </div>--}%

%{--            </div>--}%

        </div>

    </div>
    <br>

</g:each>
