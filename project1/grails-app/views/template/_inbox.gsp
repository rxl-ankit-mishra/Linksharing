<div class=" border mt-2 border bg-secondary rounded d-flex p-1">
    <h5 class="col-sm-6 text-white">Inbox</h5>
</div>
<table id="inboxResourceList" class="table" width="100%">
    <thead>
    <tr>
        <th class="th-sm">
        </th>
    </tr>
    </thead>
<tbody>
<g:each in="${inboxResourceList}" var="readingItem">
    <tr>
        <td>
            <div class="card p-1 bg-opacity-50" style="background-color: white">
                <div class="container-fluid">

                    <div class="row d-flex align-items-center">
                        <div class="col-sm-2 ">
                            <g:img dir="images" file="${readingItem.resource.createdBy.photo.substring(25)}" height = "50" width="50" class="centered" id="imgHolderInboxList-${readingItem.resource.id}" name="imgHolderInboxList-${readingItem.resource.id}"/>
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-8">
                            <div class="card-block">
                                <p id="resourceCreatorNameInbox-${readingItem.resource.id}" style="text-decoration: none" > ${readingItem.resource.createdBy.firstName} ${readingItem.resource.createdBy.lastName}  @${readingItem.resource.createdBy.username}</p>
                            </div>
                            <div class="card-block d-flex">
                                <p id="resourceDescInbox-${readingItem.resource.id}" style="text-decoration: none" > ${readingItem.resource.description}</p>
                            </div>
                            <div class="card-block d-flex">
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px; margin-bottom: 10px">
                        <div class=" col-sm-6 mt-3">

                            <g:if test="${readingItem.resource.class as String == 'class demo.LinkResource'}">
                                <a href="${readingItem.resource.url}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">View Full Site</a>
                            </g:if>
                            <g:else>
                                <a href="${readingItem.resource.filePath}" target="_blank" class="card-link col-sm-6" style="text-decoration: none" download>Download</a>
                            </g:else>
                        </div>
                        <div class=" col-sm-6 mt-3">
                            <a href="/updatedashboard/markAsRead?resourceId=${readingItem.resource.id}" class="card-link col-sm-6" style="text-decoration: none">Mark as Read</a>
                            <a href="/post?postId=${readingItem.resource.id}" class="card-link col-sm-6" style="text-decoration: none">View Post</a>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</g:each>
</tbody>
</table>
