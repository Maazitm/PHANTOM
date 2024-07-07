import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  final databaseReference = FirebaseDatabase.instance.ref();
  late Student _student;

  @override
  void initState() {
    super.initState();
    _student = Student(
      name: '',
      phoneNumber: '',
      email: '',
      classRoom: '',
    );
  }

  Future<void> saveUserProfile() async {
    _student.name = _nameController.text;
    _student.phoneNumber = _phoneNumberController.text;
    _student.email = _emailController.text;
    _student.classRoom = _classController.text;

    await databaseReference.child('students').push().set(_student.toJson());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Student details saved successfully.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter student name',
                ),
              ),
              Text(
                'Class:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _classController,
                decoration: InputDecoration(
                  hintText: 'Enter student class',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Phone Number:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  hintText: 'Enter student phone number',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Email:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter student email',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: saveUserProfile,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Student {
  late String name;
  late String phoneNumber;
  late String email;
  late String classRoom;

  Student({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.classRoom,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'classRoom': classRoom,
    };
  }
}
