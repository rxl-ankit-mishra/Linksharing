<g:each in="${subsList}" var="user">

<div class="card bg-light" style="width: 100%;">
    <div class="card-body">
        <div class="row">
            <div class="col-4">
                <a href="/usersProfile">
                    <g:img dir="images" file="${user["user"].photo.substring(25)}" height = "76" width="76" style="border-radius: 40%;"/>
                </a>
            </div>

            <div class="col-8"><h3>${user["user"].firstName}${user["user"].lastName}</h3>
                <a style="color:black; text-decoration: none;" href="/usersProfile">
                    <div class="col-8" style="color:black;"> @${user["user"].username}</div>
                </a>
            </div>


            <div class="row mt-3">
                <div class="col-md-6">
                    <p>Subscriptions</p>

                    <h4><a style="color:black; text-decoration: none;" href="/usersProfile">${user.SubCount}</a></h4>

                </div>
                <div class="col-md-6">
                    <p>Topics</p>
                    <h4 ><a style="color:black; text-decoration: none;" href="/usersProfile">${user.TopicCount}</a></h4>
                </div>
            </div>
        </div>
    </div>
</div>
</g:each>