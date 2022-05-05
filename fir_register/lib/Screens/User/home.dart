import 'package:fir_register/Compoments/firebase.dart';
import 'package:fir_register/Screens/User/fir.dart';
import 'package:fir_register/Screens/User/show_fir.dart';
import 'package:flutter/material.dart';

class HomeUser extends StatefulWidget {
  final String userId;
  const HomeUser({Key? key, required this.userId}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  void initState() {
    super.initState();
    getFirMethord();
  }

  Stream? getCitizenStream;
  Widget getCitizen() => StreamBuilder(
      stream: getCitizenStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return FirTile(
                    name: snapshot.data.docs[index]["name"],
                    date: snapshot.data.docs[index]["crime_date"],
                    crimeDesc: snapshot.data.docs[index]["crime_desctiption"],
                    location: snapshot.data.docs[index]["crime_location"],
                    crimeType: snapshot.data.docs[index]["crime_type"],
                    imageEvidence: snapshot.data.docs[index]["imageEvidence"],
                    status: snapshot.data.docs[index]["status"],
                    crimeTime: snapshot.data.docs[index]["crime_time"],
                  );
                })
            : const Center(
                child: CircularProgressIndicator(),
              );
      });
  getFirMethord() async {
    Database().getFir(widget.userId).then((val) {
      getCitizenStream = val;
      setState(() {});
    });
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
          title: const Text(
            "Citizen Home Page",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: getCitizen(),
        floatingActionButton: FloatingActionButton(
          child: const Text("Fir"),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterFIR(
                        citizenId: widget.userId,
                      ))),
        ));
  }
}

class FirTile extends StatelessWidget {
  final String name,
      status,
      date,
      crimeDesc,
      crimeType,
      crimeTime,
      location,
      imageEvidence;
  const FirTile(
      {Key? key,
      required this.name,
      required this.date,
      required this.crimeDesc,
      required this.crimeType,
      required this.crimeTime,
      required this.imageEvidence,
      required this.status,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowFir(
                    crimeDesc: crimeDesc,
                    crimeTime: crimeTime,
                    crimeType: crimeType,
                    date: date,
                    imageEvidence: imageEvidence,
                    location: location,
                    name: name,
                    status: status,
                  )))),
      leading: CircleAvatar(
        radius: 30,
        child: Text(name[0].toLowerCase()),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(status, style: const TextStyle(fontSize: 18)),
    );
  }
}
