<div class=" border mt-2 border bg-secondary rounded d-flex p-1">
    <h5 class="col-sm-6 text-white">Search for "${params.searchInput}"</h5>
</div>

<table id="SearchDataTable" class="table" width="100%">
    <thead>
    <tr>
        <th class="th-sm">
        </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${postList}" var="resource">
        <tr>
            <td>
                <div class="card p-2">
                    <div class="container-fluid" >
                        <div class="row d-flex align-items-center" >
                            <div class="col-sm-3 ">
                                <g:img dir="images" file="${resource.createdBy.photo.substring(25)}" height = "96" width="100" class="centered" />
                            </div>
                            <div class="col-sm-8">
                                <p>${resource.description}</p>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px; margin-bottom: 10px">
                            <div class=" col-sm-6 mt-3">
                            </div>
                            <div class=" col-sm-6 mt-3">
                                %{--                                <a href="/updatedashboard" class="card-link col-sm-6" style="text-decoration: none">Mark as Read</a>--}%
                                <a href="/post?postId=${resource.id}" class="card-link col-sm-6 offset-7" style="text-decoration: none">View Post</a>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>


