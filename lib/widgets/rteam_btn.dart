import 'package:curb/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RteamBtns extends StatelessWidget {
  final String btnTitle;
  final double btnHeight, btnWidth;
  final Color btnColor;
  final IconData? btnIcon;
  final Widget? child;
  final VoidCallback? onClick;

 const RteamBtns({
    super.key,
    required this.btnTitle,
    required this.btnColor,
    required this.btnHeight,
    required this.btnWidth,
    this.btnIcon,
    this.child,
   this.onClick,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: btnHeight , width: btnWidth,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(10),
            color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ? child,
            Icon(btnIcon, color: Colors.deepPurple,),
            regularText(title: btnTitle, textSize: 16, textColor: Colors.black),
          ],
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   spacing: 16,
        //   children: [
        //     Icon(Icons.verified_rounded, color: Colors.deepPurple,),
        //     Text('Contact Team', style: TextStyle(fontSize: 16,
        //         color: Colors.black, fontFamily: 'Times New Roman'),),
        //   ],
        // ),
      ),
    );
  }
}