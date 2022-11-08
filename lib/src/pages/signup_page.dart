import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Username",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(7)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.red))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(7)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.red))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(7)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.red))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Phone",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(7)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.red))),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Signup"))
          ],
        ),
      ),
    );
  }
}
