import 'package:bullet_buddy/data/template_list.dart';
import 'package:bullet_buddy/templates/template_widget.dart';
import 'package:flutter/material.dart';

class TemplateMenuPage extends StatefulWidget {
  const TemplateMenuPage({super.key});

  @override
  State<TemplateMenuPage> createState() => _TemplateMenuPageState();
}

class _TemplateMenuPageState extends State<TemplateMenuPage> {
  List<TemplateWidget> displayedTemplates = [];

  @override
  void initState() {
    super.initState();
    displayedTemplates = templates;
  }

  void _filterTemplates(String query) {
    setState(() {
      displayedTemplates = templates
          .where((template) => template.key
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<TemplateWidget> _selectedTemplate(int index) async {
    TemplateWidget selected = displayedTemplates[index];
    selected.containerKey = GlobalKey();
    return selected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleziona Template'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: SearchBar(
              hintText: 'Cerca template...',
              onChanged: _filterTemplates,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: displayedTemplates.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              Navigator.pop(
                context,
                await _selectedTemplate(index),
              );
            },
            child: displayedTemplates[index],
          );
        },
      ),
    );
  }
}
