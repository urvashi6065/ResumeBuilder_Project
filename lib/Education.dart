import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globelfile.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {

  var fromkey=GlobalKey<FormState>();
  TextEditingController CourseController=TextEditingController();
  TextEditingController SchoolController=TextEditingController();
  TextEditingController CollageController=TextEditingController();
  TextEditingController YearController=TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    if(name!=null&&email!=null&&phone!=null&&address!=null){
      CourseController.text=name!;
      SchoolController.text=email!;
      CollageController.text=phone!;
      YearController.text=address!;
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
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Color(0xff0475FF),
          title: Text('Education'),
          bottom: PreferredSize(preferredSize: Size(double.infinity, 50), child: Column(children: [],),),
          centerTitle: true,
          leading: IconButton(icon: Icon(CupertinoIcons.back,size: 35,), onPressed: () {
            Navigator.of(context).pop();
          },),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 600,
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
                      Text('Course/Degree',style: TextStyle(color: Colors.blue,fontSize: 17),),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "B.Tech information Technology",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          label: Text("B.Tech information Technology"),
                        ),
                        controller: CourseController,
                        onSaved: (value){
                          name=value!;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter";
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      Text('School/College/institute',style: TextStyle(color: Colors.blue,fontSize: 17),),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Bhagavan Mahavir University",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          label: Text("Bhagavan Mahavir University"),
                        ),
                        controller: SchoolController,
                        onSaved: (value){
                          email=value!;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter";
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      Text('School/College/institute',style: TextStyle(color: Colors.blue,fontSize: 17),),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "70% (or) 7.0 CGPA",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          label: Text("70% (or) 7.0 CGPA"),
                        ),
                        controller: CollageController,
                        onSaved: (value){
                          phone=value!;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter";
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      Text('Year Of Pass',style: TextStyle(color: Colors.blue,fontSize: 17),),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "2019",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          label: Text("2019"),
                        ),
                        controller: YearController,
                        onSaved: (value){
                          address=value!;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter";
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      TextButton(onPressed: (){
                        if(fromkey.currentState!.validate()){
                          fromkey.currentState!.save();
                          Navigator.of(context).pushNamed('/technicalskills');
                        }
                      }, child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('Next',style: TextStyle(fontSize: 20),))),
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
