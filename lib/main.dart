import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_z/screens/login_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      theme: ThemeData(fontFamily: ''),
      home: const LoginScreen()));
}
