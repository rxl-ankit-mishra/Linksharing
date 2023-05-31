<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet"/>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>


    <script>
        $(document).ready(function() {
            $('#TrendingDataTable').dataTable({
                "ordering": true,
                "paging": true,
                "lengthMenu": [5, 10, 15, 20, 25],
                "pageLength": 5,
                "searching": true,
                "order": [[ 0, "asc" ]],
            });
        });
    </script>
</head>
<style>

.rating {
    display: inline-block;
    direction: rtl;
}

.rating input {
    display: none;
}

.rating label {
    font-size: 30px;
    color: #ddd;
    cursor: pointer;
    display: inline-block;
    transform: scale(-1, 1);
}

.rating label:before {
    content: '\2605';
}

.rating input:checked ~ label {
    color: #ffce00;
}
.bg-custom-dark {
    background-color: #e9ecef;
}
</style>
<body>
<g:if test="${user}">
    <g:render template="/template/navbar"/>
</g:if>
<g:else>
    <header class="bg-custom-dark text-white py-2 px-4 d-flex justify-content-between align-items-center">
        %{--	<h1>Link Sharing</h1>--}%
        <a class="navbar-brand" href="/dashboard"> <g:img dir="images" file="icon/ls.png" height = "70" width="74" style="border-radius: 3px;"/></a>

    </header>
</g:else>



<div class="container-fluid p-5">

    <div class="row">
