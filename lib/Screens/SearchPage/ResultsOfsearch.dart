import 'package:flutter/material.dart';

class ResultsOftsearch extends StatefulWidget {
  const ResultsOftsearch({Key? key}) : super(key: key);

  @override
  _ResultsOftsearchState createState() => _ResultsOftsearchState();
}

class _ResultsOftsearchState extends State<ResultsOftsearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Results'),
        backgroundColor: Color(Colors.lightBlue.value),
      ),
      body: Center(
        child: Text("Results Here From DataBase"),
      ),
    );
  }
}
