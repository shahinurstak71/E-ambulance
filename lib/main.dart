import 'package:eambulance/screens/home.dart';
import 'package:eambulance/screens/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
await Hive.initFlutter();
final dir = await getApplicationDocumentsDirectory();
await Hive.openBox("user");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user');
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:box.get('type') == null ? SignIn():HomePage(),
    );
  }
}
