import 'package:chat_app/chatPage.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/sign_in.dart';
import 'package:chat_app/user_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  bool getUer(){
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      return true;
    }else{
      return false;
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: getUer() ? UserList(): SignIn(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final auth  = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
      return Scaffold(

    );
  }
}
