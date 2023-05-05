<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <title>Document</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-light bg-light">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand" href="#">Link Sharing</a>

        <!-- Toggler Button for mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <g:form class="d-flex mx-auto my-2 my-lg-0">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                <button class="btn btn-outline-success" type="submit">Search</button>
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
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#sendInvitationModal">
                        <li class="nav-item mx-3">
                            <i class="bi bi-clipboard-plus fs-3"></i>
                        </li>
                    </a>
                </li>

                <!-- create Resource Button -->
                <li class="nav-item mx-2">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#shareLinkModal">
                        <i class="bi bi-link-45deg fs-3"></i>
                    </a>
                </li>

                <!-- Create Document resource -->
                <li class="nav-item mx-2">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#documentLinkModal">
                        <i class="bi bi-plus-circle fs-3"></i>
                    </a>
                </li>

                <!-- Profile Dropdown -->
                <li class="nav-item dropdown mx-4">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-circle fs-3"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li><a class="dropdown-item" href="#">Users</a></li>
                        <li><a class="dropdown-item" href="#">Topics</a></li>
                        <li><hr class="dropdown-divider"/></li>
                        <li><a class="dropdown-item" href="#">Posts</a></li>
                        <li>
                            <g:link controller="logout" action="index" class="dropdown-item">Logout</g:link>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>








<!-- modal for topic button -->
<div class="modal fade" id="createTopicModal" tabindex="-1" aria-labelledby="createTopicModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createTopicModalLabel">Create Topic</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form>
                    <div class="mb-3">
                        <label for="topicName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="topicName" aria-describedby="topicNameHelp"/>
                        <div id="topicNameHelp" class="form-text">Enter a name for your topic.</div>
                    </div>
                    <div class="mb-3">
                        <label for="visibility" class="form-label">Visibility</label>
                        <select class="form-select" id="visibility" aria-label="Select visibility">
                            <option selected>Public</option>
                            <option>Private</option>
                        </select>
                    </div>
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Create</button>
            </div>
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
            <div class="modal-body">
                <g:form>
                    <div class="mb-3">
                        <label for="recipientEmail" class="col-form-label">Email:</label>
                        <input type="email" class="form-control" id="recipientEmail" required="true"/>
                    </div>
                    <div class="mb-3">
                        <label for="invitationTopic" class="col-form-label">Topic:</label>
                        <select class="form-select" id="invitationTopic" required="true">
                            <option value="" selected="true" disabled="disabled">Choose a topic...</option>
                            <option value="serious">Serious</option>
                            <option value="very-serious">Very Serious</option>
                            <option value="casual">Casual</option>
                        </select>
                    </div>
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Send Invitation</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="shareLinkModal" tabindex="-1" aria-labelledby="shareLinkModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="shareLinkModalLabel">Share Link</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form>
                    <div class="mb-3">
                        <label for="linkURL" class="col-form-label">Link:</label>
                        <input type="url" class="form-control" id="linkURL" required>
                    </div>
                    <div class="mb-3">
                        <label for="linkDescription" class="col-form-label">Description:</label>
                        <textarea class="form-control" id="linkDescription" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="linkTopic" class="col-form-label">Topic:</label>
                        <select class="form-select" id="linkTopic" required>
                            <option value="" selected disabled>Choose a topic...</option>
                            <option value="serious">Serious</option>
                            <option value="very-serious">Very Serious</option>
                            <option value="casual">Casual</option>
                        </select>
                    </div>
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Share Link</button>
            </div>
        </div>
    </div>
</div>



<!-- Modal -->
<div class="modal fade" id="documentLinkModal" tabindex="-1" aria-labelledby="documentLinkModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="documentLinkModalLabel">Document Link</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <g:form>
                    <div class="mb-3">
                        <label for="documentInput" class="form-label">Document</label>
                        <input type="file" class="form-control" id="documentInput">
                    </div>
                    <div class="mb-3">
                        <label for="descriptionInput" class="form-label">Description</label>
                        <input type="text" class="form-control" id="descriptionInput">
                    </div>
                    <div class="mb-3">
                        <label for="topicSelect" class="form-label">Topic</label>
                        <select class="form-select" id="topicSelect">
                            <option value="serious">Serious</option>
                            <option value="very-serious">Very Serious</option>
                            <option value="casual">Casual</option>
                        </select>
                    </div>
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Share</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</body>
</html>