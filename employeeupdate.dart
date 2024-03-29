import 'package:flutter/material.dart';

import '../api/mainapi.dart';

class Update_Employee extends StatefulWidget {
  final Map<String,dynamic> employee;
  const Update_Employee({super.key, required this.employee});

  @override
  State<Update_Employee> createState() => _Update_EmployeeState();
}

class _Update_EmployeeState extends State<Update_Employee> {

  late TextEditingController nameController;
  late TextEditingController contactController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController=TextEditingController(
      text: widget.employee['name'].toString()
    );
    contactController=TextEditingController(
      text: widget.employee['contact'].toString()
    );
    emailController=TextEditingController(
        text: widget.employee['email'].toString()
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Employee'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Employee Name'),
          ),
          TextFormField(
            controller: contactController,
            decoration: InputDecoration(labelText: 'Contact'),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          ElevatedButton(
              onPressed: () async {
                Map<String,dynamic> updaterecord={
                  'name' :nameController.text,
                  'contact' :contactController.text,
                  'email':emailController.text
                };
                await mainapi().updateUsers(updaterecord,widget.employee['id']);
                setState(() {
                  widget.employee['name']=updaterecord['name'];
                  widget.employee['contact']=updaterecord['contact'];
                  widget.employee['email']=updaterecord['email'];
                });
                Navigator.pop(context,true);
              },
              child: Text('Edit')
          )
        ],
      ),
    );
  }
}
