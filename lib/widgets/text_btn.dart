// import 'package:flutter/material.dart';
//
//
// class TextBtn extends StatelessWidget {
//
//   final String title;
//   final double height, width;
//   final Color color;
//
//   const TextBtn({super.key,
//     required this.title,
//     required this.height,
//     required this.width,
//     required this.color,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height, width: width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadiusGeometry.circular(10),
//         color: color
//       ),
//       child: Center(
//           child: Text(
//             title, style: TextStyle(
//               color: Colors.white, fontSize: 20,
//               fontWeight: FontWeight.w400),)),
//     );
//   }
// }



import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  final String title;
  final double height, width;
  final Color color;
  final VoidCallback? onTap; // <-- Added

  const TextBtn({
    super.key,
    required this.title,
    required this.height,
    required this.width,
    required this.color,
    this.onTap, // <-- Added
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // <-- Added
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

