import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resumebuilderapp/Achievements.dart';
import 'package:resumebuilderapp/Contact%20Info.dart';
import 'package:resumebuilderapp/Declaration.dart';
import 'package:resumebuilderapp/Education.dart';
import 'package:resumebuilderapp/Experiences.dart';
import 'package:resumebuilderapp/Interest_Hobbies.dart';
import 'package:resumebuilderapp/Personal_Details.dart';
import 'package:resumebuilderapp/Projects.dart';
import 'package:resumebuilderapp/References.dart';
import 'package:resumebuilderapp/ResumeWorkSpace.dart';
import 'package:resumebuilderapp/Splash_Screen.dart';
import 'package:resumebuilderapp/Technical_Skills.dart';

import 'Carrier_Objective.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemUiOverlayStyle(
  statusBarColor: Colors.red, // <-- SEE HERE
  // statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
  // statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
  systemNavigationBarColor: Colors.green,
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) =>SplashScreen(),
        '/homepage':(context)=>MyHomePage(title: 'Flutter Demo Home Page'),
        '/resumeworkspace': (context) =>ResumeWorkSpace(),
        '/contactinfo':(context)=>Contact_info(),
        '/carrierobjective':(context)=>CarrierObjective(),
        '/personaldetails':(context)=>PersonalDetails(),
        '/education':(context)=>Education(),
        '/experiences':(context)=>Experiences(),
        '/technicalskills':(context)=>TechnicalSkills(),
        '/interest/hobbies':(context)=>InterestHobbies(),
        '/projects':(context)=>Projects(),
        '/achievements':(context)=>Achievements(),
        '/references':(context)=>References(),
        '/declaration':(context)=>Declaration(),
      },
      initialRoute: '/',

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0475FF),
        centerTitle: true,
        title: Column(
          children: [
            Text('Resume Builder'),
            SizedBox(height: 30,),
            Text('RESUMES ',),
          ],
        ),
        toolbarHeight: 150,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: Text('Gmail',style: TextStyle(color: Colors.red,fontSize: 20),),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.all_inbox_sharp),
              title: Text('All inboxes',style: TextStyle(fontSize: 15),),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('Primary',style: TextStyle(fontSize: 15),),
            ),
            ListTile(
              leading: Icon(Icons.child_care),
              title: Text('Promotions',style: TextStyle(fontSize: 15),),
            ),
            ListTile(
              leading: Image.asset('assets/img_1.png',width: 20,),
              title: Text('Social',style: TextStyle(fontSize: 15),),
              trailing:Container(
                height: 25,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(child: Text('9 new',style: TextStyle(fontSize: 12),)),
              ),
            ),
            ListTile(
             selectedColor: Colors.red,
              leading: Text('All lables',style: TextStyle(fontSize: 12),),
            ),
            ListTile(
              leading: Icon(Icons.star_border_purple500_sharp),
              title: Text('Starred',style: TextStyle(fontSize: 15),),
            ),
            ListTile(
              leading: Icon(Icons.watch_later_outlined),
              title: Text('Snoozed',style: TextStyle(fontSize: 15),),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/box.png'),
                width: 60,
              ),
              SizedBox(height: 10,),
              Text(
                'No Resumes + Create new resume.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('/resumeworkspace');
        },
         child:  Icon(Icons.add,color: Colors.white,size: 50,),
      ),
    );
  }
}
