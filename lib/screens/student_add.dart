import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentAdd extends StatefulWidget{
  final List<Student?> students;
  const StudentAdd(this.students, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState ();
  }
}
class _StudentAddState  extends State<StudentAdd>{
  final formKey= GlobalKey<FormState>();
  var student = Student("","",0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Add new student"),),
        body:Container(
          margin:const EdgeInsets.all(20.0),
          child: Form(
            key:formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton()
              ],
            ),
          ),
        ),
      );

  }
  Widget buildFirstNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText:"Student's Name" , hintText: "Ali"),
      onSaved: (String? value) {
        if (value != null) {
          student.firstName = value;
        }
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText:"Student's Last Name" , hintText: "Kaya"),
      onSaved: (String? value) {
        if (value != null) {
          student.lastName = value;
        }
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(labelText:"Student's Grade" , hintText: "50"),
      onSaved: (String? value) {
        if (value != null) {
          student.grade = int.parse(value);
        }
      },
    );
  }
  Widget buildSubmitButton() {
    return OutlinedButton(
      onPressed: () {
      formKey.currentState?.save();
      widget.students.add(student);
      Navigator.pop(context);
      },
      child: const Text("Add Student"),
    );
  }


}