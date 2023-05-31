<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        setTimeout(function() {
            var successMessage = document.getElementById("success-message");
            successMessage.style.display = "none";
        }, 4000); // Delay of 4000 milliseconds (4 seconds)
    </script>
</head>

<body>

<g:if test="${flash.successMessage}">
<div id="success-message" class="toast show position-fixed top-0 start-50 translate-middle-x" style="z-index: 9999; background-color: deepskyblue;">
    <div class="toast-header" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
        <strong class="me-auto">${flash.successMessage}</strong>
        <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
    </div>
</div>
</div>
</g:if>

<nav class="navbar navbar-expand-md navbar-light bg-light">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand" href="/dashboard"> <g:img dir="images" file="icon/ls.png" height = "70" width="74" style="border-radius: 3px;"/></a>

        <!-- Toggler Button for mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">


            <g:form class="d-flex mx-auto my-2 my-lg-0" controller="search"  role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="searchInput" name="searchInput">
                <button class="btn btn-outline-info" type="submit">Search</button>
            </g:form>

            <ul class="navbar-nav ml-auto mx-4">
                <!-- create topic Button -->
                <li class="nav-item mx-2">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#createTopicModal">
                        <i class="bi bi-chat-dots fs-3"></i>
                    </a>
                </li>

                <!-- send invitation Button -->
                <li class="nav-item mx-2">
                    <a id="sendInvitationModal1"class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#sendInvitationModal">

                            <i class="bi bi-clipboard-plus fs-3"></i>

                    </a>
                </li>

                <!-- Create Link Resource-->
                <li class="nav-item mx-2">
                    <a id="linkResourceBtn" class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#shareLinkModal">
                        <i class="bi bi-link-45deg fs-3"></i>
                    </a>
                </li>

                <!-- Create Document Resource -->
                <li class="nav-item mx-2">
                    <a id="DocumentResourceBtn" class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#documentLinkModal">
                        <i class="bi bi-plus-circle fs-3"></i>
                    </a>
                </li>

                <!-- Profile Dropdown -->
                <li class="pt-3" controller="usersProfile" action="index">
                    ${user.username}
                </li>
                <li class="nav-item dropdown mx-4">

                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <g:img dir="images" file="${user.photo.substring(25)}" height = "46" width="46" style="border-radius: 40%;"/>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <g:if test = "${user.admin}">
                            <li>
                                <g:link controller="profile" class="dropdown-item">Profile</g:link>
                            </li>
                            <li>
                                <g:link controller="showUser" action="index" class="dropdown-item">Users</g:link>
                            </li>
                            <li>
                                <g:link controller="AllTopic" action="index" class="dropdown-item">Topics</g:link>
                            </li>
                            <li>
                                <g:link controller="AllPost" action="index" class="dropdown-item">Posts</g:link>
                            </li>
                            <hr>
                            <li>
                                <g:link controller="logout" class="dropdown-item">Logout</g:link>
                            </li>


                        </g:if>
                        <g:else>
                            <li>
                                <g:link controller="profile" action="index" class="dropdown-item">Profile</g:link>
                            </li>
                            <li>
                                <g:link controller="logout" action="index" class="dropdown-item">Logout</g:link>
                            </li>
                        </g:else>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</nav>

%{--Create topic modal--}%
<div class="modal fade" id="createTopicModal" tabindex="-1" aria-labelledby="createTopicModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createTopicModalLabel">Create Topic</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <g:form controller="CreateTopic" action="createTopic">
                <div class="modal-body">

                    <div class="mb-3">
                        <label for="topicName" class="form-label" >Name</label>
                        <input type="text" class="form-control" id="topicName" name = "topicName" aria-describedby="topicNameHelp" required/>
                        <div id="topicNameHelp" class="form-text">Enter a name for your topic.</div>
                    </div>
                    <div class="mb-3">
                        <label for="visibility"  class="form-label">Visibility</label>
                        <select class="form-select" id="visibility" aria-label="Select visibility" name = "visibility" >
                            <option selected>Public</option>
                            <option>Private</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Create</button>

                </div>
            </g:form>
        </div>
    </div>
