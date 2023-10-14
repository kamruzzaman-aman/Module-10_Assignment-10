import 'package:assignment_10/todo_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpdateTodoBottomSheet extends StatefulWidget {
  TodoModel getForTitleDescription;
  final Function(TodoModel) onUpdateTap;
  UpdateTodoBottomSheet({super.key, required this.getForTitleDescription, required this.onUpdateTap});

  @override
  State<UpdateTodoBottomSheet> createState() => _UpdateTodoBottomSheetState();
}

class _UpdateTodoBottomSheetState extends State<UpdateTodoBottomSheet> {
  late TextEditingController updateTETitle = TextEditingController(text: widget.getForTitleDescription.title);

  late TextEditingController updateTEDescription = TextEditingController(text: widget.getForTitleDescription.description);

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20.0,
              right: 20.0,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: updateTETitle,
                  decoration: InputDecoration(
                      hintText: 'Update Title', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a title';
                    }
                    return null;
                  },
                ),
              ),
              TextFormField(
                controller: updateTEDescription,
                decoration: InputDecoration(
                    hintText: 'Update Description', border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a description';
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                  String title = updateTETitle.text;
                  String description = updateTEDescription.text;
                  TodoModel updateToDoModelInstance = TodoModel(title, description);
                  widget.onUpdateTap(updateToDoModelInstance);
                  Navigator.pop(context);
                }
                    },
                    child: Text('Edit Done')),
              ),
            ],
          )),
    );
  }
}
