import 'package:assignment_10/add_todo.dart';
import 'package:assignment_10/todo_model.dart';
import 'package:assignment_10/update_todo_bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todoList = [];

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
            AddTodo(
              onAddTap: (TodoModel) {
                addToDo(todoModel: TodoModel);
              },
            ),
            Expanded(
                flex: 80,
                child: Card(
                  child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final todo = todoList[index];
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
                                                  return UpdateTodoBottomSheet(
                                                    getForTitleDescription:
                                                        todo,
                                                    onUpdateTap: (TodoModel) {
                                                      updateToDo(
                                                          index: index,
                                                          updateToDoModel:
                                                              TodoModel);
                                                    },
                                                  );
                                                });
                                          },
                                          child: Text('Edit')),
                                      TextButton(
                                          onPressed: () {
                                            onDelete(index);
                                          },
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
                            todo.title,
                            style: ThemeData().textTheme.titleMedium,
                          ),
                          subtitle: Text(todo.description),
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

  ///Controller Part Start=======================
  void addToDo({required TodoModel todoModel}) {
    todoList.add(todoModel);
    setState(() {});
  }

  void updateToDo({required index, required TodoModel updateToDoModel}) {
    todoList[index] = updateToDoModel;
    setState(() {});
  }

  void onDelete(int index) {
    todoList.removeAt(index);
    Navigator.pop(context);
    setState(() {});
  }
}
