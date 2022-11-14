import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final Function onTap;

  const AppButton({required this.buttonName, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text(buttonName));
  }
}
