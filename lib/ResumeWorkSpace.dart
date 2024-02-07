import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Model class.dart';

class ResumeWorkSpace extends StatefulWidget {
  const ResumeWorkSpace({Key? key}) : super(key: key);

  @override
  State<ResumeWorkSpace> createState() => _ResumeWorkSpaceState();
}

class _ResumeWorkSpaceState extends State<ResumeWorkSpace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0475FF),
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              IconButton(
                icon: Icon(CupertinoIcons.back,size: 35,color: Colors.white,), onPressed: () {
                  Navigator.of(context).pop();
               },
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Resume Workspace',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 30,),
            Text('Build Options',),
          ],
        ),
        toolbarHeight: 150,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: listdata.map((e) => Center(
            child: Column(
              children: [
                ListTile(
                  onTap: (){
                    Navigator.of(context).pushNamed(e.route);
                  },
                  leading: Image.asset(e.image,width: 30,),
                  title: Text(e.title,style: TextStyle(fontSize: 15),),
                  trailing: IconButton(
                    icon: Icon(CupertinoIcons.forward), onPressed: () {  },
                  ),
                ),
                Divider(color: Colors.grey,thickness: 1),
              ],
            ),
           ),
          ).toList(),
        ),
      ),
    );
  }
}
