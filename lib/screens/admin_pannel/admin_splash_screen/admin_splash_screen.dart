import 'package:flutter/material.dart';
import '../../../utils/app_images.dart';
import '../../../widgets/text_btn.dart';

class AdminSplashScreen extends StatelessWidget {
  const AdminSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Text(
            textAlign: TextAlign.center,
           'Hire Developers and built Mobile apps and a websites or an Ai Softwares', style: TextStyle(
           color: Colors.black, fontSize: 20
         ),),
         SizedBox(height: 60,),
         Container(
           height: 400, width: 400,
           decoration: BoxDecoration(
             borderRadius: BorderRadiusGeometry.circular(20),
             image: DecorationImage(image: AssetImage(AppImages.pic2), scale: 1,fit: BoxFit.fill),
           ),

         ),
         SizedBox(height: 60,),
         TextBtn(
           height: MediaQuery.of(context).size.height * 0.1,
           width: MediaQuery.of(context).size.width * 0.94,
           title: 'Let\'s Get Started',
           color: Colors.blueGrey,
         )
       ],
     ),
    );
  }
}
