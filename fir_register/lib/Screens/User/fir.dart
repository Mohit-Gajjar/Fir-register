import 'dart:typed_data';
import 'package:fir_register/Compoments/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nanoid/async.dart';
import 'package:path/path.dart' as path;

class RegisterFIR extends StatefulWidget {
  final String citizenId;
  const RegisterFIR({Key? key, required this.citizenId}) : super(key: key);

  @override
  State<RegisterFIR> createState() => _RegisterFIRState();
}

class _RegisterFIRState extends State<RegisterFIR> {
  TextEditingController crimeDescController = TextEditingController();
  TextEditingController crimeLocationController = TextEditingController();
  TextEditingController crimeTypeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Uint8List? fileBytes;
  PickedFile? pickedFile;
  final formKey = GlobalKey<FormState>();
  String id = "";
  String url = "";
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateId();
  }

  generateId() async {
    id = await nanoid(10);
    setState(() {});
  }

  registerFIR() async {}

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  selectFile() async {
    // ignore: deprecated_member_use
    pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
  }

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  uploadImageToStorage() async {
    Reference _reference = _firebaseStorage
        .ref()
        .child('images/${path.basename(pickedFile!.path)}');
    await _reference
        .putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    )
        .whenComplete(() async {
      await _reference.getDownloadURL().then((value) {
        if (formKey.currentState!.validate()) {
          Map<String, dynamic> map = {
            "fir_id": id,
            "citizen_id": widget.citizenId,
            "name": nameController.text,
            "crime_type": crimeTypeController.text,
            "crime_desctiption": crimeDescController.text,
            "crime_time": selectedTime.toString(),
            "crime_date": selectedDate.toString(),
            "crime_location": crimeLocationController.text,
            "status": "unsolved",
            "imageEvidence": value
          };
          Database().addFIR(map, id);
          nameController.clear();
          crimeDescController.clear();
          crimeLocationController.clear();
          crimeTypeController.clear();
        }
      });
    });
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
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
          title: const Text("Register FIR",
          style: TextStyle(color: Colors.black),)),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: crimeTypeController,
                  decoration: InputDecoration(
                      hintText: "Enter Crime Type",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 5,
                  controller: crimeDescController,
                  decoration: InputDecoration(
                      hintText: "Enter Crime Description",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text("${selectedDate.toLocal()}".split(' ')[0]),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    _selectTime(context);
                  },
                  child: Text("${selectedTime.hour}:${selectedTime.minute}"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: crimeLocationController,
                  decoration: InputDecoration(
                      hintText: "Enter Crime Location",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: selectFile, child: const Text("Upload File")),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (nameController.text.isNotEmpty &&
                        crimeTypeController.text.isNotEmpty &&
                        crimeLocationController.text.isNotEmpty &&
                        crimeDescController.text.isNotEmpty) {
                      uploadImageToStorage();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(18.0)),
                    child: const Center(
                        child: Text(
                      "Register FIR",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
