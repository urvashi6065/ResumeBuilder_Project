import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globelfile.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool Cprogramming=false;
  bool Cplusplus=false;
  bool Flutter=false;

  var fromkey = GlobalKey<FormState>();
  TextEditingController ProjectController = TextEditingController();
  TextEditingController RolesController = TextEditingController();
  TextEditingController TechnologiesController = TextEditingController();
  TextEditingController DescripationController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    if (name != null&&email!=null) {
      ProjectController.text = name!;
      RolesController.text=email!;
      TechnologiesController.text=phone!;
      DescripationController.text=address!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Color(0xff0475FF),
        title: Text('Projects'),
        leading: Column(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  size: 35,
                ))
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Column(
            children: [],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 800,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: fromkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project Title',
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Resume Builder App",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        label: Text("Resume Builder App"),
                      ),
                      controller: ProjectController,
                      onSaved: (value) {
                        name = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Technologies',
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: Cprogramming, onChanged: (value){
                      setState(() {
                        Cprogramming=value!;
                      });
                    },title: Text('C Programming',style: TextStyle(color: Colors.grey),),),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: Cplusplus, onChanged: (value){
                      setState(() {
                        Cplusplus=value!;
                      });
                    },title: Text('C++',style: TextStyle(color: Colors.grey),),),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: Flutter, onChanged: (value){
                      setState(() {
                        Flutter=value!;
                      });
                    },title: Text('Flutter',style: TextStyle(color: Colors.grey),),),
                    SizedBox(height: 10,),
                    Text('Roles',style: TextStyle(color: Colors.blue, fontSize: 17),),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Organize team members,Code analysis",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        label: Text("Organize team members,Code analysis"),
                      ),
                      controller: RolesController,
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter";
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    Text('Technologies',style: TextStyle(color: Colors.blue, fontSize: 17),),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "5 - Programmers",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        label: Text("5 - Programmers"),
                      ),
                      controller: TechnologiesController,
                      onSaved: (value) {
                        phone = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter";
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    Text('Project Descripation',style: TextStyle(color: Colors.blue, fontSize: 17),),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Your Project Descripation",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        label: Text("Enter Your Project Descripation"),
                      ),
                      controller: DescripationController,
                      onSaved: (value) {
                        address = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter";
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(child: ElevatedButton(onPressed: (){
                        if(fromkey.currentState!.validate()){
                          fromkey.currentState!.save();
                          Navigator.of(context).pushNamed('/references');
                        }
                      }, child: Text('SAVE'))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
