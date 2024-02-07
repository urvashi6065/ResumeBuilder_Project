import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globelfile.dart';

class Declaration extends StatefulWidget {
  const Declaration({Key? key}) : super(key: key);

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  bool isswitch=false;
  var fromkey = GlobalKey<FormState>();
  TextEditingController DescripationController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController PlaceController = TextEditingController();




  @override
  void initState() {
    // TODO: implement initState
    if(name!=null&&email!=null&&phone!=null){
      DescripationController.text=name!;
      DateController.text=email!;
      PlaceController.text=phone!;
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
          title: Text('Declaration'),
          bottom: PreferredSize(preferredSize: Size(double.infinity, 50), child: Column(children: []),),
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
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
              ),
             child: Form(
               key: fromkey,
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 20.0),
                             child: Text('Declaration', style: TextStyle(color: Colors.blue, fontSize: 17),),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(right: 20.0),
                             child: Switch(value: isswitch, onChanged:  (value){
                               setState(() {
                                 isswitch=value;
                               });
                             }),
                           ),
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: isswitch==true?Column(
                       children: [
                         ListTile(
                           leading: Image.asset('assets/contactinfo.png'),
                         ),
                         SizedBox(height: 20,),
                         TextFormField(
                           decoration: InputDecoration(
                             hintText: "Descripation",
                             hintStyle: TextStyle(color: Colors.grey),
                             border: OutlineInputBorder(),
                             label: Text("Descripation"),
                           ),
                           validator: (value){
                             if(value!.isEmpty){
                               return "Please Enter";
                             }
                           },
                           controller: DescripationController,
                           onSaved: (value){
                             name=value!;
                           },
                         ),
                         SizedBox(height: 20,),
                         Divider(color: Colors.grey,),
                         SizedBox(height: 20,),
                         Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               children: [
                                 Container(
                                   height: 70,
                                   width: 100,
                                   decoration: BoxDecoration(color: Colors.white),
                                   child: Text('Date',style: TextStyle(color: Colors.grey,fontSize: 17),),
                                 ),
                                 Container(
                                   height: 50,
                                   width: 130,
                                   decoration: BoxDecoration(color: Colors.white),
                                   child: TextFormField(
                                     decoration: InputDecoration(
                                       hintText: "DD/MM/YYYY",
                                       hintStyle: TextStyle(color: Colors.grey),
                                       border:  OutlineInputBorder(),
                                     ),
                                     controller: DateController,
                                     validator: (value){
                                       if(value!.isEmpty){
                                         return "Please Enter";
                                       }
                                     },
                                     onSaved: (value){
                                       email=value!;
                                     },
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                 Column(
                                   children: [
                                     Container(
                                       height: 70,
                                       width: 120,
                                       decoration: BoxDecoration(color: Colors.white),
                                       child: Text('Place(interview venue/city)',style: TextStyle(color: Colors.grey,fontSize: 17),),
                                     ),
                                     Container(
                                       height: 50,
                                       width: 140,
                                       decoration: BoxDecoration(color: Colors.white),
                                       child: TextFormField(
                                         decoration: InputDecoration(
                                           hintText: "Eg.Surat",
                                           hintStyle: TextStyle(color: Colors.grey),
                                           border:  OutlineInputBorder(),
                                         ),
                                         controller: PlaceController,
                                         validator: (value){
                                           if(value!.isEmpty){
                                             return "Please Enter";
                                           }
                                         },
                                         onSaved: (value){
                                           phone=value!;
                                         },
                                       ),
                                     ),
                                   ],
                                 ),
                               ],
                             )
                           ],
                         ),
                         ElevatedButton(onPressed: (){
                           if(fromkey.currentState!.validate()){
                             fromkey.currentState!.save();
                           }
                         }, child: Text('SAVE'),),
                       ],
                     ):Container(
                     ),
                   ),
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
