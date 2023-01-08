import "package:flutter/material.dart";

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        color: Colors.white,
        height: size.height / 2,
        alignment: Alignment.center,
        child: const Text("This is Dialog",
            style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
    );
  }
}
