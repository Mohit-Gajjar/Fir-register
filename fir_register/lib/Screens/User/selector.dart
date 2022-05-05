import 'package:fir_register/Screens/User/login.dart';
import 'package:fir_register/Screens/User/register.dart';
import 'package:flutter/material.dart';

class SelectorUser extends StatefulWidget {
  const SelectorUser({Key? key}) : super(key: key);

  @override
  State<SelectorUser> createState() => _SelectorUserState();
}

class _SelectorUserState extends State<SelectorUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text("User"),
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
                          builder: ((context) => const RegisterUser()))),
                  child: const Text("Sign Up"))),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginUser())),
                  child: const Text("Sign In"))),
        ],
      ),
    );
  }
}
