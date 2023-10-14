import 'package:assignment_10/todo_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTodo extends StatelessWidget {
  final Function(TodoModel) onAddTap;
  AddTodo({super.key, required this.onAddTap});

  TextEditingController addTETitle = TextEditingController();
  TextEditingController addTEDescription = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: addTETitle,
            decoration: InputDecoration(
                hintText: 'Add Title', border: OutlineInputBorder()),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter a title';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: addTEDescription,
            decoration: InputDecoration(
                hintText: 'Add description', border: OutlineInputBorder()),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter a description';
              }
              return null;
            },
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  String title = addTETitle.text;
                  String description = addTEDescription.text;
                  TodoModel todoModelInstance = TodoModel(title, description);
                  onAddTap(todoModelInstance);
                }
              },
              child: Text('Add')),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
