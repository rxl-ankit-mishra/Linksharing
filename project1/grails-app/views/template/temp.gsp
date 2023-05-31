





<g:each in="${userTopic}" var="subscribedTopic">

    <div class="card p-1 bg-opacity-50" style="background-color: white">
        <div class="container-fluid">

            <div class="row d-flex align-items-center">
                <div class="col-sm-2 ">
                    <g:img dir="images" file="${subscribedTopic["topic"].createdBy.photo.substring(25)}" height = "56" width="60" class="centered" id="imgHolderSubList-${subscribedTopic["topic"].id}" name="imgHolderSubList-${subscribedTopic["topic"].id}" />
                </div>

                <div class="col-sm-1"></div>

                <div class="col-sm-8">
                    <div class="card-block">
                        <a href="#" id="topicname-${subscribedTopic["topic"].id}" class="card-link col-sm-6 subscriptionTopicNameTag" style="text-decoration: none">${subscribedTopic["topic"].name}</a>
                        <button id="save-${subscribedTopic["topic"].id}" value="saveBtn" name="saveBtn" onclick="saveButtonSubList()"  class="subscriptionSaveBtn offset-1" style="display: none">Save</button>
                        <button id="cancel-${subscribedTopic["topic"].id}" value="cancelBtn" name="cancelBtn" onclick="cancelButtonSubList()" class="subscriptionCancelBtn" style="display: none">Cancel</button>
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
                        <g:else>
                            <a href="/updatedashboard/unsubscribeTopic?topicID=${subscribedTopic["topic"].id}" class="card-link col-sm-6" style="text-decoration: none">Unsubscribe</a>
                        </g:else>
                        <a href="#" class="card-link col-sm-3" style="text-decoration: none">${subscribedTopic["subCount"]}</a>
                        <a href="#" class="card-link col-sm-3" style="text-decoration: none">${subscribedTopic["postCount"]}</a>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 10px">
                <div class=" col-sm-7 mt-3">
                    <g:select name="${subscribedTopic["subID"]}" id="${subscribedTopic["subID"]}" class="subscriptionsSeriousnessPicker " from="${['CASUAL','SERIOUS','VERY_SERIOUS'] - ["${subscribedTopic["seriousness"]}"]}" value="${subscribedTopic["seriousness"]}"
                              noSelection="${['':subscribedTopic["seriousness"]]}" />
                </div>

                <div class=" col-sm-5">
                    <button type="button" class="btn btn-sm chat-icon mt-2" >
                        <g:img dir="images" file="icon/message.png" height = "24" width="24" style="border-radius: 3px;"/>
                    </button>


                </div>
            </div>
        </div>
    </div>




</g:each>


    <div class="nav-item">
        <!-- Button to trigger modal -->
        <a  style="text-decoration: none" id="ForgotPasswordDropdownButton" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
            data-bs-target="#ForgotPasswordModal">
            View All
        </a>
        <!-- Modal functionality -->
        <div class="modal fade" id="ForgotPasswordModal" tabindex="-1"
             aria-labelledby="ForgotPasswordModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- modal content -->
                    <div class="modal-header">
                        <h5 class="modal-title" id="Forgot PasswordModalLabel">Topics</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>

                    <div class="modal-body">



                        <g:each in="${allTopic}" var="subscribedTopic">

                            <div class="card p-1 bg-opacity-50" style="background-color: white">
                                <div class="container-fluid">

                                    <div class="row d-flex align-items-center">
                                        <div class="col-sm-2 ">
                                            <g:img dir="images" file="${subscribedTopic["topic"].createdBy.photo.substring(25)}" height = "56" width="60" class="centered" id="imgHolderSubList-${subscribedTopic["topic"].id}" name="imgHolderSubList-${subscribedTopic["topic"].id}" />
                                        </div>

                                        <div class="col-sm-1"></div>

                                        <div class="col-sm-8">
                                            <div class="card-block">
                                                <a href="#" id="topicname-${subscribedTopic["topic"].id}" class="card-link col-sm-6 subscriptionTopicNameTag" style="text-decoration: none">${subscribedTopic["topic"].name}</a>
                                                <button id="save-${subscribedTopic["topic"].id}" value="saveBtn" name="saveBtn" onclick="saveButtonSubList()"  class="subscriptionSaveBtn offset-1" style="display: none">Save</button>
                                                <button id="cancel-${subscribedTopic["topic"].id}" value="cancelBtn" name="cancelBtn" onclick="cancelButtonSubList()" class="subscriptionCancelBtn" style="display: none">Cancel</button>
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
                                                <g:else>
                                                    <a href="/updatedashboard/unsubscribeTopic?topicID=${subscribedTopic["topic"].id}" class="card-link col-sm-6" style="text-decoration: none">Unsubscribe</a>
                                                </g:else>
                                                <a href="#" class="card-link col-sm-3" style="text-decoration: none">${subscribedTopic["subCount"]}</a>
                                                <a href="#" class="card-link col-sm-3" style="text-decoration: none">${subscribedTopic["postCount"]}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 10px; margin-bottom: 10px">
                                        <div class=" col-sm-7 mt-3">
                                            <g:select name="${subscribedTopic["subID"]}" id="${subscribedTopic["subID"]}" class="subscriptionsSeriousnessPicker " from="${['CASUAL','SERIOUS','VERY_SERIOUS'] - ["${subscribedTopic["seriousness"]}"]}" value="${subscribedTopic["seriousness"]}"
                                                      noSelection="${['':subscribedTopic["seriousness"]]}" />
                                        </div>

                                        <div class=" col-sm-5">
                                            <button type="button" class="btn btn-sm chat-icon mt-2" >
                                                <g:img dir="images" file="icon/message.png" height = "24" width="24" style="border-radius: 3px;"/>
                                            </button>


                                        </div>
                                    </div>
                                </div>
                            </div>

                        </g:each>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
