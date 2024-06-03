import 'package:bullet_buddy/shapes/banner_shape.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BannerShape(),
      SizedBox.expand(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///edit cover image button
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.camera_alt,
                      color: Color.fromARGB(255, 108, 4, 133),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 105,
              ),

              ///profile image
              const CircleAvatar(
                radius: 80,
                child: Icon(Icons.account_circle_outlined, size: 80),
              ),

              ///name
              const Text(
                "Melissa Peters",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 108, 4, 133)),
              ),

              ///nickname
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Icon(Icons.edit_note),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Isa")
                  ],
                ),
              ),

              ///birthday date
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Icon(Icons.date_range),
                    SizedBox(
                      width: 20,
                    ),
                    Text("23/05/1995")
                  ],
                ),
              ),

              ///e-mail
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Icon(Icons.mail),
                    SizedBox(
                      width: 20,
                    ),
                    Text("melpeters@gmail.com")
                  ],
                ),
              ),

              ///biography
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Text("Bio"),
                  ],
                ),
              ),
              const Card.filled(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Amo trasformare gli spazi con la mia visione unica e il mio stile distintivo. Ogni progetto mi permette di esprimere la mia creatività e di creare ambienti che rispecchiano le personalità e le esigenze dei miei clienti. Al di fuori del lavoro, mi piace viaggiare, seguire le ultime tendenze della moda e sperimentare in cucina.",
                    ),
                  ),
                ),
              ),

              ///edit profile
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: MaterialButton(
                  onPressed: () {

                  },
                  child: const Row(
                    children: [
                      Icon(Icons.manage_accounts),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Edit Profile")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
