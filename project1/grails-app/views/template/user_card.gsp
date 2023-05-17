<div class="card p-2" style="background-color: #eee">
    <div class="container-fluid" >
        <div class="row d-flex align-items-center" >
            <div class="col-sm-4 ">
                <g:img dir="images" file="${user.photo.substring(25)}" height = "96" width="100" class="centered" />
            </div>

            <div class="col-sm-7">
                <div class="card-block">
                    <h5 class="card-title">${user.firstName} ${user.lastName} </h5>
                </div>
                <div class="card-block">
                    <p>@${user.username}</p>
                </div>
                <div class="card-block d-flex">
                    <p class="col-sm-7"> subscriptions</p>
                    <p class="col-sm-5">topics</p>
                </div>
                <div class="card-block d-flex">
                    <a href="#" class="card-link col-sm-7" style="text-decoration: none">${subsMap["subsCount"]}</a>
                    <a href="#" class="card-link col-sm-5" style="text-decoration: none">${subsMap["topicsCount"]}</a>
                </div>
            </div>


        </div>
    </div>
</div>

