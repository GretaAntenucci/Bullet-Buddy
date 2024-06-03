import 'package:bullet_buddy/fab/expandable_fab.dart';
import 'package:bullet_buddy/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class NewDiaryPage extends StatelessWidget {
const NewDiaryPage({super.key});

  //ValueNotifier<bool> state = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 60,
        children: [
          CustomActionButton(
            title: 'Add page',
            onPressed: () {},
            icon: Icons.add_card,
          ),
          CustomActionButton(
            title: 'Templates',
            onPressed: () {},
            icon: Icons.pages,
          ),
        ],
      ),
      /*FloatingActionButton(
        onPressed: (){
          state.value = true;
        },
        child: const Icon(Icons.add),
      ),*/
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Titolo"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: (){},
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 240, 219),
        foregroundColor: Colors.purple[900]!,
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
          child:const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(
                Icons.add_circle_outline,
                size: 120,
                color: Colors.white,
              ),
              Text(
                'New Diary Page',
                style: TextStyle(
                    color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}