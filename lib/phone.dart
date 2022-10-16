import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/verif.dart';

class Phone extends StatelessWidget {
  final number = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "No.Login",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Card(
          child: SingleChildScrollView(
            child: Form(
                child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    controller: number,
                    decoration: InputDecoration(hintText: "Number"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      auth.verifyPhoneNumber(
                          phoneNumber: number.text,
                          verificationCompleted: (_) {},
                          verificationFailed: (e) {},
                          codeSent: (String verificationId, int? Token) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Verif(verificationId: verificationId)));
                          },
                          codeAutoRetrievalTimeout: (e) {});
                    },
                    child: Text("Login"),
                  )
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
