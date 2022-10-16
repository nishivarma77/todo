import 'package:flutter/material.dart';
import 'package:todo/screens/todo1.dart';

class Verif extends StatelessWidget {
  final String verificationId;
  late String otp = verificationId;

  Verif({
    super.key,
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Card(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      otp = value;
                    },
                    decoration: InputDecoration(helperText: "Enter otp"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TODO()));
                    },
                    child: Text(
                      "login",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
