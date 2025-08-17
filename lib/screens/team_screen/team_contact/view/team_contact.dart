import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_field.dart';
import '../../../../widgets/text_btn.dart';

class TeamContactView extends StatelessWidget {
  const TeamContactView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get passed arguments
    final args = Get.arguments ?? {};
    final String teamName = args['teamName'] ?? '';
    final String teamEmail = args['teamEmail'] ?? '';
    final String teamAddress = args['teamAddress'] ?? '';
    final String teamContact = args['teamContact'] ?? '';

    // Pre-filled controllers
    final TextEditingController teamNameController = TextEditingController(text: teamName);
    final TextEditingController emailController = TextEditingController(text: teamEmail);
    final TextEditingController addressController = TextEditingController(text: teamAddress);
    final TextEditingController contactController = TextEditingController(text: teamContact);

    final TextEditingController linkedInController = TextEditingController();
    final TextEditingController websiteController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Contact Teams',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Times New Roman',
          ),
        ),
        leading: IconButton(onPressed: (){
          Get.offNamed('/MainBNav');
        }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                radius: 40,
                child: const Icon(
                  FontAwesomeIcons.jediOrder,
                  color: Colors.amber,
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),

              // Team Name field
              CustomField(
                fieldController: teamNameController,
                labelText: 'Team Name',
                prefixIcon: FontAwesomeIcons.sith,
                fillColor: Colors.grey.shade200,
              ),

              // Email field (pre-filled)
              CustomField(
                fieldController: emailController,
                labelText: 'Enter Email',
                prefixIcon: FontAwesomeIcons.mailchimp,
                fillColor: Colors.grey.shade200,
              ),

              // Phone field (pre-filled)
              CustomField(
                fieldController: addressController,
                labelText: 'Enter Address',
                prefixIcon: Icons.location_on_outlined,
                fillColor: Colors.grey.shade200,
              ),


              CustomField(
                fieldController: contactController,
                labelText: 'Team Contact',
                prefixIcon: Icons.phone,
                fillColor: Colors.grey.shade200,
              ),


              CustomField(
                fieldController: linkedInController,
                labelText: 'LinkedIn Profile',
                hintText: 'LinkedIn Account',
                prefixIcon: FontAwesomeIcons.linkedinIn,
                fillColor: Colors.grey.shade200,
              ),

              CustomField(
                fieldController: websiteController,
                labelText: 'Website Address',
                hintText: 'Website Address',
                prefixIcon: FontAwesomeIcons.sith,
                fillColor: Colors.grey.shade200,
              ),

              const SizedBox(height: 40),
              TextBtn(
                title: 'Submit Contact',
                width: double.infinity,
                height: 46,
                color: Colors.blueGrey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
