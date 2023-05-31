package demo
class LogoutController {
    def index() {
        session.invalidate()
        redirect(url:"/login")
    }
}
