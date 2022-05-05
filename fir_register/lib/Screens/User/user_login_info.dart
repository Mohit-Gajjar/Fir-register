import 'package:fir_register/Screens/User/login.dart';
import 'package:fir_register/Screens/User/register.dart';
import 'package:flutter/material.dart';

class PoliceLoginInfo extends StatefulWidget {
  const PoliceLoginInfo({Key? key}) : super(key: key);

  @override
  State<PoliceLoginInfo> createState() => _PoliceLoginInfoState();
}

class _PoliceLoginInfoState extends State<PoliceLoginInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffE6E6E6),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          "Citizen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "welcome to the crime report",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset("assets/img3.png"),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              height: 300,
              width: 1500,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(18)),
              child: Center(
                child: Column(
                  children: const [
                    Text(
                      "Crime prevention is our duty. We are always available 24 * 7 days to help you. Use your instinct, commons sense and action to reduce a criminal’s opportunity. Recognize it and inform it to prevent it or catch the culprits. So, support us to support you.",
                      style: TextStyle(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(bottom: 40),
        height: 90,
        color: const Color(0xffE6E6E6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const LoginUser()))),
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const RegisterUser()))),
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Center(
                    child: Text(
                  "SignUp",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
