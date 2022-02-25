import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String JobType;
  final Joblist = ['Professor', 'Carpenter', 'Plumber', 'Mechanical', 'Smith'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Profile Page')),
    );
  }
}
