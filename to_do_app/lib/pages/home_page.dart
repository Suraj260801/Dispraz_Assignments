import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/to_do_database.dart';
import 'package:to_do_app/utils/dialog_box.dart';

import '../utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> more = ['categories', 'imp'];
  String? value;

  //create hive instance
  final _myBox = Hive.box('mybox');

  //create local db instance
  ToDoDatabase db = ToDoDatabase();

  //controller for getting task from dialog box
  final _controller = TextEditingController();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(bool isCompleted, bool isUpdated, int index) {
    setState(() {
      if (isUpdated == true) {
        db.toDoList[index][0] = _controller.text;
        db.toDoList[index][1] = isCompleted;
      } else {
        db.toDoList.add([_controller.text, isCompleted]);
      }
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () => saveNewTask(false, false, 0),
          onCancel: () =>
              Navigator.of(context).pop(), //isUpdate: null, oldTask: '',
        );
      },
    );
  }

//to update existing task
  void updateTask(int index) async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          isUpdate: true,
          oldTask: db.toDoList[index][0],
          onSave: () => saveNewTask(db.toDoList[index][1], true, index),
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );

    //updating changes to local database
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });

    //deleting changes from local database
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: const Center(
          child: Text('To Do App'),
        ),
        elevation: 4.0,
        backgroundColor: Colors.blue.shade400,
        actions: [
          DropdownButton<String>(
            icon: Icon(Icons.more_vert,color: Colors.white,),
            items: more
                .map((String item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: (value) {
              this.value = value;
              switch (this.value) {
                case 'categories':
                  Navigator.pushNamed(context, '/categories');
                  break;
                case 'imp':
                  Navigator.pushNamed(context, '/imp');
                  break;
              }
            },
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.blue.shade200,
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 50.0,
              ),
              Text('Suraj Suryawanshi',style: TextStyle(fontSize: 20.0),),
              Divider(height: 20.0,thickness: 2.0,color: Colors.blue,indent: 20.0,endIndent: 20.0,),
              Builder(
                builder: (context) {
                  return IconButton(
                      onPressed: (){
                        Scaffold.of(context).closeDrawer();
                      },
                      icon: Icon(Icons.arrow_back)
                  );
                }
              )

            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            onTapped: () => updateTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blue[400],
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> createList(List<String> more) {
    List<DropdownMenuItem<String>>? list = [];
    for (int i = 0; i < more.length; i++) {
      list.add(DropdownMenuItem(child: Text(more[i])));
    }
    return list;
  }
}
