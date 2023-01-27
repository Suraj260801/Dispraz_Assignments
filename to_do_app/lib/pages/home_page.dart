import  'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/to_do_database.dart';
import 'package:to_do_app/utils/dialog_box.dart';

import '../utils/to_do_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage> {

  //create hive instance
  final _myBox=Hive.box('mybox');
  //create local db instance
  ToDoDatabase db=ToDoDatabase();

  //controller for getting task from dialog box
  final _controller=TextEditingController();

  @override
  void initState() {

    if(_myBox.get('TODOLIST')==null){
      db.createInitialData();
    }else {
      db.loadData();
    }
    super.initState();
  }
  
  void checkBoxChanged(bool? value,int index){
    setState((){
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  void saveNewTask(){
     setState(() {
       db.toDoList.add([_controller.text,false]);
       _controller.clear();
     });
     Navigator.of(context).pop();
     db.updateDataBase();
  }
  void createNewTask()
  {
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: ()=>Navigator.of(context).pop(),
          );
        },
    );
  }

//to update existing task
void updateTask(int index) async{
  await showDialog(
    context: context,
    builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: (){
          db.toDoList.add(db.toDoList[index]);
          Navigator.of(context).pop();
        },
      );
    },
  );
    setState(() {
      db.toDoList.removeAt(index);
    });

    //updating changes to local database
    db.updateDataBase();
}

 void deleteTask(int index)
 {
   setState(() {
     db.toDoList.removeAt(index);
   });

   //deleting changes from local database
   db.updateDataBase();

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[400],
      appBar: AppBar(
        title: const Center(
            child: Text('To Do App'),
        ),
        elevation: 4.0,
        backgroundColor: Colors.pink[300],
      ),
      body:ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value)=>checkBoxChanged(value,index),
              deleteFunction: (context)=>deleteTask(index),
              onTapped:()=>updateTask(index),
          );
        },
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
         backgroundColor: Colors.pink[300],
         child: const Icon(
           Icons.add,
           color: Colors.white,
           size: 30.0,
         ),
          
      ),

    );
  }
}
