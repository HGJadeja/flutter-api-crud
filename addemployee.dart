import 'package:flutter/material.dart';
import 'package:lab_7/api/mainapi.dart';

class Add_Employee extends StatefulWidget {
  const Add_Employee({super.key});

  @override
  State<Add_Employee> createState() => _Add_EmployeeState();
}

class _Add_EmployeeState extends State<Add_Employee> {
  var nameController=TextEditingController();
  var contactController=TextEditingController();
  var emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee details"),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name',hintText: 'Enter employee name'),
          ),
          TextFormField(
            controller: contactController,
            decoration: InputDecoration(labelText: 'Contact',hintText: 'Enter employee contact'),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email',hintText: 'Enter employee email'),
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          ElevatedButton(
              onPressed: (){
                Map<String,dynamic> insertrecord={
                  'name' :nameController.text,
                  'contact' :contactController.text,
                  'email':emailController.text
                };
                mainapi().insertUsers(insertrecord);
                Navigator.pop(context,true);
              },
              child: Text('Add')
          )
        ],
      ),
    );
  }
}

