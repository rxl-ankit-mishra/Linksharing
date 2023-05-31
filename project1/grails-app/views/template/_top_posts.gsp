<table id="PostsDataTable" class="table" width="100%">
    <thead>
    <tr>
        <th class="th-sm">
        </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${topPosts}" var="resource">
        <tr>
            <td>
                <div class="card p-2">
                    <div class="container-fluid" >
                        <div class="row d-flex align-items-center" >
                            <div class="col-sm-3 ">
                                <g:img dir="images" file="${resource.createdBy.photo.substring(25)}" height = "66" width="70" class="centered" />
                            </div>
                            <div class="col-sm-8">
                                <p>
                                    <a href="/topic?topicId=${resource.topic.id}" class="card-link col-sm-6" style="text-decoration: none">${resource.topic.name}</a>
                                </p>
                                <label>${resource.createdBy.firstName} ${resource.createdBy.lastName}</label>
                                <label class="offset-1">@${resource.createdBy.username}</label>
                                <p>${resource.description}</p>
                            </div>
                        </div>

                        <div class="row" style="height: 25px">
                            <a href="/post?postId=${resource.id}" class="card-link col-sm-6 offset-9" style="text-decoration: none">View Post</a>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>