%{--        1 Coloumn--}%
        <div class="container col-sm-6 mb-2">


            <div class="card p-2" style="background-color: #eee">
                <div class="container-fluid" >
                    <div class="row d-flex align-items-center" >
                        <div class="col-sm-3 ">
                            <g:img dir="images" file="${resource.createdBy.photo.substring(25)}" height = "96" width="100" class="centered" />
                        </div>

                        <div class="col-sm-8">
                            <div class="card-block">
                                <label>
                                    <h5 class="card-title">${resource.createdBy.firstName} ${resource.createdBy.lastName} </h5>
                                </label>
                                <label class="offset-2">
                                    <a href="/topic?topicId=${resource.topic.id}" style="text-decoration: none;" >${resource.topic.name} </a>
                                </label>

                            </div>
                            <div class="card-block">
                                <label>@${resource.createdBy.username}</label>
                                <label id="postDate" class="offset-3">${resource.dateCreated}</label>
                            </div>

                            <div class="card-block d-flex mt-2">

                                <g:if test="${user && isSubscribed}">
                                    <div hidden="true" id="${resourceRating}" class="resourceRatingdiv">i</div>

                                    <div class="rating" id="${resource.id}">
                                        <input type="radio" id="star5" name="rating" value="5" />
                                        <label for="star5" title="5 stars"></label>
                                        <input type="radio" id="star4" name="rating" value="4" />
                                        <label for="star4" title="4 stars"></label>
                                        <input type="radio" id="star3" name="rating" value="3" />
                                        <label for="star3" title="3 stars"></label>
                                        <input type="radio" id="star2" name="rating" value="2" />
                                        <label for="star2" title="2 stars"></label>
                                        <input type="radio" id="star1" name="rating" value="1" />
                                        <label for="star1" title="1 star"></label>
                                    </div>

                                </g:if>

                                <div id="showRatingDiv" class="mt-2 offset-sm-1">Average Rating : ${avgPostRating} (${postRatingCount})</div>


                                %{--                                <div class="mt-2">Ratings : </div>--}%
                                %{--                                <div id="postRatingCountDiv" class="mt-2 "> ${postRatingCount} </div>--}%

                            </div>

                        </div>

                    </div>

                    <div class="row d-flex align-items-center">
                        <p>${resource.description}</p>
                    </div>

                    <div class="row align-items-center justify-content-end">

                        <div class="col-sm-5"></div>

                        <g:if test="${  user &&  ( user == resource.createdBy || user.admin == true )    }">

                            <div class="col-sm-2 justify-content-end">
                                <a href="/post/deletePost?postId=${resource.id}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">Delete</a>
                            </div>


                            <!-- Edit modal for resources ---->

                            <g:if test="user">

                                <g:if test="${resource.class as String == 'class linksharing.LinkResource'}">
                                    <div class="col-sm-2">
                                        <!-- Button to trigger modal id="createLinkResourceModalDropdownButton"-->

                                        <a  style="text-decoration: none" id="EditLinkResourceDropdownButton" class="btn btn-link chat-icon" data-bs-toggle="modal"
                                            data-bs-target="#editLinkResourceModal">
                                            Edit
                                        </a>

                                        <!-- Link Resource Modal -->
                                        <div class="modal fade" id="editLinkResourceModal" tabindex="-1"
                                             aria-labelledby="editLinkResourceModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <!-- modal content -->
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editLinkResourceModalLabel">Share Link Resource</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">

                                                        <g:form controller="post" action="editLinkResource">

                                                            <textarea rows="1" cols="5" name="postId" hidden>${resource.id}</textarea>

                                                            <div class="mb-3">
                                                                <label for="editLinkResourceModal" class="form-label">Link</label>
                                                                <input type="url" class="form-control" id="resourceLink" name="resourceLink" placeholder="${resource.url}" >
                                                            </div>

                                                            <div class="mb-3">
                                                                <label for="editLinkResourceModal" class="form-label">Description</label>
                                                                <textarea id="w3review" name="resourceDescription" rows="4" cols="44" placeholder="${resource.description}"></textarea>

                                                            </div>

                                                            <div class="mb-3">
                                                                <label for="editLinkResourceModal" class="form-label">Topic</label>

                                                                <select class="form-select" id="availableTopics" name="availableTopic" disabled>
                                                                    <option>${resource.topic.name}</option>
                                                                </select>

                                                            </div>

                                                            <div class="modal-footer">
                                                                <button id = "closeEditLinkResourceButton" type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary">Edit</button>
                                                            </div>

                                                        </g:form>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </g:if>

                                <g:else>
                                    <div class="col-sm-2">
                                        <!-- Button to trigger modal id="createLinkResourceModalDropdownButton"-->

                                        <a  style="text-decoration: none" id="EditDocumentResourceDropdownButton" class="btn btn-link chat-icon" data-bs-toggle="modal"
                                            data-bs-target="#editDocumentResourceModal">
                                            Edit
                                        </a>

                                        <!-- Link Resource Modal -->
                                        <div class="modal fade" id="editDocumentResourceModal" tabindex="-1"
                                             aria-labelledby="editDocumentResourceModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <!-- modal content -->
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editDocumentResourceModalLabel">Share Document Resource</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">

                                                        <g:uploadForm controller="post" action="editDocumentResource">

                                                            <textarea rows="1" cols="5" name="postId" hidden>${resource.id}</textarea>

                                                            <div class="mb-3">
                                                                <label for="editDocumentResourceModal" class="form-label">Document</label>
                                                                <input type="file" class="form-control" id="resourceDocument" name="resourceDoc">
                                                            </div>

                                                            <div class="mb-3">
                                                                <label for="editDocumentResourceModal" class="form-label">Description</label>
                                                                <textarea id="w3review1" name="resourceDescription" rows="4" cols="44" placeholder="${resource.description}"></textarea>

                                                            </div>

                                                            <div class="mb-3">
                                                                <label for="editDocumentResourceModal" class="form-label">Topic</label>

                                                                <select class="form-select" id="availableTopics1" name="availableTopic" disabled>
                                                                    <option>${resource.topic.name}</option>
                                                                </select>

                                                            </div>

                                                            <div class="modal-footer">
                                                                <button id = "closeDocumentLinkResourceButton" type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary">Edit</button>
                                                            </div>

                                                        </g:uploadForm>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </g:else>

                            </g:if>




                        </g:if>

                        <div class="col-sm-3">
                            <g:if test="${resource.class as String == 'class demo.LinkResource'}">
                                <a href="${resource.url}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">View Full Site</a>
                            </g:if>

                            <g:else>

                                <a href="${resource.filePath}" style="text-decoration: none" class="card-link col-sm-6" download>Download</a>

                            </g:else>


                        </div>

                    </div>


                </div>
            </div>



        </div>

