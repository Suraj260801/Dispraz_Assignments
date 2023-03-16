import  'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  final VoidCallback onTapped;

   const ToDoTile({
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
                     backgroundColor: Colors.blueGrey.shade600,
                 )
            ]
        ),
        child: InkWell(
          onTap: onTapped,
          child: Container(
            height: 80.0,
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 2.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade400,
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
                    maxLines: 3,
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
