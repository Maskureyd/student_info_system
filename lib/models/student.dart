
class Student {
  int id=0;
  String firstName="";
  String lastName="";
  int grade=0;
  String status="";

  Student(this.firstName,this.lastName,this.grade);

  Student.withID(this.id,this.firstName,this.lastName,this.grade);
  String get getStatus{
     String message = "";
     if(grade>=50){
       message = "Passed.";
     }else if(grade>40){
       message = "Needs to take a make-up exam.";
     }else{
       message = "Failed.";
     }
     status=message;
     return status;
  }
}