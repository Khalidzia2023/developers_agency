import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/teamR_controller.dart';
import 'package:curb/widgets/text_widget.dart';

class RegisterTeamScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  final TeamRController teamController = Get.put(TeamRController());

  RegisterTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: regularText(title: 'Register Your Team ', textSize: 20, textColor: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // regularText(title: 'Team Name', textSize: 20, textColor: Colors.black),
              // TextFormField(
              //   controller: nameController,
              //   decoration: InputDecoration(
              //     labelText: "Team Name",
              //     labelStyle: TextStyle(color: Colors.grey.shade500),
              //     fillColor: Colors.grey.shade100,
              //     filled: true,
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              // SizedBox(height: 20),
              //
              // regularText(title: 'Team Email', textSize: 20, textColor: Colors.black),
              // TextFormField(
              //   controller: nameController,
              //   decoration: InputDecoration(
              //     labelText: "Team Email",
              //     labelStyle: TextStyle(color: Colors.grey.shade500),
              //     fillColor: Colors.grey.shade100,
              //     filled: true,
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              // SizedBox(height: 20),
              //
              // regularText(title: 'Team Contact', textSize: 20, textColor: Colors.black),
              // TextFormField(
              //   controller: nameController,
              //   decoration: InputDecoration(
              //     labelText: "Team Contact",
              //     labelStyle: TextStyle(color: Colors.grey.shade500),
              //     fillColor: Colors.grey.shade100,
              //     filled: true,
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              // SizedBox(height: 20),
              //
              // regularText(title: 'Team Address', textSize: 20, textColor: Colors.black),
              // TextFormField(
              //   controller: addressController,
              //   decoration: InputDecoration(
              //     labelText: "Address",
              //     fillColor: Colors.grey.shade100,
              //     filled: true,
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              // SizedBox(height: 20),
              //
              // regularText(title: 'Team Image', textSize: 20, textColor: Colors.black),
              // SizedBox(height: 10),

              // Team Name
              regularText(title: 'Team Name', textSize: 20, textColor: Colors.black),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Team Name",
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),

// Team Email
              regularText(title: 'Team Email', textSize: 20, textColor: Colors.black),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Team Email",
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),

                // Team Contact
              regularText(title: 'Team Contact', textSize: 20, textColor: Colors.black),
              TextFormField(
                controller: contactController,
                decoration: InputDecoration(
                  labelText: "Team Contact",
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),

            // Team Address
              regularText(title: 'Team Address', textSize: 20, textColor: Colors.black),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),


              Obx(() {
                if (teamController.selectedImageBase64.isNotEmpty) {
                  return Image.memory(
                    base64Decode(teamController.selectedImageBase64.value),
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }
                return Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    color: Colors.grey[300],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 50, color: Colors.deepPurple),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            icon: Icon(Icons.camera_alt, size: 30,),
                            label: regularText(title: 'Camera', textSize: 18, textColor: Colors.deepPurple),
                            onPressed: () => teamController.pickImage(ImageSource.camera),
                          ),
                          TextButton.icon(
                            icon: Icon(Icons.photo, size: 30,),
                            label: regularText(title: 'Gallery', textSize: 18, textColor: Colors.deepPurple),
                            onPressed: () => teamController.pickImage(ImageSource.gallery),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),



              SizedBox(height: 20),
              SizedBox(
                height: 46,
                width: double.infinity,
                child: ElevatedButton(
                  // onPressed: () {
                  //   if (nameController.text.isNotEmpty &&
                  //       addressController.text.isNotEmpty) {
                  //     teamController.registerTeam(
                  //       nameController.text.trim(),
                  //       addressController.text.trim(),
                  //     );
                  //     Get.snackbar("Success", "Team Registered!");
                  //   }
                  // },
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        contactController.text.isNotEmpty &&
                        addressController.text.isNotEmpty) {
                      teamController.registerTeam(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        contactController.text.trim(),
                        addressController.text.trim(),
                      );
                      Get.snackbar("Success", "Team Registered!");
                    }
                  },

                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))),
                     foregroundColor: WidgetStatePropertyAll(Colors.red),
                    backgroundColor:  WidgetStatePropertyAll(Colors.blueGrey),
                  ),
                  child: regularText(title: 'Submit Registration', textSize: 18, textColor: Colors.white),
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                  Get.offNamed('/FetchTeam');
                  },
                  child: regularText(title: 'Fetch team list', textSize: 18, textColor: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
