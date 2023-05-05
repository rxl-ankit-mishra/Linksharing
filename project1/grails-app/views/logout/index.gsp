<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1rem;
        background-color: #f2f2f2;
    }

    .logo a {
        font-size: 2rem;
        font-weight: bold;
        text-decoration: none;
        color: #333;
    }

    .search input[type="text"] {
        padding: 0.5rem;
        border: 1px solid #ccc;
        border-radius: 0.25rem;
    }

    nav ul {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
    }

    nav ul li {
        margin-left: 1rem;
    }

    nav ul li:first-child {
        margin-left: 0;
    }

    nav ul li a {
        text-decoration: none;
        color: #333;
        padding: 0.5rem;
    }

    nav ul li ul {
        display: none;
        position: absolute;
        top: 100%;
        left: 0;
        background-color: #fff;
        box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.25);
        z-index: 1;
    }

    nav ul li:hover ul {
        display: block;
    }

    nav ul li ul li {
        display: block;
        width: 100%;
    }

    nav ul li ul li a {
        display: block;
        padding: 0.5rem;
    }

    /* Main */
    main {
        display: flex;
        justify-content: space-between;
        padding: 1rem;
    }

    .container {
        width: 25%;
        padding: 1rem;
        border: 1px solid #ccc;
        border-radius: 0.25rem;
        box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.25);
    }

    .container h2 {
        margin-top: 0;
    }

    .popup {
        display: none;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 1rem;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 0.25rem;
        box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.25);
        z-index: 1;
    }

    .popup form {
        display: flex;
        flex-direction: column;
    }

    .popup label {
        margin-bottom: 0.5rem;
    }

    .popup input[type="text"],
    .popup textarea,
    .popup select {
        padding: 0.5rem;
        margin-bottom: 0.5rem;
        border: 1px solid #ccc;
        border-radius: 0.25rem;
    }

    .popup button[type="submit"],
    .popup button[type="button"] {
        padding: 0.5rem;
        margin-top: 0.5rem;
        border: none;
        border-radius: 0.25rem;
        box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.25);
        cursor: pointer;
    }

    .popup button[type="submit"] {
        background-color: #4caf50;
        color: #fff;
    }

    .popup button[type="submit"]:hover {
        background-color: #3e8e41;
    }

    .popup button[type="button"] {
        background-color: #3e8e41;
    }
    </style>
</head>
<body>
<header>
    <div class="logo">
        <a href="#">Link Sharing</a>
    </div>
    <div class="search">
        <input type="text" placeholder="Search">
    </div>
    <nav>
        <ul>
            <li><a href="#">Create Topic</a></li>
            <li><a href="#">Create Resource</a></li>
            <li>
                <a href="#">Profile</a>
                <ul>
                    <li><a href="#">User</a></li>
                    <li><a href="#">Topics</a></li>
                    <li><a href="#">Posts</a></li>
                    <li><a href="#">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</header>
<main>
    <div class="container">
        <h2>Inbox</h2>
        <!-- Add your inbox content here -->
    </div>
    <div class="container">
        <h2>Share Link</h2>
        <div class="popup">
            <form>
                <label for="link">Link:</label>
                <input type="text" id="link" name="link">
                <label for="description">Description:</label>
                <textarea id="description" name="description"></textarea>
                <label for="topic">Topic:</label>
                <select id="topic" name="topic">
                    <option value="topic1">Topic 1</option>
                    <option value="topic2">Topic 2</option>
                    <option value="topic3">Topic 3</option>
                </select>
                <button type="submit">Share</button>
                <button type="button" class="cancel">Cancel</button>
            </form>
        </div>
    </div>
    <div class="container">
        <h2>Share Document</h2>
        <form>
            <label for="document">Document:</label>
            <input type="file" id="document" name="document">
            <label for="description">Description:</label>
            <textarea id="description" name="description"></textarea>
            <label for="topic">Topic:</label>
            <select id="topic" name="topic">
                <option value="topic1">Topic 1</option>
                <option value="topic2">Topic 2</option>
                <option value="topic3">Topic 3</option>
            </select>
            <button type="submit">Share</button>
            <button type="button" class="cancel">Cancel</button>
        </form>
    </div>
    <div class="container">
        <h2>Create Topic</h2>
        <form>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name">
            <label for="visibility">Visibility:</label>
            <select id="visibility" name="visibility">
                <option value="public">Public</option>
                <option value="private">Private</option>
            </select>
            <button type="submit">Save</button>
            <button type="button" class="cancel">Cancel</button>
        </form>
    </div>
</main>
<script>
    // Add your JavaScript code here
</script>
