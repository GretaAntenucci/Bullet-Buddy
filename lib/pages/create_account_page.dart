import 'package:bullet_buddy/shapes/bottom_shape.dart';
import 'package:bullet_buddy/shapes/top_shape.dart';
import 'package:bullet_buddy/widgets/custom_text_field.dart';
import 'package:bullet_buddy/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const TopShape(),
          const BottomShape(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Title (create account)
                  Padding(
                    padding: const EdgeInsets.only(top: 103),
                    child: Text(
                      'Create account',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),

                  ///Spacing
                  const SizedBox(
                    height: 42,
                  ),

                  /// Form with text fields
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          /// Username field
                          CustomTextField(
                            textInputType: TextInputType.text,
                            icon: const Icon(Icons.person),
                            hintText: 'Username',
                          ),

                          const SizedBox(
                            height: 22,
                          ),

                          /// Password field
                          CustomTextField.password(
                            hintText: 'Password',
                          ),
                          const SizedBox(
                            height: 22,
                          ),

                          /// Email Field
                          CustomTextField(
                            textInputType: TextInputType.emailAddress,
                            icon: const Icon(Icons.mail),
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 22,
                          ),

                          /// Mobile Field
                          CustomTextField(
                            textInputType: TextInputType.number,
                            icon: const Icon(Icons.phone_android),
                            hintText: 'Mobile',
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Create Button
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 80,
                      right: 80,
                    ),
                    child: GradientButton(
                      action: () {},
                      text: 'Create',
                    ),
                  ),

                  /// Text + text button
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Text
                        const Text(
                          "Have an account?",
                          style: TextStyle(fontSize: 20),
                        ),

                        /// Text button
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
