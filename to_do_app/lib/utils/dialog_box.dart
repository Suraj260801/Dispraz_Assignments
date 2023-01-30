import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;
  bool? isUpdate;
  String? oldTask;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    this.isUpdate,
    this.oldTask,
  });

  @override
  Widget build(BuildContext context) {
    isUpdate == true ? controller.text = oldTask : "";
    return AlertDialog(
      backgroundColor: Colors.blue.shade100,
      content: Container(
        height: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                //save button
                MyButton(text: 'Save', onPressed: onSave),
                const SizedBox(
                  width: 2.0,
                ),

                //cancel button
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
