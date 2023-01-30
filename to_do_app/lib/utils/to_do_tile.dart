import  'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  VoidCallback onTapped;

   ToDoTile({
     super.key,
     required this.taskName,
     required this.taskCompleted,
     required this.onChanged,
     required this.deleteFunction,
     required this.onTapped,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion:const StretchMotion(),
            children:[
                 SlidableAction(
                     onPressed: deleteFunction,
                     icon:Icons.delete,
                     backgroundColor: Colors.pink.shade200,
                 )
            ]
        ),
        child: InkWell(
          onTap: onTapped,
          child: Container(
            height: 70.0,
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 2.0),
            decoration: BoxDecoration(
              color: Colors.blue.shade400,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(

              children: [
                Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Colors.black,
                ),
                Flexible(

                  child: Text(
                      taskName,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      decoration:taskCompleted? TextDecoration.lineThrough:TextDecoration.none,

                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
