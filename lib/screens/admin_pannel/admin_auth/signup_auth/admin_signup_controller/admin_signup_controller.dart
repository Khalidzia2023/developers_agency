import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminSignupController extends GetxController {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final addressController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isLoading = false.obs;

  Future<void> adminSignup() async {
    if (fNameController.text.isEmpty ||
        lNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPassController.text.isEmpty ||
        addressController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    if (passwordController.text != confirmPassController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      isLoading.value = true;

      // Create Firebase Auth user
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Save user details in Firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
        "firstName": fNameController.text.trim(),
        "lastName":  lNameController.text.trim(),
        "email": emailController.text.trim(),
        "phone": phoneController.text.trim(),
        "address": addressController.text.trim(),
        "createdAt": FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Account created successfully");
      Get.offNamed("/login");
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Signup Failed", e.message ?? "Unknown error");
    } finally {
      isLoading.value = false;
    }
  }
}
