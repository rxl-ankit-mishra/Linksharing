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

    <style>
    /* Custom Styles */
    /*.container-fluid {*/
    /*    padding: 20px;*/
    /*}*/

    .row {
        margin-right: 0;
        margin-left: 0;
    }

    .col-md-5,
    .col-sm-7 {
        padding-right: 15px;
        padding-left: 15px;
    }

    .user-card,
    .subscription-list,
    .trending-topic,
    .inbox {
        background-color: #f8f9fa;
        padding: 20px;
        margin-bottom: 20px;
    }

    .user-card .user-details {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .user-card .user-details .avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .user-card .user-details .user-name {
        font-weight: bold;
    }
    .bg-custom-dark {
        background-color: #e9ecef;
    }
    </style>
</head>
<body>
<header class="bg-custom-dark text-white py-2 px-4 d-flex justify-content-between align-items-center">
    %{--	<h1>Link Sharing</h1>--}%
    <a class="navbar-brand" href="/dashboard"> <g:img dir="images" file="icon/ls.png" height = "70" width="74" style="border-radius: 3px;"/></a>
</header>


<div class="container-fluid mt-4">
    <div class="row">
        <div class="col-md-6">
            <div class="subscription-list">
                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Topic</h5>
                </div>
                <g:render template="/template/userTopic" />
            </div>

            <div class="user-card">
                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Users</h5>
                </div>
                <g:render template="/template/usersub" />
            </div>


            <div class="trending-topic">
%{--                <g:render template="/template/trendingTopic" />--}%
            </div>
        </div>

        <div class="container col-sm-6">
            <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                <h5 class="col-sm-6 text-white">Posts</h5>
            </div>
            <div class="inbox">
                <g:render template="/template/UserPost" />
            </div>
        </div>
    </div>
</div>
</body>
</html>

