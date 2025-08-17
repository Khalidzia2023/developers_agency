// import 'package:flutter/material.dart';
//
//
// class CustomField extends StatelessWidget {
//   final TextEditingController fieldController;
//   final String labelText, hintText;
//   final Color fillColor;
//   final IconData prefixIcon;
//   final IconData? suffixIcon;
//
//   const CustomField({
//     super.key,
//     required this.fieldController,
//     required this.labelText,
//     required this.hintText, required this.fillColor,
//     required this.prefixIcon, this.suffixIcon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: TextFormField(
//         user_home_controller: fieldController,
//         decoration: InputDecoration(
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.deepPurple)
//             ),
//             enabledBorder:  OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.deepPurple)
//             ),
//             focusedBorder:  OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.deepPurple)
//             ),
//             hintText: hintText,
//             labelText: labelText,
//             prefixIcon: Icon(prefixIcon),
//             suffixIcon: Icon(suffixIcon),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController fieldController;
  final String? labelText, hintText;
  final Color fillColor;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomField({
    super.key,
    required this.fieldController,
    required this.fillColor,
    required this.prefixIcon,
    this.labelText,
     this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: fieldController,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.deepPurple)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.deepPurple)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.deepPurple)),
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}