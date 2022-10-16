// ignore: file_names
import 'package:flutter/material.dart';
import 'package:todo/phone.dart';
import 'package:todo/screens/todo1.dart';
import 'package:todo/singup.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  Login({super.key});

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
                    Image.asset("assets/im1.png"),
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
                      onPressed: () async {
                        final User = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (User != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TODO()));
                        }
                      },
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create an Account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Phone(),
                          ),
                        );
                      },
                      child: Text(
                        "login with numbwer",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
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
