import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _fireStore = FirebaseFirestore.instance;
  late String laptopSerailNoEntered;
  late String laptopModelNameEntered;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    onChanged: (value){
                      laptopSerailNoEntered = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Laptop serial no'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    onChanged: (value){
                      laptopModelNameEntered = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Laptop model name'),
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
                            _fireStore.collection('deploymentDemo').add({
                              'laptopModelName': laptopSerailNoEntered,
                              'laptopSerialNo': laptopModelNameEntered

                            });
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

              ],
            ),
          ),
        )),
      ),
    );
  }
}
