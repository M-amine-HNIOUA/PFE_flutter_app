import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Color(Colors.lightBlue.value),
      ),
      body: Center(
        child: Text("About Page"),
      ),
    );
  }
}
