import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globelfile.dart';

enum Status { Single, Married }

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  var s1 = Status.Single;
  bool value = true;
  int index = 0;
  bool value1 = true;
  bool change=true;
  bool English=false;
  bool Hindi=false;
  bool Gujrati=false;
  bool isswitch=false;
  var fromkey=GlobalKey<FormState>();
  TextEditingController DateController=TextEditingController();
  TextEditingController SingleCntroller=TextEditingController();
  TextEditingController MarriedController=TextEditingController();
  TextEditingController EnglishController=TextEditingController();
  TextEditingController HindiController=TextEditingController();
  TextEditingController GujratiController=TextEditingController();
  TextEditingController NationalityController=TextEditingController();
  @override

  void initState() {
    // TODO: implement initState
    if(date!=null && nationality!=null){
      DateController.text=date!;
      NationalityController.text=nationality!;
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
          title: Text('Personal Details'),
         leading: Column(
           children: [
             IconButton(onPressed: (){
               Navigator.of(context).pop();
             }, icon: Icon(CupertinoIcons.back,size: 35,))
           ],
         ),
         centerTitle: true,
         bottom: PreferredSize(preferredSize: Size(double.infinity, 50), child: Column(children: [],),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: 750,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: fromkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DOB',
                        style: TextStyle(color: Colors.blue, fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value){
                          date=value!;
                        },
                        validator: (value) {
                          if(value!.isEmpty){
                            return "DOB";
                          }
                        },
                        controller: DateController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "DD/MM/YYYY"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Marital Status",
                        style: TextStyle(color: Colors.blue, fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RadioListTile(
                        selectedTileColor: Colors.blue,
                          activeColor: Colors.blue,
                          value: Status.Single,
                          groupValue: s1,
                          onChanged: (value) {
                            setState(() {
                              s1 = value!;
                            });
                          },
                          title: Text("Single",)),
                      RadioListTile(
                        activeColor: Colors.blue,
                        value: Status.Married,
                        groupValue: s1,
                        onChanged: (value) {
                          setState(() {
                            s1 = value!;
                          });
                        },
                        title: Text(
                          'Married',

                        ),
                      ),
                      Text(
                        'Languages Known',
                        style: TextStyle(color: Colors.blue, fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                       CheckboxListTile(
                         controlAffinity: ListTileControlAffinity.leading,
                         value: English, onChanged: (value){
                        setState(() {
                          English=value!;
                        });
                       },title: Text("English"),),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: Hindi, onChanged: (value){
                        setState(() {
                          Hindi=value!;
                        });
                      },title: Text("Hindi"),),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: Gujrati, onChanged: (value){
                        setState(() {
                          Gujrati=value!;
                        });
                      },title: Text("Gujrati"),),
                      Text('Nationality',style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      TextFormField(
                        onSaved: (value){
                          nationality=value!;
                        },
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Nationality";
                          }
                        },
                        controller: NationalityController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "indian"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ElevatedButton(onPressed: (){
                            print(DateController.text);
                            print(NationalityController.text);
                          if(fromkey.currentState!.validate()){
                            fromkey.currentState!.save();
                            Navigator.of(context).pushNamed('/experiences');
                          }
                          }, child: Text("Save"),),
                        ),
                      ),
                      // Switch(value: isswitch, onChanged:  (value){
                      //   setState(() {
                      //     isswitch=value;
                      //   });
                      // })
                    ],
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
