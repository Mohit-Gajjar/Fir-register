import 'package:fir_register/Screens/Police/login.dart';
import 'package:fir_register/Screens/Police/register.dart';
import 'package:flutter/material.dart';

class UserLoginInfo extends StatefulWidget {
  const UserLoginInfo({Key? key}) : super(key: key);

  @override
  State<UserLoginInfo> createState() => _UserLoginInfoState();
}

class _UserLoginInfoState extends State<UserLoginInfo> {
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
          "Police Login",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Crime Prevention-'Safety First, Safety Always'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/img1.png",
                        scale: .9,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 1400,
                        child: Column(
                          children: const [
                            Text(
                              "Crime prevention refers to the range of strategies that are implemented by individuals, communities, businesses, non-government organisations and all levels of government to target the various social and environmental factors that increase the risk of crime, disorder and victimisation.",
                              style: TextStyle(fontSize: 28),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Crime prevention has been defined as “the anticipation, recognition and appraisal of a crime risk and the initiation of some action to remove or reduce it.” Crime prevention means using your instinct, commons sense and action to reduce a criminal’s opportunity. Plainly speaking, crime prevention is recognizing that a crime risk exists and taking some corrective action to eliminate or reduce that risk.",
                              style: TextStyle(fontSize: 28),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Crime prevention means risk reduction. A close working relationship among the crime prevention unit like police, patrol and investigations units, and the public at large is essential to eliminating crime risk. Reporting suspicious persons and/or activities, locking unoccupied rooms, securing doors and windows at the end of the day, securing university and personal property and being aware of your surroundings are all important risk reduction strategies.",
                  style: TextStyle(fontSize: 28),
                )
              ],
            ),
          ),
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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const LoginPolice()))),
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
                      builder: ((context) => const RegisterPolice()))),
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
