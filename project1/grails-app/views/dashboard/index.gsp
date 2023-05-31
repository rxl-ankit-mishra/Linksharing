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
%{--    <script>--}%
%{--        setTimeout(function() {--}%
%{--            var successMessage = document.getElementById("success-message");--}%
%{--            successMessage.style.display = "none";--}%
%{--        }, 1000); // Delay of 4000 milliseconds (4 seconds)--}%
%{--    </script>--}%


    <style>

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
        display: flex;<g:if test="${flash.successMessage}">

</g:if>
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
    </style>
</head>
<body>
%{--<g:if test="${flash.successMessage}">--}%

%{--    <div id="success-message" class="toast show position-fixed top-0 start-50 translate-middle-x" style="z-index: 9999; background-color: deepskyblue;">--}%
%{--        <div class="toast-header" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">--}%
%{--            <strong class="me-auto">${flash.successMessage}</strong>--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="toast"></button>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--    </div>--}%

%{--</g:if>--}%
<g:render template="/template/navbar" />

<div class="container-fluid mt-4">
    <div class="row">
        <div class="col-md-6">
            <div class="user-card">
                <g:render template="/template/usercard" />
            </div>

            <div class="subscription-list">
                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Subscriptions</h5>
                    <p class="col-sm-3"></p>
                </div>
                <g:render template="/template/subscriptionList" />
            </div>

            <div class="trending-topic">
                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Trending Topics</h5>
                    <p class="col-sm-3"></p>
                </div>
                <g:render template="/template/trendingTopic" />
            </div>
        </div>

        <div class="container col-sm-6">

            <div class="inbox">
                <g:render template="/template/inbox" />
            </div>
        </div>
    </div>
</div>
</body>
</html>
