import 'package:assignment_10/update_todo_bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Add Title', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Add description', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () {},
                child: Text('Add')),
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 80,
                child: Card(
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    actionsAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                          Navigator.pop(context);
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                                context: context,
                                                builder: (_) {
                                                  return UpdateTodoBottomSheet();
                                                });
                                          },
                                          child: Text('Edit')),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text('Delete'))
                                    ],
                                  );
                                });
                          },
                          tileColor: Color.fromARGB(255, 220, 220, 220),
                          leading: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                          title: Text(
                            'title 1',
                            style: ThemeData().textTheme.titleMedium,
                          ),
                          subtitle: Text('this is a subtitle'),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
