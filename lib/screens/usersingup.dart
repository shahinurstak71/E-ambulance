import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eambulance/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UserSignUp extends StatefulWidget {
  final String type;
  UserSignUp({Key? key, required this.type}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _fileImage;
  ImagePicker imagePicker = ImagePicker();
  String  ?imagePath;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loder = false;
  Future register() async {
    var box = Hive.box("user");
    try {
      setState(() {
        loder = true;
      });

      final user = await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      if (user.user != null) {
        userdetels();

      }

      Fluttertoast.showToast(
          msg: "successful register, please login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      box.put("type", widget.type);
name.clear();
email.clear();
password.clear();
confirmPassword.clear();
      setState(() {
        loder = false;
      });
    } on FirebaseAuthException catch (error) {
      setState(() {
        Fluttertoast.showToast(
            msg: "${error.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        loder = false;
      });
    }
  }

  Future userdetels() async {
    await FirebaseFirestore.instance.collection(widget.type).add({
      "name": name.text,
      "email": email.text,
      "uid": _auth.currentUser!.uid,
      "photo": imagePath ?? "",
      "status": true,
    });
  }
  void takePhoto(ImageSource source) async {
    final pickedFile =
    await imagePicker.getImage(source: source, imageQuality: 50);
    setState(() {
      _fileImage = File(pickedFile!.path);
    });
    Reference reference = FirebaseStorage.instance.ref().child(DateTime.now().toString());
    await reference.putFile(File(_fileImage!.path));
    reference.getDownloadURL().then((value) {
      setState(() {
        imagePath =value;
        print("PROFILE Pic Image Path--$imagePath");
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top:30, left:8, right:8),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [

                    _fileImage==null ? CircleAvatar(
            radius: 70,
              backgroundImage: NetworkImage("https://tse3.mm.bing.net/th?id=OIP.OQN_R_Hmhdim5r2Va0RiVwHaFN&pid=Api&P=0"),
            ):    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                      backgroundImage: FileImage(File(_fileImage!.path)),

                      // backgroundImage: ,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text("Upload Image"),
                                content: SingleChildScrollView(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            takePhoto(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          child: Text("Camera")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            takePhoto(
                                                ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                          child: Text("Gallery")),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 18.0,
                        ),
                        child: Icon(
                          Icons.camera,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter your name",
                    labelText: "Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter your email",
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter  password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: confirmPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter confirm password",
                    labelText: "Confirm Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter confirm password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        register();
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("Processing...")));
                      }
                    },
                    child: Text("SingUp")),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "Allready have an account ? ",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'SingIn',
                              style: TextStyle(
                                color: Colors.green,
                              ))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
