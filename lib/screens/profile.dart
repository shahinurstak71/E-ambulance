import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eambulance/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var box = Hive.box("user");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffC4DFCB),
        elevation: 0,
        title: Text(
          "profile".toUpperCase(),
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("${box.get("type")}")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Column(children: [
                  box.get("type") == "driver"
                      ? ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            QueryDocumentSnapshot documentdata =
                                snapshot.data!.docs[index];

                            return documentdata["uid"] == _auth.currentUser!.uid
                                ? Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 70,
                                        backgroundImage: NetworkImage("${documentdata["photo"]}"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white60
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            onTap: () {},
                                            title: Text(
                                              "${documentdata["name"]}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white60
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            onTap: () {},
                                            title: Text(
                                              "${documentdata["email"]}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white60
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            onTap: () {},
                                            title: Text(
                                              "${documentdata["mobile"]}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white60
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            onTap: () {},
                                            title: Text(
                                              "${documentdata["driver_licence"]}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white60
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            onTap: () {},
                                            title: Text(
                                              "${documentdata["ambulance_no"]}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container();
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            QueryDocumentSnapshot documentdata =
                                snapshot.data!.docs[index];

                            return documentdata["uid"] == _auth.currentUser!.uid
                                ? Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 70,
                                        backgroundImage: NetworkImage("${documentdata["photo"]}"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white60
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            onTap: () {},
                                            title: Text(
                                              "${documentdata["name"]}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white60
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            onTap: () {},
                                            title: Text(
                                              "${documentdata["email"]}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 10, right: 10, top: 10),
                                      //   child: Container(
                                      //     decoration: BoxDecoration(
                                      //         color: Colors.white60
                                      //             .withOpacity(0.15),
                                      //         borderRadius:
                                      //             BorderRadius.circular(10)),
                                      //     child: ListTile(
                                      //       onTap: () {},
                                      //       title: Text(
                                      //         "${documentdata["mobile"]}"
                                      //             .toUpperCase(),
                                      //         style: TextStyle(
                                      //             fontSize: 20,
                                      //             fontWeight: FontWeight.bold,
                                      //             color: Colors.black54),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 10, right: 10, top: 10),
                                      //   child: Container(
                                      //     decoration: BoxDecoration(
                                      //         color: Colors.white60
                                      //             .withOpacity(0.15),
                                      //         borderRadius:
                                      //             BorderRadius.circular(10)),
                                      //     child: ListTile(
                                      //       onTap: () {},
                                      //       title: Text(
                                      //         "${documentdata["driver_licence"]}"
                                      //             .toUpperCase(),
                                      //         style: TextStyle(
                                      //             fontSize: 20,
                                      //             fontWeight: FontWeight.bold,
                                      //             color: Colors.black54),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 10, right: 10, top: 10),
                                      //   child: Container(
                                      //     decoration: BoxDecoration(
                                      //         color: Colors.white60
                                      //             .withOpacity(0.15),
                                      //         borderRadius:
                                      //             BorderRadius.circular(10)),
                                      //     child: ListTile(
                                      //       onTap: () {},
                                      //       title: Text(
                                      //         "${documentdata["ambulance_no"]}"
                                      //             .toUpperCase(),
                                      //         style: TextStyle(
                                      //             fontSize: 20,
                                      //             fontWeight: FontWeight.bold,
                                      //             color: Colors.black54),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  )
                                : Container();
                          },
                        ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white60.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        onTap: () {
                          box.clear();
                          _auth.signOut().then((value) =>
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn())));
                        },
                        title: Text(
                          "Log Out".toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ]);
              }
            },
          ),
        ],
      ),
    );
  }
}
