import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resumebuilderapp/Globelfile.dart';

class TechnicalSkills extends StatefulWidget {
  const TechnicalSkills({Key? key}) : super(key: key);

  @override
  State<TechnicalSkills> createState() => _TechnicalSkillsState();
}

class _TechnicalSkillsState extends State<TechnicalSkills> {
  List<Demo> listdata = [];
  List<String> SkillListdata = [];

  @override
  void initState() {
    // TODO: implement initState
    if (Globellist != null) {
      SkillListdata = Globellist!;
      listdata = Globellist.cast<Demo>();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Color(0xff0475FF),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 70),
          child: Column(
            children: [],
          ),
        ),
        title: Text('Technical Skills'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                listdata.forEach((element) {
                  print(element.controller.text);
                  setState(() {
                    SkillListdata.add(element.controller.text);
                    Globellist = SkillListdata;
                    Globellist = listdata.cast<String>();
                  });
                });
              },
              icon: Icon(Icons.done)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    'Enter your skiils',
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ...listdata
                      .map((e) => Center(
                            child: Row(
                              children: [
                                e,
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        listdata.remove(e);
                                        SkillListdata.remove(e.controller.text);
                                      });
                                    },
                                    icon: Icon(CupertinoIcons.delete))
                              ],
                            ),
                          ))
            .toList(),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      listdata.add(Demo());
                    });
                  }, child: Icon(Icons.add)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class Demo extends StatelessWidget {
  Demo({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      width: 244,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: "C Programming, Web Technical"),
      ),
    );
  }
}
