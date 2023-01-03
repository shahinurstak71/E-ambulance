import 'package:eambulance/screens/signin.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final ambulancenumber = TextEditingController();
  final licence = TextEditingController();
  final locationambulance = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top:30, left:8, right:8,bottom:20),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("https://cdnuploads.aa.com.tr/uploads/Contents/2019/03/08/thumbs_b_c_dcbf6a63262bfb7d1d76c0f46e06a933.jpg?v=101535"),
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
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter your mobile number",
                    labelText: "Mobile Number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: ambulancenumber,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter your ambulance number",
                    labelText: "Ambulance number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ambulence number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: licence,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter Driver licence number",
                    labelText: "Driver licence",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter driver licence number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: locationambulance,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter your current address",
                    labelText: "set address",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter current location';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Processing...")));
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
