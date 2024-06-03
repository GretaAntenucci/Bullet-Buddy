import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _value = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///title account
            const Padding(
              padding: EdgeInsets.only(
                top: 30.0,
                left: 30,
                bottom: 10,
              ),
              child: Text("Account"),
            ),

            ///Account card
            Card(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    ///Edit Profile
                    MaterialButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.manage_accounts_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Edit Profile"),
                        ],
                      ),
                    ),

                    ///Notifications
                    MaterialButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.notifications_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Notifications"),
                        ],
                      ),
                    ),

                    ///Connected device
                    MaterialButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.devices),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Connected device"),
                        ],
                      ),
                    ),
                  ],
                )),

            ///title Layout
            const Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                bottom: 10,
              ),
              child: Text("Layout"),
            ),

            ///Layout card
            Card(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    ///Theme
                    MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(Icons.format_paint_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Theme"),
                          const SizedBox(
                            width: 200,
                          ),
                          Switch(
                            value: _value,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (bool value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    ///Language
                    MaterialButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.language_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Language"),
                        ],
                      ),
                    ),
                  ],
                )),

            ///title action
            const Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                bottom: 10,
              ),
              child: Text("Action"),
            ),

            ///action card
            Card(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    ///Report a problem
                    MaterialButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.flag),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Report a problem"),
                        ],
                      ),
                    ),

                    ///Logout
                    MaterialButton(
                      onPressed: () {
                        // Auth().signOut();
                        Navigator.of(context).pop();
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Logout"),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
    ;
  }
}
