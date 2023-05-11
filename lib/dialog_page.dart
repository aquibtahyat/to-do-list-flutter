import 'package:flutter/material.dart';
import 'common/dialog.dart';
import 'to_do.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  List<Todo> todo = List.empty(growable: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.alarm_add),
            SizedBox(
              width: 5,
            ),
            Text('TO DO LIST'),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            todo.isEmpty
                ? const Text(
                    'Nothing to do...',
                    style: TextStyle(fontSize: 25),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: todo.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.add),
        onPressed: () {
          showAddDialog(context, callBack: (value) {
            todo.add(value);
            setState(() {});
          });
        },
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.add_task),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo[index].title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(todo[index].description),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    showAddDialog(context, callBack: (value) {
                      todo[index].description = value.description;
                      todo[index].title = value.description;
                      setState(() {
                      });
                    }, todo: todo[index]);
                  },
                  child: const Icon(Icons.edit)),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      todo.removeAt(index);
                    });
                  },
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}

//   void submit() {
//     Navigator.of(context).pop();
//     String title = titlecontroller.text.trim();
//     String description = descriptioncontroller.text.trim();
//     if (title.isNotEmpty && description.isNotEmpty) {
//       debugPrint(title);
//       setState(() {
//         titlecontroller.text = '';
//         descriptioncontroller.text = '';
//         todo.add(Todo(title: title, description: description));
//       });
//     }
//   }
// }
