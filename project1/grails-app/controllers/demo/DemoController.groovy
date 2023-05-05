//package demo
//
//
//class DemoController {

//        def show() {
//        String idd = params.idd
//        Range r = 1..50
//        def rM = ["rr":r,"idd":idd]
//        render(view :"index",model:rM )
//
//       // render params
//
//    }

//
//    def index() {
//
//        render(view: "index1")
//    }

//        int num1 = 5;
//        int num2 = 10;
//        int sum = num1 + num2;
//        int minus = num2-num1
//
//        int age = Integer.parseInt(params.age)
//        int id = params.id;
//        Range r = 1..50
//
//        def rM = ["rr":r,"idd":id]

//        render(view :"index",model:rM )
//    def index() {
//       session.myId = "104"
//        render (view:'index')
////        redirect(controller:'demo2', action:'show')
////        render("ankit")
//    }

//    def test1(){
//        session.myId = "101"
////        flash
////        render session
////        session.invalidate()
//        flash.msg = "okay"
////        render flash.msg
////        sleep(milliseconds:200)
//        redirect(controller:'demo',action:'test2')
//
//    }
//    def test2(){
//        render flash.msg
//    }
//
//    def test3(){
//
//        render params.a
//    }


//    def saveUser(){
//
//        render "user saved successfully"
//
//    }
//
//    def list() {
//        log.info "Executing action $actionName"
//
//        render(view: actionName)
//    }

//}
