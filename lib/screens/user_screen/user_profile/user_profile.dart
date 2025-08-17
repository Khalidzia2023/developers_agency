import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curb/widgets/text_widget.dart';
import 'package:curb/utils/app_images.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {


  String fullName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if (doc.exists) {
          final data = doc.data();
          setState(() {
            fullName = "${data?['firstName'] ?? ''} ${data?['lastName'] ?? ''}";
            email = data?['email'] ?? '';
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(AppImages.pic1),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    regularText(
                      title: fullName.isNotEmpty ? fullName : 'Loading...',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    regularText(
                      title: email.isNotEmpty ? email : 'Loading...',
                      textSize: 16,
                      textColor: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(thickness: 2, color: Colors.black),

          ListView.builder(
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(10),
                border: BoxBorder.all(color: Colors.blueGrey),
                color: Colors.grey.shade100
              ),
              child: ListTile(
                title: Text('Mia khalif'),
                subtitle: Text('Mia khalif'),
              ),
            );
          },)

        ],
      ),
    );
  }
}
