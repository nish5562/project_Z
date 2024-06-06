import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  final _auth = FirebaseAuth.instance;
  late String userEmailIdSelected;
  late String userPasswordSelected;

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
                      'Sign up',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter a email address'),
                      onChanged: (Value){
                        userEmailIdSelected = Value;
                      },
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Choose password'),
                      onChanged: (Value){
                        userPasswordSelected = Value;
                      },
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
                              final newUser = await _auth
                                  .createUserWithEmailAndPassword(
                                  email: userEmailIdSelected,
                                  password: userPasswordSelected);
                            }
                            catch (e){
                              print(e);
                            }
                            },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            elevation: 10.0,
                          ),
                          child: Text('Register'),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Go back to sign in screen',
                          style: TextStyle(
                              decoration: TextDecoration.underline
                          ),),
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
