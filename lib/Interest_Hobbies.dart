import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterestHobbies extends StatefulWidget {
  const InterestHobbies({Key? key}) : super(key: key);

  @override
  State<InterestHobbies> createState() => _InterestHobbiesState();
}

class _InterestHobbiesState extends State<InterestHobbies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('interest/Hobbies'),
      ),
    );
  }
}
