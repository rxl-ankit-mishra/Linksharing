package demo

class EditProfileController {

    def index() {
        render(view:"index")
    }
    def Edit(){
        User user = session.USER_BY_ID
        println user
    }
}
