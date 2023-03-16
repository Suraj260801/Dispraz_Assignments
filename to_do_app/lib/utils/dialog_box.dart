import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String oldTask;
  final bool isUpdate;
  final _formKey = GlobalKey<FormState>();

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.oldTask,
    required this.isUpdate,
  });

  @override
  Widget build(BuildContext context) {
    isUpdate ? controller.text = oldTask : "";
    return AlertDialog(
      backgroundColor: Colors.blueGrey.shade300,
      content: SizedBox(
        height: 130.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: controller,
                validator: (val) {
                  if (val == null) {
                    return "Required";
                  } else if (val.length > 50) {
                    return "Max allowed length exceeded.";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new task',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                //save button
                MyButton(
                    text: 'Save',
                    onPressed: () {
                      onSave();
                    }),
                const SizedBox(
                  width: 2.0,
                ),

                //cancel button
                MyButton(
                    text: 'Cancel',
                    onPressed: () {
                      onCancel();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