%{--        <div class="container col-sm-1">--}%
%{--        </div>--}%

      <g:if test="${user}">
        <div class="container col-sm-6">
            <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                <h5 class="col-sm-6 text-white">Trending Topics</h5>
            </div>
            <g:render template="/template/trendingTopic"/>
        </div>
      </g:if>

      <g:else>
          <div class="col-md-6 right-align">
              <div class="login-form bg-light p-2 mb-3 section-border">
                  <h2>Login</h2>
                  <g:uploadForm controller="login" action="loginUser">
                      <div class="form-group">
                          <label for="email">Email/Username:</label>
                          <input type="text" id="email" class="form-control" name="email" required>
                          <p id="emailMessage" class="error-message" style="color: #de4343; display: none;">Email size exceeded (maximum 50 characters).</p>
                      </div>
                      <div class="form-group">
                          <label for="password">Password:</label>
                          <input type="password" id="password" class="form-control" name="password" required>
                      </div>
                      <input type="submit" value="Login" class="btn btn-primary">
                  </g:uploadForm>

                  <div class="nav-item">
                      <!-- Button to trigger modal -->
                      <a style="text-decoration: none" id="ForgotPasswordDropdownButton" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal" data-bs-target="#ForgotPasswordModal">
                          Forgot Password?
                      </a>
                      <!-- Modal functionality -->
                      <div class="modal fade" id="ForgotPasswordModal" tabindex="-1" aria-labelledby="ForgotPasswordModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                              <div class="modal-content">
                                  <!-- modal content -->
                                  <div class="modal-header">
                                      <h5 class="modal-title" id="Forgot PasswordModalLabel">Send Default Password</h5>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>
                                  <div class="modal-body">
                                      <g:form controller="login" action="sendForgotPasswordMail">
                                          <div class="mb-3">
                                              <label for="forgotPasswordEmail" class="form-label">Email*</label>
                                              <input type="email" class="form-control" id="forgotPasswordEmail" name="forgotPasswordEmail" required>
                                          </div>
                                          <div class="modal-footer">
                                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                              <button class="btn btn-primary">Send</button>
                                          </div>
                                      </g:form>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="register-form bg-light p-2 mb-3 section-border">
                  <h2>Register</h2>
                  <g:uploadForm controller="register" action="registerUser">
                      <div class="form-group">
                          <label for="firstname">First Name:</label>
                          <input type="text" id="firstname" class="form-control" name="firstname" required>
                          <p id="firstnameMessage" class="error-message" style="display: none; color:#e54444;">First name size exceeded (maximum 30 characters).</p>
                      </div>
                      <div class="form-group">
                          <label for="lastname">Last Name:</label>
                          <input type="text" id="lastname" class="form-control" name="lastname" required>
                          <p id="sizeMessage5" style="color:#ce4848;"></p>
                      </div>
                      <div class="form-group">
                          <label for="email">Email:</label>
                          <input type="email" id="email1" class="form-control" name="email" required>
                          <p id="emailUsernameLengthMessage" class="error-message" style="display: none; color:#d04848">Email size exceeded (maximum 40 characters).</p>
                      </div>
                      <div class="form-group">
                          <label for="username">Username:</label>
                          <input type="text" id="username" class="form-control" name="username" required>
                          <p id="sizeMessage1" style="color:#ce4848;"></p>
                      </div>
                      <div class="form-group">
                          <label for="password">Password:</label>
                          <input type="password" id="password1" class="form-control" name="password" required>
                          <p id="passwordLengthMessage" class="error-message" style="display: none; color:#d94141">Password must be at least 8 characters long.</p>
                      </div>
                      <div class="form-group">
                          <label for="confirmpassword">Confirm Password:</label>
                          <input type="password" id="confirmpassword" class="form-control" name="confirmpassword" required>
                      </div>
                      <div class="form-group">
                          <label for="photo">Photo:</label>
                          <input type="file" id="photo" class="form-control-file" name="photo">
                          <p id="photoSizeMessage" class="error-message" style="display: none; color:#d03333;">Size limit exceeded (maximum 128 KB).</p>
                      </div>
                      <input type="submit" value="Register" class="btn btn-primary">
                  </g:uploadForm>
              </div>
          </div>
      </g:else>


    </div>

</div>


</body>

