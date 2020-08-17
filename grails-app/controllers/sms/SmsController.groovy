
package sms

class SmsController {
    def index() {
        def fetched_value = Sms.list() //Fetching all from database
        [fetched_value:fetched_value]
    }

    def add() {

    }

    def addStudent() {
        def value = new Sms(params) //From add.gsp

        if(!value.validate()) { //checking entry with DB data
            render "This name exists. Try another one."
        } else {
            def addStudent = new Sms(params)
            addStudent.save()
            render "Student added successfully"
        }

    }


    def search() {

    }


    def searchStudent() {
        def value = params.search //value from search.gsp
        def std_info = Sms.findAllByName(value)  //Search in DB

        //Check if the name exists in database
        if(std_info.name[0] != null) {
            render "${std_info.name[0]}'s age is ${std_info.age[0]}"
        } else {
            render "No student found with the name ${value}"
        }

    }
}
