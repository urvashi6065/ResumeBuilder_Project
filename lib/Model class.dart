import 'package:flutter/cupertino.dart';

class ModelClass{
  final String title;
  final String route;
  final String image;



  ModelClass(
  {required this.title,required this.image,required this.route}
      );
}
List<ModelClass> listdata =[
  ModelClass(title: 'Contact info', image: 'assets/contactinfo.png', route: '/contactinfo'),
  ModelClass(title: 'Carrier Objective', image: 'assets/img.png', route:  '/carrierobjective'),
  ModelClass(title: 'Personal Details', image: 'assets/img_1.png', route: '/personaldetails'),
  ModelClass(title: 'Experiences', image: 'assets/thinking.png', route: '/experiences'),
  ModelClass(title: 'Education', image: 'assets/mortarboard.png', route: '/education'),
  ModelClass(title: 'Technical Skills', image: 'assets/achievement.png', route: '/technicalskills'),
  ModelClass(title: 'Projects', image: 'assets/project.png', route: '/projects'),
  ModelClass(title: 'Achievements', image: 'assets/experience.png', route: '/achievements'),
  ModelClass(title: 'References', image: 'assets/handshake.png', route:  '/references'),
  ModelClass(title: 'Declaration', image: 'assets/declaration.png', route: '/declaration'),
];