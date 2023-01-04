import 'package:eambulance/screens/home.dart';
import 'package:eambulance/screens/singup.dart';
import 'package:eambulance/screens/usersingup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  bool loder = false;

  int type=0;
  Future login() async {
    var box = Hive.box("user");
    try {
      setState(() {
        loder = true;
      });

      await _auth.signInWithEmailAndPassword(
          email: email.text, password: passWord.text);

      Fluttertoast.showToast(
          msg: "successful login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

box.put("type", type==0?"user":"driver");
      setState(() {
        loder = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0 , top: 45.0, right: 8.0, bottom: 15.0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    "https://tse4.mm.bing.net/th?id=OIP.QipICIMvwnwRFvT1Q_tgWwHaEo&pid=Api&P=0"),
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
                  controller: passWord,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                categoryItem(),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {

                  login();
                    //
                    // Navigator.push(
                    //                       context,
                    //                       MaterialPageRoute(
                    //                           builder: (context) => HomePage()),
                    //                     );
                  
                }, child: Text("SingIn")),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text("Select you?"),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserSignUp(type: "user",)),
                                        );
                                      },
                                      child: Text("User")),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Signup(type: 'driver',)),
                                        );
                                      },
                                      child: Text("Driver")),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Cencel"),
                                      ),
                                    ))
                              ],
                            ));
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "Don't have an account ? ",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'SingUp',
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
    );
  }

  Widget categoryItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomRadioButton("User", 0 ,),
          const SizedBox(
            width: 10,
          ),
          CustomRadioButton("Driver", 1,),
          const SizedBox(
            width: 10,
          ),
          // CustomRadioButton("Legal Support", 5,)
        ],
      ),
    );
  }

  Widget CustomRadioButton(String text, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white54,
          border: Border.all(
              color: (type == index) ? Colors.blue : Colors.transparent),
          borderRadius: BorderRadius.circular(30)),
      child: InkWell(
          onTap: () {

            setState(() {
              type = index;


              // if (_isVisible) ImageContener(); // no dummy container/ternary needed
              // Text('This is another text'),
              // ElevatedButton(child: Text('show/hide'), onPressed: (){
              // setState(() {
              // _isVisible = !_isVisible;
              // });
              // },)

            });
          },
          child:   Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: TextStyle(
                  color: (type == index) ? Colors.black : Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          )
      ),
    );
  }
}
