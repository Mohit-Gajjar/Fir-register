import 'package:flutter/material.dart';

class ShowFir extends StatefulWidget {
  final String name,
      status,
      date,
      crimeDesc,
      crimeType,
      crimeTime,
      location,
      imageEvidence;
  const ShowFir(
      {Key? key,
      required this.name,
      required this.status,
      required this.date,
      required this.crimeDesc,
      required this.crimeType,
      required this.crimeTime,
      required this.location,
      required this.imageEvidence})
      : super(key: key);

  @override
  State<ShowFir> createState() => _ShowFirState();
}

class _ShowFirState extends State<ShowFir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE6E6E6),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            "FIR",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Name",
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  widget.name,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                title: const Text(
                  "Description",
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  widget.crimeDesc,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                title: const Text(
                  "Type",
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  widget.crimeType,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                title: const Text(
                  "Time",
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  widget.crimeTime,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                title: const Text(
                  "Location",
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  widget.location,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                title: const Text(
                  "Status",
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  widget.status,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 500,
                width: 500,
                child: Image.network(
                  widget.imageEvidence,
                ),
              )
            ],
          ),
        ));
  }
}
