import 'package:flutter/material.dart';
import 'package:ogrenci_bilgi_sistemi/models/student.dart';
import 'package:ogrenci_bilgi_sistemi/screens/student_add.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
   State <StatefulWidget> createState() {
    return _HomeScreenState();
  }
}


class _HomeScreenState extends State {
  List<Student> students = [
    Student.withID(1, "Emre", "Kaya", 85),
    Student.withID(2, "Talha", "Anay", 45),
    Student.withID(3, "Emirhan", "Erdoğan", 25),
  ];
  Student selectedStudent = Student.withID(0, "No one selected", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Info System"),
      ),
      body:buildBody());

  }

 buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context,int index){
              return ListTile(
                title:Text("${students[index].firstName} ${students[index].lastName}"),
                subtitle: Text("The score received from the exam :${students[index].grade} [${students[index].getStatus}]"),
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage("https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png"),
                ),
                trailing: buildStatusIcon(students[index].grade),
                onTap:(){
                  setState(() {
                    selectedStudent= students[index];
                  });
                } ,
                onLongPress: (){

                },
              );
            }),
        ),
      Text("Selected Student : ${selectedStudent.firstName}"),
        Row(
            children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12,
                foregroundColor: Colors.white,
                ),
                  onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => StudentAdd(students),
                  ),
                  );
                  },
                  child: Row(
                  children: const <Widget>[
                    Icon(Icons.add),
                    SizedBox(width:5.0,),
                    Text("New Student")
                  ],
                ),
              )
            ),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {

                    }

                    ,child: Row(
                      children: const <Widget>[
                        Icon(Icons.add),
                        SizedBox(width:5.0,),
                        Text("Update")
                      ],
                    ),
                  )
              ),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {

                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.add),
                        SizedBox(width:5.0,),
                        Text("Delete")
                      ],
                    ),
                  )
              ),
            ],
        )
      ],
    );
  }
}






  Widget buildStatusIcon(int grade){
    if(grade>=50){
      return const Icon(Icons.done);
    }else if(grade>=40){
      return const Icon(Icons.album);
    }else{
      return const Icon(Icons.clear);
    }

}
