import 'package:bullet_buddy/shapes/bottom_shape.dart';
import 'package:bullet_buddy/shapes/top_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  ValueNotifier<bool> open = ValueNotifier(true);

  // void changeIcon() {
  //   open.value
  //       ? Icon(Icons.add)
  //       : Icon(Icons.remove_red_eye_outlined);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          TopShape(),
          BottomShape(),
          SafeArea(
            child: ValueListenableBuilder(
              valueListenable: open,
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Bullet Buddy',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Sign in to your account'),
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
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
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
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot your password?'),
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
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/create');
                            },
                            child: const Text('Create'),
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

// TextField(
// keyboardType: TextInputType.text,
// obscureText: true,
// decoration: InputDecoration(
// suffix: ElevatedButton(
// onPressed: () => icon = Icon(Icons.traffic),
// child: icon,
// ),
// prefixIcon: const Icon(Icons.lock),
// hintText: 'Password',
// border: OutlineInputBorder(
// borderSide: const BorderSide()
//     .copyWith(color: Colors.grey),
// borderRadius:
// const BorderRadius.all(Radius.circular(50))),
// ),
// ),
