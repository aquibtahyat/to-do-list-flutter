import 'package:flutter/material.dart';
import 'package:myapp/to_do.dart';

showAddDialog(BuildContext context, {Function(Todo todo)? callBack, Todo? todo}){
  return showDialog(context: context, builder:(_){

    TextEditingController titleController = TextEditingController(text: todo?.title);
    TextEditingController descriptionController = TextEditingController(text: todo?.description);

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
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: 'What To Do?',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: descriptionController,
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
            String title = titleController.text.trim();
            String description = descriptionController.text.trim();
            submit(title, description);
            if(callBack!=null) {
              callBack(Todo(title: title, description: description));
            }
            Navigator.pop(context);
          },
          child: const Text('Entry'),
        )
      ],
    );
  });
}

void submit(String title, String description) {
  // Navigator.of(context).pop();

  if (title.isNotEmpty && description.isNotEmpty) {}
}
