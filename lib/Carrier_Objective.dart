import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globelfile.dart';

class CarrierObjective extends StatefulWidget {
  const CarrierObjective({Key? key}) : super(key: key);

  @override
  State<CarrierObjective> createState() => _CarrierObjectiveState();
}

class _CarrierObjectiveState extends State<CarrierObjective> {
  var fromkey=GlobalKey<FormState>();
  TextEditingController Careercontroller=TextEditingController();
  TextEditingController Cureentcontroller=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if(careerObjective!=null && currentDesignation!=null){
      Careercontroller.text=careerObjective!;
      Cureentcontroller.text=currentDesignation!;
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
          title: Text('Carrier Objective'),
          bottom: PreferredSize(preferredSize: Size(double.infinity, 50), child: Column(children: [],),),
          centerTitle: true,
          leading: Column(
            children: [
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(CupertinoIcons.back,size: 35,))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: fromkey,
              child: Column(
                children: [
                  Container(
                    height: 290,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Career Objective',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Descripation",
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                                border: OutlineInputBorder(),
                              ),
                              controller: Careercontroller,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Enter Career Objective";
                                }
                              },
                              onSaved: (value){
                                careerObjective=value!;
                              },
                              maxLines: 7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 190,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: Text('Current Designation (Experienced Candidate',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Software Engineer",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                                border: OutlineInputBorder(),
                              ),
                              controller: Cureentcontroller,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Enter Current Objective";
                                }
                              },
                              onSaved: (value){
                                currentDesignation=value!;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                  if(fromkey.currentState!.validate()){
                    fromkey.currentState!.save();
                    Navigator.of(context).pushNamed('/personaldetails');
                  }
                  }, child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Next",style: TextStyle(fontSize: 20),)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
