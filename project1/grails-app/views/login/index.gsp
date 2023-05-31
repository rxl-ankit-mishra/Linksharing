<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Link Sharing Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
    <script>
        setTimeout(function() {
            var successMessage = document.getElementById("success-message");
            successMessage.style.display = "none";
        }, 3000); // Delay of 4000 milliseconds (4 seconds)
    </script>
    <style>
    /* Custom Styles */
    body {
        font-family: Arial, sans-serif;
        background-color: #DDD0C8;
    }

    .search-box {
        display: flex;
        align-items: center;
    }

    .search-box input[type="text"] {
        width: 200px;
    }

    .status-container {
        border-radius: 4px;
    }

    .top-posts .post {
        border-radius: 4px;
    }

    .login-form,
    .register-form {
        border-radius: 4px;
    }

    .custom-container {
        margin-left: 0;
        margin-right: 0;
    }
    .section-border {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
    }
    .bg-custom-dark {
        background-color: #323232;
    }

    </style>
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


<header class="bg-custom-dark text-white py-2 px-4 d-flex justify-content-between align-items-center">
    <a class="navbar-brand" href="/dashboard"> <g:img dir="images" file="icon/ls.png" height = "70" width="74" style="border-radius: 3px;"/></a>
</header>

<main class="container my-4 custom-container">
    <div class="row">
        <div class="col-md-6">

            <h3 class="mb-3">Recent Share</h3>
            <div class="status-container bg-light p-2 mb-3">
                <g:render template="/template/recentshare" />
            </div>
            <h3 class="mb-3">Top Posts</h3>
            <div class="top-posts">
                <g:render template="/template/top_posts"/>
            </div>
        </div>

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

    </div>
</main>

%{--for username--}%
<script>
    const input = document.getElementById("username");
    const sizeMessage = document.getElementById("sizeMessage1");

    input.addEventListener("input", function() {
        const value = input.value.trim();
        if (value.length > 30) {
            sizeMessage.textContent = "Username size exceeded (maximum 30 characters).";
        } else {
            sizeMessage.textContent = "";
        }
    });
</script>

%{--for lastname--}%

<script>
    const lastnameInput = document.getElementById("lastname");
    const sizeMessage4 = document.getElementById("sizeMessage5");

    lastnameInput.addEventListener("input", function() {
        const value = lastnameInput.value.trim();
        if (value.length > 30) {
            sizeMessage5.textContent = "Lastname size exceeded (maximum 30 characters).";
        } else {
            sizeMessage5.textContent = "";
        }
    });
</script>


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

</body>

</html>
