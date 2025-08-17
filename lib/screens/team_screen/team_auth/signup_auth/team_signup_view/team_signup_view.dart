import 'package:curb/widgets/custom_field.dart';
import 'package:curb/widgets/text_btn.dart';
import 'package:curb/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../team_signup_controller/team_signup_controller.dart';


class TeamSignupView extends StatelessWidget {
  const TeamSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(TeamSignupController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Icon(FontAwesomeIcons.accusoft, color: Colors.amber, size: 40),
                regularText(
                    title: 'Developers Home Agency',
                    textSize: 18,
                    textColor: Colors.black),
                SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: CustomField(
                        fieldController: signupController.fNameController,
                        labelText: 'First Name',
                        hintText: 'Enter Name',
                        fillColor: Colors.grey.shade200,
                        prefixIcon: Icons.person,
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      child: CustomField(
                        fieldController: signupController.lNameController,
                        labelText: 'Last Name',
                        hintText: 'Enter Surname',
                        fillColor: Colors.grey.shade200,
                        prefixIcon: Icons.person,
                      ),
                    ),
                  ],
                ),
                CustomField(
                  fieldController: signupController.emailController,
                  labelText: 'Email Address',
                  hintText: 'Enter Email',
                  fillColor: Colors.grey.shade200,
                  prefixIcon: FontAwesomeIcons.mailchimp,
                ),
                CustomField(
                  fieldController: signupController.phoneController,
                  labelText: 'Phone Number',
                  hintText: 'Enter Phone Number',
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Icons.phone,
                ),
                Obx(() => CustomField(
                  fieldController: signupController.passwordController,
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Icons.password,
                  obscureText: signupController.isPasswordHidden.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      signupController.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      signupController.isPasswordHidden.value =
                      !signupController.isPasswordHidden.value;
                    },
                  ),
                )),
                Obx(() => CustomField(
                  fieldController: signupController.confirmPassController,
                  labelText: 'Confirm Password',
                  hintText: 'Enter Password',
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Icons.password,
                  obscureText: signupController.isPasswordHidden.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      signupController.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      signupController.isPasswordHidden.value =
                      !signupController.isPasswordHidden.value;
                    },
                  ),
                )),
                CustomField(
                  fieldController: signupController.addressController,
                  labelText: 'Address',
                  hintText: 'Residential Address',
                  fillColor: Colors.grey.shade200,
                  prefixIcon: FontAwesomeIcons.locationCrosshairs,
                ),
                SizedBox(height: 30),
                Obx(() => signupController.isLoading.value
                    ? CircularProgressIndicator()
                    : TextBtn(
                  title: 'Register Account',
                  height: 46,
                  width: double.infinity,
                  color: Colors.blueGrey,
                  onTap: signupController.teamSignup,
                )),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    regularText(
                        title: 'Already have an account?',
                        textSize: 16,
                        textColor: Colors.black),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Get.toNamed("/login"),
                      child: regularText(
                          title: 'LogIn Account',
                          textSize: 16,
                          textColor: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
