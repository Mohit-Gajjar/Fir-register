import 'package:fir_register/Screens/Police/login.dart';
import 'package:fir_register/Screens/Police/register.dart';
import 'package:flutter/material.dart';

class SelectorPolice extends StatefulWidget {
  const SelectorPolice({Key? key}) : super(key: key);

  @override
  State<SelectorPolice> createState() => _SelectorPoliceState();
}

class _SelectorPoliceState extends State<SelectorPolice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Police"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPolice())),
                  child: const Text("Sign Up"))),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPolice())),
                  child: const Text("Sign In"))),
        ],
      ),
    );
  }
}