<script>

    function formatDateTime(dateString) {
        const date = new Date(dateString);

        // Format the time component
        let hours = date.getHours();
        let minutes = date.getMinutes();
        const ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12 || 12;
        minutes = minutes < 10 ? '0' + minutes : minutes;
        const time = hours + ':' + minutes + ' ' + ampm;

        // Format the date component
        const day = date.getDate();
        const month = date.toLocaleString('en-US', { month: 'short' });
        const year = date.getFullYear();
        const formattedDate = day + ' ' + month + ' ' + year;

        return time + " " + formattedDate;
    }

    $(document).ready(function(){
        const dateDiv = document.querySelector('#postDate')
        dateDiv.innerHTML = formatDateTime(dateDiv.innerHTML)
    });


    const ratingInputs = document.querySelectorAll('input[name="rating"]');
    let selectedRating = null;

    ratingInputs.forEach(input => {
        input.addEventListener('change', () => {
            selectedRating = input.value;
            const ratingDiv = document.querySelector('.rating')
            $.ajax({url: "/post/rating?rating="+selectedRating+"&postId="+ratingDiv.id, success: function(result){
                    document.querySelector("#showRatingDiv").innerHTML = "Average Rating : " + parseFloat(result[1]).toFixed(1) + " (" + result[0] + ")"

                }});

        });
    });
    document.addEventListener("DOMContentLoaded", function() {

        var setResourceRating = document.querySelector(".resourceRatingdiv")
        var ratingElement = document.querySelector(".rating");


        if(setResourceRating.id=="1"){
            var star1 = ratingElement.querySelector("#star1");
            star1.checked = true
        }
        else if(setResourceRating.id=="2"){
            var star2 = ratingElement.querySelector("#star2");
            star2.checked = true
        }
        else if(setResourceRating.id=="3"){
            var star3 = ratingElement.querySelector("#star3");
            star3.checked = true
        }
        else if(setResourceRating.id=="4"){
            var star4 = ratingElement.querySelector("#star4");
            star4.checked = true
        }
        else if(setResourceRating.id=="5"){
            var star5 = ratingElement.querySelector("#star5");
            star5.checked = true
        }
    });
</script>


<script>
    var firstnameInput = document.getElementById("firstname");

    var firstnameMessage = document.getElementById("firstnameMessage");

    function checkFirstnameSize() {
        if (firstnameInput.value.trim().length > 30) {
            firstnameMessage.style.display = "block";
        } else {
            firstnameMessage.style.display = "none";
        }
    }
    firstnameInput.addEventListener("input", checkFirstnameSize);
</script>


%{--for lastname--}%



%{--for firstname--}%
<script>
    var firstnameInput = document.getElementById("firstname");

    var firstnameMessage = document.getElementById("firstnameMessage");

    function checkFirstnameSize() {
        if (firstnameInput.value.trim().length > 30) {
            firstnameMessage.style.display = "block";
        } else {
            firstnameMessage.style.display = "none";
        }
    }
    firstnameInput.addEventListener("input", checkFirstnameSize);
</script>

%{--for email--}%
<script>
    var emailInput = document.getElementById("email");
    var emailMessage = document.getElementById("emailMessage");
    function checkEmailSize() {
        if (emailInput.value.trim().length > 40) {
            emailMessage.style.display = "block";
        } else {
            emailMessage.style.display = "none";
        }
    }
    emailInput.addEventListener("input", checkEmailSize);
</script>

%{--for password--}%
<script>
    var passwordInput = document.getElementById("password1");

    // Get the password length message element
    var passwordLengthMessage = document.getElementById("passwordLengthMessage");

    // Function to handle the input event
    function checkPasswordLength() {
        if (passwordInput.value.trim().length < 8) {
            passwordLengthMessage.style.display = "block";
        } else {
            passwordLengthMessage.style.display = "none";
        }
    }
    // Event listener for the input event
    passwordInput.addEventListener("input", checkPasswordLength);
</script>

%{--for photo size--}%
<script>
    var photoInput = document.getElementById("photo");

    var photoSizeMessage = document.getElementById("photoSizeMessage");
    // Function to handle the change event
    function checkPhotoSize() {
        if (photoInput.files[0] && photoInput.files[0].size > 128000) {
            photoSizeMessage.style.display = "block";
        } else {
            photoSizeMessage.style.display = "none";
        }
    }
    // Event listener for the change event
    photoInput.addEventListener("change", checkPhotoSize);
</script>

%{--for emails--}%
<script>
    // Get the Email/Username input element
    var emailUsernameInput = document.getElementById("email1");

    // Get the Email/Username length message element
    var emailUsernameLengthMessage = document.getElementById("emailUsernameLengthMessage");

    // Function to handle the input event
    function checkEmailUsernameLength() {
        if (emailUsernameInput.value.trim().length > 40) {
            emailUsernameLengthMessage.style.display = "block";
        } else {
            emailUsernameLengthMessage.style.display = "none";
        }
    }

    // Event listener for the input event
    emailUsernameInput.addEventListener("input", checkEmailUsernameLength);
</script>

</html>