</div>
<!-- Send Invitation Modal -->
<div class="modal fade" id="sendInvitationModal" tabindex="-1" aria-labelledby="sendInvitationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="sendInvitationModalLabel">Send Invitation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <g:form controller="login" action="topicInvite">
            <div class="modal-body">

                    <div class="mb-3">
                        <label for="recipientEmail" class="col-form-label">Email:</label>
                        <input type="email" class="form-control" id="recipientEmail" name="Email" required="true"/>
                    </div>
                    <div class="mb-3">
                        <label for="invitationTopic" class="col-form-label">Topic:</label>
                        <select class="form-select" id="invitationTopic" name="availableTopicDoc" required>

                        </select>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Send Invitation</button>
            </div>
            </g:form>
        </div>

    </div>
</div>



<!-- share Link modal-->
<div class="modal fade" id="shareLinkModal" tabindex="-1" aria-labelledby="shareLinkModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="shareLinkModalLabel">Share Link</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <g:form controller="dashboard" action=" createLinkResource">
                <div class="modal-body">

                    <div class="mb-3">
                        <label f="mb-3">
                            <label or="linkURL" class="col-form-label">Link:</label>
                            <input type="url" class="form-control" id="linkURL" name="resourceLink" required>
                    </div>
                    <div class="mb-3">
                        <label for="linkDescription" class="col-form-label">Description:</label>
                        <textarea class="form-control" id="linkDescription" name="description" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="linkTopic" class="col-form-label">Topic:</label>
                        <select class="form-select" id="linkTopic" name="availableTopicDoc" required>

                        </select>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Share Link</button>
                </div>
            </g:form>
        </div>
    </div>
</div>



<!-- share document modal -->
<div class="modal fade" id="documentLinkModal" tabindex="-1" aria-labelledby="documentLinkModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="documentLinkModalLabel">Share Document</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <g:uploadForm controller="dashboard" action="createDocumentResource">
                <div class="modal-body">

                    <div class="mb-3">
                        <label for="documentInput" class="form-label">Document</label>
                        <input type="file" class="form-control" id="documentInput" name="Document">
                    </div>
                    <div class="mb-3">
                        <label for="descriptionInput" class="form-label">Description</label>
                        <input type="text" class="form-control" id="descriptionInput" name="Description">
                    </div>
                    <div class="mb-3">
                        <label for="topicSelect" class="form-label" >Topic:</label>
                        <select class="form-select" id="topicSelect" name="availableTopicDoc">

                        </select>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Share</button>
                </div>
            </g:uploadForm>
        </div>
    </div>
</div>


<script>
    $(document).ready(function(){
        $("#DocumentResourceBtn").click(function(){
            var selectElement = document.getElementById("topicSelect")
            selectElement.options.length = 0;

            $.ajax({url: "/dashboard/loadSubscribedTopics", success: function(result){
                    for(let i =0; i< result.key.length; ++i){
                        var option = document.createElement("option");
                        option.text = result.key[i][1];
                        option.value = result.key[i][0];
                        selectElement.add(option);
                    }
                }});
        });
    });
    $(document).ready(function(){
        $("#linkResourceBtn").click(function(){

            let selectElement = document.getElementById("linkTopic")
            selectElement.options.length = 0;

            $.ajax({url: "/dashboard/loadSubscribedTopics", success: function(result){
                    for(let i =0; i< result.key.length; ++i){
                        var option = document.createElement("option");
                        option.text = result.key[i][1];
                        option.value = result.key[i][0];
                        selectElement.add(option);
                    }
                }});
        });
    });
    $(document).ready(function(){
        $("#sendInvitationModal1").click(function(){
            var selectElement = document.getElementById("invitationTopic")
            selectElement.options.length = 0;
            $.ajax({url: "/dashboard/loadSubscribedTopics", success: function(result){
                    for(let i =0; i< result.key.length; ++i){
                        var option = document.createElement("option");
                        option.text = result.key[i][1];
                        option.value = result.key[i][0];
                        selectElement.add(option);
                    }
                }});
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</html>