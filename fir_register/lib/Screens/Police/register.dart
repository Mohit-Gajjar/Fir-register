import 'package:fir_register/Compoments/firebase.dart';
import 'package:fir_register/Screens/Police/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/async.dart';

class RegisterPolice extends StatefulWidget {
  const RegisterPolice({Key? key}) : super(key: key);

  @override
  State<RegisterPolice> createState() => _RegisterPoliceState();
}

class _RegisterPoliceState extends State<RegisterPolice> {
  String id = "";
  @override
  void initState() {
    super.initState();
    generateId();
  }

  generateId() async {
    id = await nanoid(10);
    setState(() {});
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController headController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> signUp(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      Map<String, dynamic> map = {
        "username": usernameController.text,
        "email": emailController.text,
        "id": id,
        "head": headController.text,
        "address": addressController.text,
        "city": cityController.text,
        "area": areaController.text,
        "state": stateController.text,
        "pincode": pincodeController.text,
        "phone": phoneController.text,
      };
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Database().addPoliceUser(map, id);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePolice()));
      } on FirebaseAuthException catch (e) {
        SnackBar snackBar = SnackBar(content: Text(e.message!));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xffE6E6E6),
        appBar: AppBar(
           iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
          backgroundColor: Colors.transparent,
          title: const Text("Register", style: TextStyle(color: Colors.black),),
        ),
        body: Center(
            child: SizedBox(
          width: 300,
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        hintText: "Enter Username",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                        hintText: "Enter Address",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                        hintText: "Enter City",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: stateController,
                    decoration: InputDecoration(
                        hintText: "Enter State",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: areaController,
                    decoration: InputDecoration(
                        hintText: "Enter Area",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: pincodeController,
                    decoration: InputDecoration(
                        hintText: "Enter Pincode",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        hintText: "Enter Phone",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: headController,
                    decoration: InputDecoration(
                        hintText: "Enter Head",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty &&
                          usernameController.text.isNotEmpty &&
                          addressController.text.isNotEmpty &&
                          cityController.text.isNotEmpty &&
                          stateController.text.isNotEmpty &&
                          areaController.text.isNotEmpty &&
                          phoneController.text.isNotEmpty &&
                          pincodeController.text.isNotEmpty &&
                          headController.text.isNotEmpty) {
                        signUp(context);
                        emailController.clear();
                        passwordController.clear();
                        usernameController.clear();
                        addressController.clear();
                        cityController.clear();
                        stateController.clear();
                        phoneController.clear();
                        areaController.clear();
                        pincodeController.clear();
                        headController.clear();
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(18.0)),
                      child: const Center(
                          child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
