import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../team_models/team_model.dart';

class TeamRController extends GetxController {
  var teams = <TeamRModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  var selectedImageBase64 = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source, imageQuality: 50);
      if (pickedFile != null) {
        final bytes = await File(pickedFile.path).readAsBytes();
        selectedImageBase64.value = base64Encode(bytes);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image: $e");
    }
  }

  // Future<void> registerTeam(String name, String address) async {
  //   try {
  //     if (selectedImageBase64.isEmpty) {
  //       Get.snackbar("Error", "Please select an image");
  //       return;
  //     }
  //
  //     DocumentReference docRef = await _firestore.collection('teamRegistration').add({
  //       'name': name,
  //       'address': address,
  //       'imageBase64': selectedImageBase64.value,
  //       'isRegistered': true,
  //     });
  //
  //     teams.add(TeamRModel(
  //       id: docRef.id,
  //       name: name,
  //       address: address,
  //       imageBase64: selectedImageBase64.value,
  //       isRegistered: true,
  //     ));
  //     selectedImageBase64.value = '';
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }
  Future<void> registerTeam(String name, String email, String contact, String address) async {
    try {
      if (selectedImageBase64.isEmpty) {
        Get.snackbar("Error", "Please select an image");
        return;
      }

      DocumentReference docRef = await _firestore.collection('teamRegistration').add({
        'name': name,
        'email': email,
        'contact': contact,
        'address': address,
        'imageBase64': selectedImageBase64.value,
        'isRegistered': true,
      });

      teams.add(TeamRModel(
        id: docRef.id,
        name: name,
        email: email,
        contact: contact,
        address: address,
        imageBase64: selectedImageBase64.value,
        isRegistered: true,
      ));
      selectedImageBase64.value = '';
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> fetchTeams() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('teamRegistration').get();
      teams.value = snapshot.docs
          .map((doc) => TeamRModel.fromMap(doc.id, doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
