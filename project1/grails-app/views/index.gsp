<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <style>
        body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}


header {
	background-color: #333;
	color: #fff;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
}

.search-box {
	display: flex;
	align-items: center;
}

.search-box input[type="text"] {
	padding: 10px;
	border: none;
	border-radius: 5px;
	margin-right: 10px;
}

.search-box button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #0077b6;
	color: #fff;
	cursor: pointer;
}

main {
	display: flex;
	margin: 20px;
}

.sidebar-left {
	flex: 1;
	margin-right: 20px;
}

.sidebar-left h2 {
	margin-bottom: 10px;
}

.status-container {
	background-color: #eee;
	padding: 10px;
	margin-bottom: 10px;
}

.top-posts {
	display: flex;
	flex-direction: column;
}

.post {
	background-color: #eee;
	padding: 10px;
	margin-bottom: 10px;
}

.post h3 {
	margin-top: 0;
}

.sidebar-right {
	flex: 1;
	margin-left: 20px;
}

.login-form, .register-form {
	background-color: #eee;
	padding: 10px;
	margin-bottom: 20px;
}

.login-form h2, .register-form h2 {
	margin-top: 0;
	margin-bottom: 10px;
}

.login-form form, .register-form form {
	display: flex;
	flex-direction: column;
}

.login-form label, .register-form label {
	margin-bottom: 5px;
}

.login-form input[type="text"], .login-form input[type="password"], .register-form input[type="text"], .register-form input[type="password"], .register-form input[type="email"], .register-form input[type="file"] {
	padding: 10px;
	border: none;
	border-radius: 5px;
	margin-bottom: 10px;
}

.login-form .form-links {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 10px;
}

.login-form .form-links a {
	color: #0077b6;
	text-decoration: none;
}

.login-form .form-links a:hover {
	text-decoration: underline;
}

.login-form input[type="submit"], .register-form input[type="submit"] {
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: #0077b6;
	color: #fff;
	cursor: pointer;
}

.register-form input[type="file"] {
	padding: 5px 0;
	margin-bottom: 0;
}


     </style>


</head>
<head>
	<title>Home Page</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>My Website</h1>
		<div class="search-box">
			<input type="text" placeholder="Search...">
			<button>Search</button>
		</div>
	</header>
	<main>
		<div class="sidebar-left">
			<h2>Recent Status</h2>
			<div class="status-container">
				<p>Example status update</p>
				<p>Another example status update</p>
			</div>
			<h2>Top Posts</h2>
			<div class="top-posts">
				<div class="post">
					<h3>Example post title</h3>
					<p>Example post content</p>
				</div>
				<div class="post">
					<h3>Another example post title</h3>
					<p>Another example post content</p>
				</div>
			</div>
		</div>
		<div class="sidebar-right">
			<div class="login-form">
				<h2>Login</h2>
				<g:form>
					<label for="email">Email/Username:</label>
					<input type="text" id="email" name="email">
					<label for="password">Password:</label>
					<input type="password" id="password" name="password">
					<div class="form-links">
						<a href="#">Forgot password?</a>
						<input type="submit" value="Login">
					</div>
				</g:form>
			</div>
			<div class="register-form">
				<h2>Register</h2>
				<g:form>
					<label for="firstname">First Name:</label>
					<input type="text" id="firstname" name="firstname">
					<label for="lastname">Last Name:</label>
					<input type="text" id="lastname" name="lastname">
					<label for="email">Email:</label>
					<input type="email" id="email" name="email">
					<label for="username">Username:</label>
					<input type="text" id="username" name="username">
					<label for="password">Password:</label>
					<input type="password" id="password" name="password">
					<label for="confirm-password">Confirm Password:</label>
					<input type="password" id="confirm-password" name="confirm-password">
					<label for="photo">Photo:</label>
					<input type="file" id="photo" name="photo">
					<input type="submit" value="Register">
				</g:form>
			</div>
		</div>
	</main>
</body>
</html>