import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_z/screens/form_screen.dart';

import 'create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String userEmailIdLoginIn;
  late String userPasswordLoginIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white60,
        body: SafeArea(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white),
              width: 390.0,
              height: 600.0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Project z',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Sign in to your account',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        userEmailIdLoginIn = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email address'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      onChanged: (value) {
                        userPasswordLoginIn = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Password'),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 300.0,
                        height: 40.0,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              final newUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: userEmailIdLoginIn,
                                      password: userPasswordLoginIn);
                              if (newUser != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FormScreen()));
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            elevation: 10.0,
                          ),
                          child: Text('Continue'),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateAccountScreen()));
                        },
                        child: Text(
                          'Create an account',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
