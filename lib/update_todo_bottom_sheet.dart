import 'package:flutter/material.dart';

class UpdateTodoBottomSheet extends StatefulWidget {
  const UpdateTodoBottomSheet({super.key});

  @override
  State<UpdateTodoBottomSheet> createState() => _UpdateTodoBottomSheetState();
}

class _UpdateTodoBottomSheetState extends State<UpdateTodoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                decoration: InputDecoration(
                    hintText: 'Update Title', border: OutlineInputBorder()),
              ),
            ),
            
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Update Title', border: OutlineInputBorder()),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: () {},
                  child: Text('Edit Done')),
            ),
          ],
        ));
  }
}
