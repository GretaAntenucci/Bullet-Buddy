import 'package:bullet_buddy/shapes/bottom_shape.dart';
import 'package:bullet_buddy/shapes/top_shape.dart';
import 'package:bullet_buddy/widgets/custom_text_field.dart';
import 'package:bullet_buddy/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        /// Gradient curves
        const TopShape(),
        const BottomShape(),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// App name
                Padding(
                  padding: const EdgeInsets.only(top: 103),
                  child: Text(
                    'Bullet Buddy',
                    style: GoogleFonts.lavishlyYours(
                      fontSize: 48,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                /// Subtitle
                const Text('Sign in to your account'),
                const SizedBox(
                  height: 20,
                ),

                /// Form
                Form(
                  child: Column(
                    children: [
                      /// Email field
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: CustomTextField(
                            icon: const Icon(Icons.person),
                            hintText: 'Email',
                            textInputType: TextInputType.emailAddress,
                          )),

                      /// Password field
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: CustomTextField.password(
                          hintText: 'Password',
                        ),
                      ),
                    ],
                  ),
                ),

                /// Button forgot password
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: TextButton(
                      style: const ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: Color(0xFF848484),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Sign in button
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                    left: 80,
                    right: 80,
                  ),
                  child: GradientButton(
                    text: 'Sign in',
                    action: () {
                      // TODO da togliere
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),

                /// Create account text + button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Text
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 20),
                    ),

                    /// Button create account
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create');
                      },
                      child: const Text(
                        'Create',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
