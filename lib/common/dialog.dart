import 'package:flutter/material.dart';

@immutable
class AddTodoDialog extends StatelessWidget {
  final String? title;
  AddTodoDialog({super.key, this.title = ""});
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // titlecontroller = TextEditingController(text: title);
    return AlertDialog(
      insetPadding: const EdgeInsets.all(35),
      contentPadding: const EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: titlecontroller,
              decoration: const InputDecoration(
                  hintText: 'What To Do?',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: descriptioncontroller,
              maxLength: 50,
              decoration: const InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            String title = titlecontroller.text.trim();
            String description = descriptioncontroller.text.trim();
            submit(title, description);
          },
          child: const Text('Entry'),
        )
      ],
    );
  }
}

void submit(String title, String description) {
  // Navigator.of(context).pop();

  if (title.isNotEmpty && description.isNotEmpty) {}
}
