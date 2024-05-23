import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _visible = true;
  Icon _icon = const Icon(
    Icons.search,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App bar
      appBar: AppBar(
        backgroundColor: const Color(0xFFC69BD9),

        /// Visibility widget
        /// if visible shows the title if not shows the search bar
        title: Visibility(
          visible: _visible,

          /// Search bar
          replacement: const SizedBox(
            height: 40,
            child: SearchBar(
              elevation: WidgetStatePropertyAll(2),
              backgroundColor: WidgetStatePropertyAll(Color(0xFFC69BD9)),
            ),
          ),

          /// Title
          child: Text(
            'Bullet Buddy',
            style: GoogleFonts.lavishlyYours(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),

        /// Leading Icon
        /// if visible shows the search icon if not shows the cancel icon
        actions: [
          IconButton(
            onPressed: () {
              setState(
                () {
                  _visible = !_visible;
                  if (!_visible) {
                    _icon = const Icon(
                      Icons.cancel,
                      color: Colors.black,
                    );
                  } else {
                    _icon = const Icon(
                      Icons.search,
                      color: Colors.black,
                    );
                  }
                },
              );
            },
            icon: _icon,
          ),
        ],
      ),

      /// Lista dei tag con card interne
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Tag $index',
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 0 : 20),
                    child: Container(
                      width: 97,
                      height: 116,
                      color: const Color(0xFFA9AEA9),
                      child: const Text(
                        'text',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
