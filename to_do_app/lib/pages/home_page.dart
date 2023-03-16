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
  final ToDoDatabase db=ToDoDatabase();

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
  void saveNewTask(int index,bool isUpdate){
     setState(() {
       if(isUpdate){
         db.toDoList[index][0]=_controller.text;
       }else{
         db.toDoList.add([_controller.text,false]);
       }
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
            onSave: ()=>saveNewTask(0,false),
            oldTask: "",
            isUpdate:false,
            onCancel: (){Navigator.of(context).pop();_controller.clear();},
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
        onSave: ()=>saveNewTask(index,true),
        oldTask:db.toDoList[index][0],
        isUpdate:true,
        onCancel: (){
          Navigator.of(context).pop();
        },
      );
    },
  );
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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Center(
            child: Text('To Do App'),
        ),
        elevation: 4.0,
        backgroundColor: Colors.blueGrey.shade500,
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
         backgroundColor: Colors.blueGrey,
         child: const Icon(
           Icons.add,
           color: Colors.white,
           size: 30.0,
         ),
          
      ),

    );
  }
}
