<table id="PostsDataTable" class="table" width="100%">

    <thead>
    <tr>
        <th class="th-sm">
        </th>

    </tr>
</thead>
<tbody>
<g:each in="${userPost}" var="resource">
    <tr>
        <td>
            <div class="card p-2">
                <div class="container-fluid" >
                    <div class="row d-flex align-items-center" >
                        <div class="col-sm-3 ">
                            <g:img dir="images" file="${resource.createdBy.photo.substring(25)}" height = "50" width="55" class="centered" />
                        </div>
                        <div class="col-sm-8">
                            <p>${resource.description}</p>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px; margin-bottom: 10px">
                        <div class=" col-sm-6 mt-3">
                            <g:if test="${resource.class as String == 'class demo.LinkResource'}">
                                <a href="${resource.url}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">View Full Site</a>
                            </g:if>
                            <g:else>
                                <a href="${resource.filePath}" target="_blank" class="card-link col-sm-6" style="text-decoration: none" download="">Download</a>
                            </g:else>
                        </div>
                        <div class=" col-sm-6 mt-3">
                            <a href="/updatedashboard" class="card-link col-sm-6" style="text-decoration: none">Mark as Read</a>
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

