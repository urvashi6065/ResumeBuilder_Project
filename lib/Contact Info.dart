import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resumebuilderapp/Globelfile.dart';
import 'package:resumebuilderapp/Model%20class.dart';

class Contact_info extends StatefulWidget {
  const Contact_info({Key? key}) : super(key: key);

  @override
  State<Contact_info> createState() => _Contact_infoState();
}

class _Contact_infoState extends State<Contact_info> {
  int index=0;
  File? imagefile;
  var fromkey=GlobalKey<FormState>();
  TextEditingController NameController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
  TextEditingController PhoneController=TextEditingController();
  TextEditingController AddressController=TextEditingController();

  //
  // String name='';
  @override
  void initState() {
    // TODO: implement initState
    if(name!=null && email!=null && phone!=null && address!=null){
      NameController.text=name!;
      EmailController.text=email!;
      PhoneController.text=phone!;
      AddressController.text=address!;

    }
    if(image1!=null){
      setState(() {
        imagefile=image1;
      });
    }

    super.initState();
  }
  imagepicker() async {
    var image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState(() {
        imagefile = File(image.path);
        image1=imagefile;
      });
    }
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
          leading: IconButton(
            icon: Icon(CupertinoIcons.back,size: 35,), onPressed: () {  Navigator.of(context).pop();},
          ),

          centerTitle: true,
          title: Text('Resume Workspace', style: TextStyle(
            fontSize: 25,
          ),),
          bottom: PreferredSize(preferredSize: Size(double.infinity,70 ), child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: (){
                      setState(() {
                        index=0;
                      });
                    },
                    child: Text('Contact',style: TextStyle(color: Colors.white,fontSize: 20),)),
                InkWell(
                    onTap: (){
                      setState(() {
                        index=1;
                      });
                    },
                    child: Text('Photo',style: TextStyle(color: Colors.white,fontSize: 20),)),
              ],
            ),
          ),)
        ),
       body: SingleChildScrollView(
         child: IndexedStack(
           index: index,
           children: [
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Container(
                 height: 500,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: Colors.white
                 ),
                child: Form(
                  key: fromkey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value){
                            name=value;
                            print(name);
                          },
                           controller: NameController,
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please Enter Name";
                            }
                          },
                           decoration: InputDecoration(
                             prefixIcon: Icon(CupertinoIcons.person_alt),
                             hintText: "Name",
                               hintStyle: TextStyle(color: Colors.grey),
                             // border: OutlineInputBorder(),
                              label: Text("name"),
                              focusedBorder: OutlineInputBorder(),
                           ),
                         onSaved: (value){
                            name=value!;
                         },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Please Enter Email";
                              }
                            },
                            controller: EmailController,
                            decoration: InputDecoration(
                             prefixIcon: Icon(Icons.email),
                              hintText: "Email",
                               label: Text("email"),
                              // border: OutlineInputBorder(),
                               focusedBorder: OutlineInputBorder(),
                                hintStyle: TextStyle(color: Colors.grey),
                            ),
                            keyboardType: TextInputType.emailAddress,
                             onSaved: (value){
                              email=value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Please Enter Number";
                              }
                            },
                            controller: PhoneController,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                             prefixIcon: Icon(Icons.mobile_screen_share_outlined),
                              hintText: "Phone",
                               label: Text("phone"),

                              // border: OutlineInputBorder(),
                               focusedBorder: OutlineInputBorder(),
                                hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (value){
                              phone=value!;
                            },
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please Enter Address";
                            }
                          },
                          controller: AddressController,
                          maxLines: 3,
                          decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on_sharp),
                            hintText: "Address (Street, Building No)",
                             label: Text("address"),
                             // border: OutlineInputBorder(),
                             focusedBorder: OutlineInputBorder(),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onSaved: (value){
                            address=value!;
                          },
                        ),
                        ElevatedButton(onPressed: (){
                          if(fromkey.currentState!.validate()){
                           fromkey.currentState!.save();
                           Navigator.of(context).pushNamed('/carrierobjective');
                            // print(NameController.text);
                            // print(EmailController.text);
                            // print(PhoneController.text);
                            // print(AddressController.text);

                            // print(name);
                            // print(email);
                            // print(phone);
                            // print(address);
                            SnackBar snack=SnackBar(content: Text('Sumbited'));
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                          };
                        }, child: Text("Next"),),
                      ],
                    ),
                  ),
                ),
               ),
             ),
            Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 250,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (imagefile==null)?Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      shape: BoxShape.circle
                    ),
                    child: Center(child: Text('ADD',style: TextStyle(fontSize: 20),)),
                  ):CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(imagefile!),
                  ),
                  Transform.translate(
                    offset: Offset(40, -30),
                    child: InkWell(
                      onTap: (){
                        imagepicker();
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Icon(Icons.add,color: Colors.white,size: 15,)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
            ),
           ],
         ),
       ),
      ),
    );
  }
}
