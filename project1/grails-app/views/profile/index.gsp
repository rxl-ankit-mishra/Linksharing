<!DOCTYPE html>
<html lang="en">
<head>

    <g:render template="/template/navbar" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linksharing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet"/>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#EditPageTopicsDataTable').dataTable({
                "ordering": true,
                "paging": true,
                "lengthMenu": [10, 20, 30, 40, 100],
                "pageLength": 10,
                "searching": true,
                "order": [[ 0, "asc" ]],
            });
        });
    </script>

</head>
<body>

<div>
    <div class="container-fluid p-5">
        <div class="row">

            <div class="container col-sm-6 mb-2">

                <g:render template="/template/usercard" />



                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Topics</h5>

                    <p class="col-sm-3"></p>
                </div>

                <g:render template="/template/userTopic" />
            </div>
            <div class="container col-sm-1">
            </div>
            <div class="container col-sm-5">

                <div class="card"  >
                    <div class="card-header">
                        <h4>Profile</h4>
                    </div>
                    <div class="card-body">
                        <g:uploadForm controller="Profile" action="UpdateDetails">
                            <div class="form-group">
                                <label for="firstname">First Name:</label>
                                <input type="text" class="form-control" id="firstname" name="firstname" />
                                <p id="firstnameLengthMessage" class="error-message" style="display: none;">Exceeded maximum length of 30 characters.</p>
                            </div>
                            <div class="form-group">
                                <label for="lastname">Last Name:</label>
                                <input type="text" class="form-control" id="lastname" name="lastname" />
                                <p id="lastnameLengthMessage" class="error-message" style="display: none;">Exceeded maximum length of 30 characters.</p>
                            </div>
                            <div class="form-group">
                                <label for="username">Username:</label>
                                <input type="text" class="form-control" id="username" name="username" >
                                <p id="usernameLengthMessage" class="error-message" style="display: none;">Exceeded maximum length of 30 characters.</p>
                            </div>
                            <div class="form-group">
                                <label for="photo">Photo:</label>
                                <input type="file" class="form-control" id="photo" name="photo">
                                <p id="photoSizeMessage" class="error-message" style="display: none;">Exceeded maximum file size of 128KB.</p>
                            </div>
                            <div class="mt-3">
                                <input type="submit" class="btn btn-primary offset-9" id="updateButton" value="Update" style="display: none;">
                            </div>
                        </g:uploadForm>
                    </div>
                </div>
                <br>
                <div class="card">
                    <div class="card-header">
                        <h4>Update Password</h4>
                    </div>
                    <div class="card-body">
                        <g:form controller="Profile" action="UpdatePassword">
                            <div class="form-group">
                                <label for="register_password">Password:</label>
                                <input type="password" class="form-control" id="register_password" name="password" required/>
                            </div>
                            <div class="form-group">
                                <label for="confirmpassword">Confirm Password:</label>
                                <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" required/>
                            </div>
                            <div class="mt-3">
                                <input type="submit" class="btn btn-primary offset-9" value="Update">
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    // Get the input elements
    var firstnameInput = document.getElementById("firstname");
    var lastnameInput = document.getElementById("lastname");
    var usernameInput = document.getElementById("username");
    var photoInput = document.getElementById("photo");
    var updateButton = document.getElementById("updateButton");

    // Function to check if any input field has a value
    function checkFormCompletion() {
        if (firstnameInput.value || lastnameInput.value || usernameInput.value || photoInput.value) {
            updateButton.style.display = "block";
        } else {
            updateButton.style.display = "none";
        }
    }

    // Event listeners for input events
    firstnameInput.addEventListener("input", checkFormCompletion);
    lastnameInput.addEventListener("input", checkFormCompletion);
    usernameInput.addEventListener("input", checkFormCompletion);
    photoInput.addEventListener("change", checkFormCompletion);
</script>





<script>
    var firstnameInput = document.getElementById("firstname");
    var lastnameInput = document.getElementById("lastname");
    var usernameInput = document.getElementById("username");
    var photoInput = document.getElementById("photo");

    // Get the length messages elements
    var firstnameLengthMessage = document.getElementById("firstnameLengthMessage");
    var lastnameLengthMessage = document.getElementById("lastnameLengthMessage");
    var usernameLengthMessage = document.getElementById("usernameLengthMessage");
    var photoSizeMessage = document.getElementById("photoSizeMessage");

    // Function to handle the input event for First Name
    function checkFirstnameLength() {
        if (firstnameInput.value.length > 30) {
            firstnameLengthMessage.style.display = "block";
        } else {
            firstnameLengthMessage.style.display = "none";
        }
    }

    // Function to handle the input event for Last Name
    function checkLastnameLength() {
        if (lastnameInput.value.length > 30) {
            lastnameLengthMessage.style.display = "block";
        } else {
            lastnameLengthMessage.style.display = "none";
        }
    }

    // Function to handle the input event for Username
    function checkUsernameLength() {
        if (usernameInput.value.length > 30) {
            usernameLengthMessage.style.display = "block";
        } else {
            usernameLengthMessage.style.display = "none";
        }
    }

    // Function to handle the change event for Photo
    function checkPhotoSize() {
        var fileSize = photoInput.files[0].size;
        var maxSize = 128000; // Maximum file size in bytes (128KB)

        if (fileSize > maxSize) {
            photoSizeMessage.style.display = "block";
        } else {
            photoSizeMessage.style.display = "none";
        }
    }

    // Event listeners for input events
    firstnameInput.addEventListener("input", checkFirstnameLength);
    lastnameInput.addEventListener("input", checkLastnameLength);
    usernameInput.addEventListener("input", checkUsernameLength);
    photoInput.addEventListener("change", checkPhotoSize);
</script>

</body>
</html>