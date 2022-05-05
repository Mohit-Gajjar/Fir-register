import 'package:fir_register/Compoments/firebase.dart';
import 'package:fir_register/Screens/User/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/async.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
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
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
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
        "age": ageController.text,
        "gender": genderController.text,
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
        Database().addCitizenUser(map, id);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeUser(
                      userId: id,
                    )));
      } on FirebaseAuthException catch (e) {
        SnackBar snackBar = SnackBar(content: Text(e.message!));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  String userId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE6E6E6),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.transparent,
          title: const Text(
            "Register",
            style: TextStyle(color: Colors.black),
          ),
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
                    controller: ageController,
                    decoration: InputDecoration(
                        hintText: "Enter Age",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: genderController,
                    decoration: InputDecoration(
                        hintText: "Enter Gender",
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
                          ageController.text.isNotEmpty &&
                          genderController.text.isNotEmpty) {
                        signUp(context);
                        setState(() {
                          userId = Database().getCitizenId(emailController.text)
                              as String;
                        });
                        emailController.clear();
                        passwordController.clear();
                        usernameController.clear();
                        addressController.clear();
                        cityController.clear();
                        stateController.clear();
                        phoneController.clear();
                        areaController.clear();
                        pincodeController.clear();
                        ageController.clear();
                        genderController.clear();
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
                        "Register",
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
