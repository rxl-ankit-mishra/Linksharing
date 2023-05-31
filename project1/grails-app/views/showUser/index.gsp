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
<div class="container mt-4">
    <div class="row mb-3">
        <g:select name="n1" id="i1" class="form-select userActivationPicker" from="${['All Users','Active','Inactive']}" value="v1"/>
    </div>
    <table id="usersTable" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Id</th>
            <th>UserName</th>
            <th>Email</th>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Active</th>
            <th>Manage</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${allUser}" var="item">
            <tr class="userRow isActive-${item.active}">
                <td>${item.id}</td>
                <td>${item.username}</td>
                <td>${item.email}</td>
                <td>${item.firstName}</td>
                <td>${item.lastName}</td>
                <g:if test = "${item.active}">
                    <td>Yes</td>
                </g:if>
                <g:else>
                    <td>No</td>
                </g:else>

                <td>
                    <g:if test ="${item.active}">
                        <button id="${item.id}" type="button" class="btn btn-primary ActivationBtn">Deactivate</button>
                    </g:if>
                    <g:else>
                        <button id="${item.id}" type="button" class="btn btn-primary ActivationBtn">activate</button>
                    </g:else>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>



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
<script>
    $(document).ready(function() {
        $('.ActivationBtn').click(function(event) {
            $.ajax({
                url: "/showUser/getUser?userId="+this.id, success: function(response) {
                    window.location.reload();
                }
            });
        });
    });

    $(document).ready(function(){
        $(".userActivationPicker").click(function(){

            if(this.value == 'Active'){
                $(".isActive-true").show()
                $(".isActive-false").hide()
            }
            else if(this.value == 'Inactive'){
                $(".isActive-false").show()
                $(".isActive-true").hide()
            }
            else{
                $(".isActive-true").show()
                $(".isActive-false").show()
            }

        });
    });
    <!-- Initialize DataTable -->
    $(document).ready(function() {
        $('#usersTable').DataTable({
            "lengthMenu": [ 5, 10, 30 ],
            "pageLength": 20
        });
    });
</script>
</body>
</html>





















































































































































































































































































