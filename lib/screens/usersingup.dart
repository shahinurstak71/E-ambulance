import 'package:eambulance/screens/signin.dart';
import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  UserSignUp({Key? key}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final name = TextEditingController();
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("https://tse3.mm.bing.net/th?id=OIP.OQN_R_Hmhdim5r2Va0RiVwHaFN&pid=Api&P=0"),
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
                      if (_formKey.currentState!.validate()) {
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
