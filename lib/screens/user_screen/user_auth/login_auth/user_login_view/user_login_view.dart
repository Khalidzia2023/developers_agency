import 'package:curb/utils/app_images.dart';
import 'package:curb/widgets/custom_field.dart';
import 'package:curb/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/text_btn.dart';
import '../user_login_controller/user_login_controller.dart';

class UserLoginView extends StatelessWidget {
  const UserLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(UserLoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Center(child: Image.asset(AppImages.login2, scale: 7)),
              SizedBox(height: 20),
              regularText(
                  title: 'Enter Email Address',
                  textSize: 18,
                  textColor: Colors.black),
              CustomField(
                fieldController: loginController.emailController,
                labelText: 'Email Address',
                hintText: 'Enter Email',
                fillColor: Colors.grey,
                prefixIcon: Icons.mail_outline_rounded,
              ),
              Obx(() => CustomField(
                fieldController: loginController.passwordController,
                labelText: 'Password',
                hintText: 'Enter Password',
                fillColor: Colors.grey,
                prefixIcon: Icons.password_outlined,
                obscureText: loginController.isPasswordHidden.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    loginController.isPasswordHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    loginController.isPasswordHidden.value =
                    !loginController.isPasswordHidden.value;
                  },
                ),
              )),
              SizedBox(height: 30),
              Obx(() => loginController.isLoading.value
                  ? CircularProgressIndicator()
                  : TextBtn(
                title: 'Login Account',
                height: 46,
                width: double.infinity,
                color: Colors.blueGrey,
                onTap: loginController.login,
              )),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: regularText(
                    title: 'Forget Password?',
                    textSize: 16,
                    textColor: Colors.deepOrangeAccent),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  regularText(
                      title: 'Don\'t have an account?',
                      textSize: 16,
                      textColor: Colors.black),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Get.toNamed("/register"),
                    child: regularText(
                        title: 'Register Account',
                        textSize: 16,
                        textColor: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
