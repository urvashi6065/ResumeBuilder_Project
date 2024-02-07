import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globelfile.dart';

class References extends StatefulWidget {
  const References({Key? key}) : super(key: key);

  @override
  State<References> createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {
  var fromkey = GlobalKey<FormState>();
  TextEditingController ReferenceController = TextEditingController();
  TextEditingController DesignationController = TextEditingController();
  TextEditingController OrganizationController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    if(name!=null&&email!=null&&phone!=null){
      ReferenceController.text=name!;
      DesignationController.text=email!;
      OrganizationController.text=phone!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Color(0xff0475FF),
          title: Text('References'),
          bottom: PreferredSize(preferredSize: Size(double.infinity, 50), child: Column(children: [],),),
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 550,
              width: double.infinity,
              decoration: BoxDecoration(
               color: Colors.white,borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: fromkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reference Name', style: TextStyle(color: Colors.blue, fontSize: 17),),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Suresh Shah",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          label: Text("Suresh Shah"),
                        ),
                        controller: ReferenceController,
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
                      Text('Designation', style: TextStyle(color: Colors.blue, fontSize: 17),),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Marketing Manager,ID-342332",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          label: Text("Marketing Manager,ID-342332"),
                        ),
                        controller: DesignationController,
                        onSaved: (value) {
                          email = value!;
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
                      SizedBox(
                        height: 10,
                      ),
                      Text('Designation', style: TextStyle(color: Colors.blue, fontSize: 17),),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Organization/institute",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          label: Text("Organization/institute"),
                        ),
                        controller: OrganizationController,
                        onSaved: (value) {
                          phone = value!;
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){
                          if(fromkey.currentState!.validate()){
                            fromkey.currentState!.save();
                            Navigator.of(context).pushNamed('/declaration');
                          }
                        }, child: Text('Next',style: TextStyle(fontSize: 20))),
                      )
                    ],
                  ),
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
