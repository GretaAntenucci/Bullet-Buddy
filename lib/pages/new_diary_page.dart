import 'package:bullet_buddy/fab/expandable_fab.dart';
import 'package:bullet_buddy/pages/template_menu_page.dart';
import 'package:bullet_buddy/templates/template_widget.dart';
import 'package:bullet_buddy/widgets/custom_action_button.dart';
import 'package:bullet_buddy/widgets/draggable_template.dart';
import 'package:flutter/material.dart';

class NewDiaryPage extends StatefulWidget {
   const NewDiaryPage({super.key});

  @override
  State<NewDiaryPage> createState() => _NewDiaryPageState();
}

class _NewDiaryPageState extends State<NewDiaryPage> {
  List<_TemplatePosition> placedTemplates = [];
  final GlobalKey<FormState> cont = GlobalKey<FormState>();

  bool _checkPosition(
      List<_TemplatePosition> placedTemplates, Offset newPosition) {
    if (placedTemplates.length > 1) {
      for (int i = 0; i < placedTemplates.length; i++) {
        final containerRenderBox = placedTemplates[i]
            .template
            .containerKey
            ?.currentContext!
            .findRenderObject() as RenderBox;
        final templateSize = containerRenderBox.size;

        if (newPosition >= placedTemplates[i].position &&
            newPosition.dx <= placedTemplates[i].position.dx + templateSize.width &&
            newPosition.dy <= placedTemplates[i].position.dy + templateSize.height ||
            newPosition.dx + templateSize.width >= placedTemplates[i].position.dx &&
                newPosition.dy + templateSize.height >= placedTemplates[i].position.dy &&
                newPosition.dx + templateSize.width <= placedTemplates[i].position.dx + templateSize.width &&
                newPosition.dy + templateSize.height <= placedTemplates[i].position.dy + templateSize.height ||
            newPosition.dx >= placedTemplates[i].position.dx &&
                newPosition.dy + templateSize.height >= placedTemplates[i].position.dy &&
                newPosition.dx <= placedTemplates[i].position.dx + templateSize.width &&
                newPosition.dy + templateSize.height <= placedTemplates[i].position.dy + templateSize.height ||
            newPosition.dx + templateSize.width >= placedTemplates[i].position.dx &&
                newPosition.dy >= placedTemplates[i].position.dy &&
                newPosition.dx + templateSize.width <= placedTemplates[i].position.dx + templateSize.width &&
                newPosition.dy <= placedTemplates[i].position.dy + templateSize.height) {
          // print(newPosition.dy);
          // print(placedTemplates[i].top);
          // print(placedTemplates[i].top + templateSize.height);

          return false;
        }
      }
      return true;
    } else {
      return true;
    }
  }

  void _addTemplate(TemplateWidget template) {
    //TODO check position
    setState(() {
      placedTemplates.add(_TemplatePosition(
        template: template,
        key: template.containerKey!,
        position: Offset.zero,
      ));
    });
  }

  Future<void> _updateTemplatePosition(
      DraggableDetails details, _TemplatePosition templatePosition) async {
    final Offset newPosition = details.offset - const Offset(20, 120);

    // Verifica se il drop è avvenuto all'interno del container
    final RenderBox containerRenderBox = cont.currentContext!.findRenderObject() as RenderBox;
    final Size containerSize = containerRenderBox.size;
    final RenderBox templateRenderBox = templatePosition.template.containerKey?.currentContext!.findRenderObject() as RenderBox;
    final Size templateSize = templateRenderBox.size;


    if (newPosition >= Offset.zero &&
        newPosition <=  containerSize &&
        newPosition.dx + templateSize.width >= 0 &&
        newPosition.dy + templateSize.height >= 0 &&
        newPosition.dx + templateSize.width <= containerSize.width &&
        newPosition.dy + templateSize.height <= containerSize.height &&
        newPosition.dx + templateSize.width >= 0 &&
        newPosition.dy >= 0 &&
        newPosition.dx + templateSize.width <= containerSize.width &&
        newPosition.dy <= containerSize.height &&
        newPosition.dx >= 0 &&
        newPosition.dy + templateSize.height >= 0 &&
        newPosition.dx <= containerSize.width &&
        newPosition.dy + templateSize.height <= containerSize.height) {
      if (_checkPosition(placedTemplates, newPosition)) {
setState(() {
      templatePosition.position = newPosition;
    });
      }
    }
  }

  void _navigateToTemplateSelection(BuildContext context) async {
    final selectedTemplate = await Navigator.push<TemplateWidget>(
      context,
      MaterialPageRoute(builder: (context) =>  const TemplateMenuPage()),
    );

    if (selectedTemplate != null) {
      _addTemplate(selectedTemplate);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 240, 219),
        foregroundColor: Colors.purple[900]!,
      ),
        body: DragTarget(builder: (context, candidateData, rejectedData) {
          return Container(
            key: cont,
            margin: const EdgeInsets.all(20),
            color: Colors.deepPurpleAccent,
            child: Stack(
              children: placedTemplates.map((templatePosition) {
                return Positioned(
                  left: templatePosition.position.dx,
                  top: templatePosition.position.dy,
                  child: DraggableTemplate(
                    template: templatePosition.template,
                    onDragEnd: (details) {
                      _updateTemplatePosition(details, templatePosition);
                    },
                  ),
                );
              }).toList(),
            ),
          );
        }),
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
            onPressed: () => _navigateToTemplateSelection(context),
            icon: Icons.pages,
          ),
        ],
      ),

    );
  }
}

class _TemplatePosition {
  TemplateWidget template;
  Offset position;
  GlobalKey key;


  _TemplatePosition({
    required this.template,
    required this.position,
    required this.key,

  });
}
