import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globelfile.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  List<Demo1> listdata=[];
  List<String> Achivementslistdata=[];
  var fromkey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    if (Globellist != null) {
      Achivementslistdata = Globellist!;
      listdata = Globellist.cast<Demo1>();
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
          title: Text('Achievements'),
          bottom: PreferredSize(preferredSize: Size(double.infinity, 50), child: Column(children: [],),),
          leading: IconButton(icon: Icon(CupertinoIcons.back,size: 35,), onPressed: () {
            Navigator.of(context).pop();
          },),
            centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              listdata.forEach((element) {
                print(element.controller.text);
                setState(() {
                  Achivementslistdata.add(element.controller.text);
                  Globellist = Achivementslistdata;
                  Globellist = listdata.cast<String>();
                });
              });
            }, icon: Icon(Icons.done)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 310,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Container(
                  height: 500,
                  child: Form(
                    key: fromkey,
                    child: Column(
                      children: [
                        Text('Enter Achivements', style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        ...listdata.map((e) => Center(
                          child: Row(
                            children: [
                              e,
                              IconButton(onPressed: (){
                                setState(() {
                                  listdata.remove(e);
                                  Achivementslistdata.remove(e.controller.text);
                                });
                              }, icon: Icon(CupertinoIcons.delete))
                            ],
                          ),
                        )).toList(),
                        ElevatedButton(onPressed: (){
                         setState(() {
                           listdata.add(Demo1());
                         });
                        }, child: Icon(CupertinoIcons.add)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: (){
                            if(fromkey.currentState!.validate()){
                              Navigator.of(context).pushNamed('/projects');
                            }

                          }, child: Text('Next',style: TextStyle(fontSize: 20),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class Demo1 extends StatelessWidget {
   Demo1({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 244,
      // color: Colors.re,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Exceeded sales 17% avearage",
        ),
        validator: (value){
          if(value!.isEmpty){
            return "Please Enter";
          }
        },
      ),
    );
  }
}

