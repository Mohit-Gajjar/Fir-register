import 'package:fir_register/Compoments/firebase.dart';
import 'package:fir_register/Screens/Police/fir_page.dart';
import 'package:flutter/material.dart';

class HomePolice extends StatefulWidget {
  const HomePolice({Key? key}) : super(key: key);

  @override
  State<HomePolice> createState() => _HomePoliceState();
}

class _HomePoliceState extends State<HomePolice> {
  @override
  void initState() {
    super.initState();
    getFirMethord();
  }

  Stream? getFIRStream;
  Widget getFIR() => StreamBuilder(
      stream: getFIRStream,
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
                    firId: snapshot.data.docs[index]["fir_id"],
                  );
                })
            : const Center(
                child: CircularProgressIndicator(),
              );
      });
  getFirMethord() async {
    Database().getFirPolice().then((val) {
      getFIRStream = val;
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
          title: const Text('Police Hompage', style: TextStyle(color: Colors.black),),
        ),
        body: getFIR());
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
      firId,
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
      required this.location,
      required this.firId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowFirPolice(
                    crimeDesc: crimeDesc,
                    crimeTime: crimeTime,
                    crimeType: crimeType,
                    date: date,
                    imageEvidence: imageEvidence,
                    location: location,
                    name: name,
                    status: status,
                    firId: firId,
                  )))),
      leading: CircleAvatar(
        radius: 30,
        child: Text(name[0].toUpperCase()),
      ),
      title: Text(name),
      subtitle: Text(status),
    );
  }
}
