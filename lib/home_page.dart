import 'package:flutter/material.dart';
import 'package:myapp/to_do.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  List<Todo> todo = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do List'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: titlecontroller,
              decoration: const InputDecoration(
                  hintText: 'What To Do?',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: descriptioncontroller,
              maxLength: 50,
              decoration: const InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 15,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // String title = titlecontroller.text.trim();
                      // String description = descriptioncontroller.text.trim();
                      // if (title.isNotEmpty && description.isNotEmpty) {
                      //   debugPrint(title);
                      //   setState(() {
                      //     titlecontroller.text = '';
                      //     descriptioncontroller.text = '';
                      //     todo.add(
                      //         Todo(title: title, description: description));
                      //   });
                      // }
                    },
                    child: const Text('Entry')),
                ElevatedButton(
                  onPressed: () {
                    // String title = titlecontroller.text.trim();
                    // String description = descriptioncontroller.text.trim();
                    // if (title.isNotEmpty && description.isNotEmpty) {
                    //   debugPrint(title);
                    //   setState(() {
                    //     titlecontroller.text = '';
                    //     descriptioncontroller.text = '';
                    //     todo[selectedIndex].title = title;
                    //     todo[selectedIndex].description = description;
                    //     selectedIndex = -1;
                    //   });
                    // }
                  },
                  child: const Text('Update'),
                )
              ],
            ),
          ],
        ),
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
                    titlecontroller.text = todo[index].title;
                    descriptioncontroller.text = todo[index].description;
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: const Icon(Icons.edit)),
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
