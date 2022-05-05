import 'package:cloud_firestore/cloud_firestore.dart';
class Database {
  addPoliceUser(map, String id) async {
    return FirebaseFirestore.instance
        .collection("Station")
        .doc('Users')
        .collection("Police")
        .doc(id)
        .set(map);
  }

  addCitizenUser(map, String id) async {
    return FirebaseFirestore.instance
        .collection("Station")
        .doc("Users")
        .collection("Citizen")
        .doc(id)
        .set(map);
  }

  addFIR(map, String id) async {
    return FirebaseFirestore.instance.collection("Fir").doc(id).set(map);
  }

  Future<String> getCitizenId(String email) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("Station")
        .doc("Users")
        .collection("Citizen")
        .where("email", isEqualTo: email)
        .get();
    String id = snapshot.docs[0]['id'].toString();
    // ignore: avoid_print
    print(id);
    return id;
  }

  getFir(String citizenId) async {
    return FirebaseFirestore.instance
        .collection("Fir")
        .where("citizen_id", isEqualTo: citizenId)
        .snapshots();
  }

  getFirPolice() async {
    return FirebaseFirestore.instance.collection("Fir").snapshots();
  }

  firSolved(map, String firId) async {
    return FirebaseFirestore.instance.collection("Fir").doc(firId).update(map);
  }
}
