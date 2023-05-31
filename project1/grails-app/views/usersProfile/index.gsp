<html>
<head>
    <g:render template="/template/navbar" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet"/>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#PostsDataTable').dataTable({
                "ordering": true,
                "paging": true,
                "lengthMenu": [20, 40, 60, 80, 100],
                "pageLength": 20,
                "searching": true,
                "order": [[ 0, "asc" ]],
            });
        });
        $(document).ready(function() {
            $('#trendingTopicListDataTable').dataTable({
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
<body>
<main>

    <div class="container-fluid p-5">

        <div class="row">
            <div class="container col-sm-6 mb-3">
                <g:render template="/template/usercard" />
                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Topics</h5>
                </div>
                <g:render template="/template/userTopic" />
                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Subscription</h5>
                </div>
                <g:render template="/template/subscriptionList" />


            </div>

            <div class="container col-sm-1">
            </div>
            <div class="container col-sm-5">
                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Posts</h5>
                </div>
                <g:render template="/template/UserPost" />
            </div>
        </div>
    </div>
</main>
</body>
</html>