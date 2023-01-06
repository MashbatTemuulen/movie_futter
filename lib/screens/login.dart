import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../providers/common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      Provider.of<CommonProvider>(context, listen: false).onLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Let's sign you in.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  const Text(
                    "Welcome back.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  const Text(
                    "You've been missed!.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Хоосон байж болохгүй";
                      }
                      return null;
                    },
                    controller: _phoneCtrl,
                    decoration: InputDecoration(
                        label: const Text("Утасны дугаар"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.9),
                                width: 1)),
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.6))),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Хоосон байж болохгүй";
                      }
                      return null;
                    },
                    controller: _passCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: const Text("Нууц үг"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.9),
                                width: 1)),
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.6))),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _onSubmit,
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    child: const Text("Нэвтрэх"),
                  ))
            ],
          ),
        ));
  }
}
