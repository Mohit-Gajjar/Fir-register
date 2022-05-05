import 'package:fir_register/Screens/User/user_login_info.dart';
import 'package:fir_register/Screens/Police/police_login.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "FIR REGISTRATION SYSTEM",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PoliceLoginInfo()))),
              child: const Text(
                "CITIZEN",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
          const SizedBox(width: 30),
          TextButton(
            onPressed: (() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserLoginInfo()))),
            child: const Text(
              "POLICE",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
      bottomSheet: Container(
        color: const Color(0xffA0F2C6),
        height: 40,
        child: const Center(
            child: Text(
          "Devloped by Arpita Vasava",
          style: TextStyle(color: Colors.black, fontSize: 18),
        )),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xffA0F2C6),
              Color(0xff837E7E),
            ])),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/img2.png"),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
                height: 400,
                width: 1500,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(18)),
                child: Center(
                  child: Column(
                    children: const [
                      Text(
                        "What is Crime?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Crime is a major part of every society. Its costs and effects touch just about everyone to some degree. The types of costs and effects are widely varied. In addition, some costs are short-term while others last a lifetime. Of course the ultimate cost is loss of life. Other costs to victims can include medical costs, property losses, and loss of income.",
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
      ),
    );
  }
}
