import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globelfile.dart';

enum Status {Previously,Currently}

class Experiences extends StatefulWidget {
  const Experiences({Key? key}) : super(key: key);

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  var fromkey=GlobalKey<FormState>();
  var s1=Status.Previously;
  TextEditingController CompanyController=TextEditingController();
  TextEditingController QualityController=TextEditingController();
  TextEditingController RolesController=TextEditingController();
  TextEditingController DatejoinedController=TextEditingController();
  TextEditingController DateExitController=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
  if(companyName!=null && quality!=null && roles!=null && dateJoined!=null && dateExit!=null &&swich!=null){
    CompanyController.text=companyName!;
    QualityController.text=quality!;
    RolesController.text=roles!;
    DatejoinedController.text=dateJoined!;
    DateExitController.text=dateExit!;

  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Color(0xff0475FF),
        title: Text('Experiences'),
        centerTitle: true,
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
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Column(
            children: [],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0,left: 10,right: 10),
          child: Container(
              height: 750,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: fromkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Company Name',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "New Enterprise, San Francisco",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Company Name";
                            }
                          },
                          onSaved: (value){
                            companyName=value!;
                          },
                          controller: CompanyController,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'School/College/institute',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Quality Test Engineer",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter";
                            }
                          },
                          onSaved: (value){
                            quality=value!;
                          },
                          controller: QualityController,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Roles (optional)',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText:
                                "Working With team members to come up with new concepts and product analysis...",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          controller: RolesController,
                          onSaved: (value){
                            roles=value!;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Employed Status',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                     Row(
                       children: [
                         Container(
                           width: 160,
                           height: 50,
                           color: Colors.white,
                           child: RadioListTile(value: Status.Previously, groupValue: s1, onChanged: (value){
                             setState(() {
                               s1=value!;
                             });
                           },title: Text('Previously Employed',style: TextStyle(fontSize: 12,color: Colors.blue),),),
                         ),
                         Container(
                           width: 160,
                           height: 50,
                           color: Colors.white,
                           child: RadioListTile(value: Status.Currently, groupValue: s1, onChanged: (value){
                             setState(() {
                               s1=value!;
                             });
                           },title: Text('Currently Employed',style: TextStyle(fontSize: 12,color: Colors.blue,),),),
                         ),
                       ],
                     ),
                      SizedBox(height: 10,),
                      Divider(color: Colors.grey,),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text('Date  Joined',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: 60,
                                width: 138,
                                color: Colors.white,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "DD/MM/YYYY",
                                    hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Enter Date joined";
                                    }
                                  },
                                  controller: DatejoinedController,
                                  onSaved: (value){
                                    dateJoined=value!;
                                    },
                                ),
                              ),
                            ],
                          ),
                          s1==Status.Previously?Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:50.0),
                                child: Text('Date  Exit',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: 60,
                                width: 138,
                                color: Colors.white,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "DD/MM/YYYY",
                                    hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Enter Date Exit";
                                    }
                                  },
                                  controller: DateExitController,
                                  onSaved: (value){
                                    dateExit=value!;
                                  },
                                ),
                              ),
                            ],
                          ):Container(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(onPressed: (){
                            if(fromkey.currentState!.validate()){
                              fromkey.currentState!.save();
                              Navigator.of(context).pushNamed('/education');
                            }
                          }, child: Text("SAVE")),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
