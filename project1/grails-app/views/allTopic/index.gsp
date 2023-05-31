<!DOCTYPE html>
<html>
<head>
    <title>DataTable Example</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    h2 {
        margin-bottom: 20px;
    }
    #searchContainer {
        margin-bottom: 10px;
    }
    #searchInput {
        padding: 5px;
        margin-right: 10px;
        width: 200px;
    }
    #dataTable {
        width: 100%;
        border-collapse: collapse;
    }
    #dataTable th,
    #dataTable td {
        padding: 8px;
        border: 1px solid #ddd;
    }
    #dataTable th {
        background-color: #f2f2f2;
    }
    #dataTable tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    #dataTable tr:hover {
        background-color: #e9e9e9;
    }
    #dataTable td button {
        padding: 5px 10px;
    }
    </style>
</head>
<body>
<g:render template="/template/navbar" />
<h2>Topics</h2>


<table id="dataTable">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>CreatedBy</th>
        <th>Date Created</th>
        <th>Last Updated</th>
        <th>Visibility</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
<g:each in="${allTopic}" var="item">
    <tr >
        <td>${item.id}</td>
        <td>${item.name}</td>
        <td>${item.createdBy.firstName} ${item.createdBy.lastName}</td>
        <td>${item.dateCreated}</td>
        <td>${item.lastUpdated}</td>
        <td>${item.visibility}</td>
        <td><button id ="${item.id}" class="btn btn-primary DeletionBtn">Delete</button></td>
    </tr>
</g:each>
    <!-- Add more rows with random values as needed -->
    </tbody>
</table>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#dataTable').DataTable();
    });
    $(document).ready(function() {
        $('.DeletionBtn').click(function(event) {
            $.ajax({
                url: "/allTopic/getUser?topicId="+this.id, success: function(response) {
                    window.location.reload();
                }
            });
        });
    });

    function searchTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("dataTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td");
            for (var j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break;
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    }
</script>

</body>
</html>
