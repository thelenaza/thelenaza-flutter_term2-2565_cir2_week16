import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../widget/date_input_field.dart';

import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _dateinput = TextEditingController();

  int _sex = 0;
  bool _accept = false;
  Uint8List? _img;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ยินดีต้อนรับ สมัครบัญชีผู้ใช้"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    //icon: Icon(Icons.email),
                    hintText: 'กรุณากรอกอีเมลล์ของคุณ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.check)
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 8.0,),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      //icon: Icon(Icons.email),
                      hintText: 'กรุณาป้อนข้อมูลรหัสผ่านของคุณ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      prefixIcon: Icon(Icons.visibility),
                      suffixIcon: Icon(Icons.check)
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 8.0,),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                      labelText: 'Name-Lastname',
                      //icon: Icon(Icons.email),
                      hintText: 'กรุณากรอกข้อมูล ชื่อ-สกุล ของคุณ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.check)
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                Row(
                  children: [
                    Radio(value: 0, groupValue: _sex, onChanged: (value) {
                      setState(() {
                        _sex = value ?? 0;
                        print(_sex);
                      });
                    },),
                    Text("Male"),
                    Radio(value: 1, groupValue: _sex, onChanged: (value) {
                      setState(() {
                        _sex = value ?? 0;
                        print(_sex);
                      });
                    },),
                    Text("Female"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: _accept, onChanged: (value) {
                      setState(() {
                        _accept = value ?? false;
                        print(_accept);
                      });
                    },),
                    Text('ยอมรับข้อตกลง')
                  ],
                ),
                DateInputField(
                    dateInput:  _dateinput,
                ),
                getImage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget getImage() {
    if (_img == null) {
      return ElevatedButton(
        onPressed: () async {
          final img = await ImagePicker.platform.pickImage(
            source: ImageSource.camera,
          );
          _img = await img!.readAsBytes();
          setState(() {});
        },
        child: const Text("Choose Image"),
      );
    } else {
      return Image.memory(_img!);
    }
  }
}
