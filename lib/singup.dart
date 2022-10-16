import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/screens/todo1.dart';
import "./Login.dart";

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = FirebaseAuth.instance;
  late String email;

  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                  children: [
                    Image.asset("assets/im2.png"),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: const InputDecoration(hintText: "email"),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: const InputDecoration(hintText: "password"),
                    ),
                    MaterialButton(
                      //your account will be create in database no notification will come
                      onPressed: () async {
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                      },
                      child: const Text(
                        "SignUp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
