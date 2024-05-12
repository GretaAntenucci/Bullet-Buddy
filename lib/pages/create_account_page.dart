import 'package:bullet_buddy/shapes/bottom_shape.dart';
import 'package:bullet_buddy/shapes/top_shape.dart';
import 'package:flutter/material.dart';



class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});
  ValueNotifier<bool> open = ValueNotifier(true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: [
            const TopShape(),
            const BottomShape(),
            SafeArea(
              child: ValueListenableBuilder(
                valueListenable: open,
                builder: (context, value, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Create account',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        child: Column(
                          children: [
                            Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 8.0,
                            ),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                hintText: 'Username',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide()
                                      .copyWith(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 8.0,
                              ),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                obscureText: open.value,
                                decoration: InputDecoration(
                                  constraints: const BoxConstraints(
                                    maxHeight: 70,
                                    maxWidth: double.infinity,
                                  ),
                                  suffixIcon: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      open.value = !open.value;
                                    },
                                    icon: open.value
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.remove_red_eye),
                                  ),
                                  prefixIcon: const Icon(Icons.lock),
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide()
                                          .copyWith(color: Colors.grey),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 8.0,
                              ),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.mail),
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide()
                                        .copyWith(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 8.0,
                              ),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.phone_android),
                                  hintText: 'Mobile',
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide()
                                        .copyWith(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ]
      ),
    );
  }
}
