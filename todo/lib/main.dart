import 'package:flutter/material.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO-DO List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TO-DO List'),
        ),
      ),
    );
  }
}

class ToDoList extends StatefulWidget {

  @override 
  createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  List<String> _todoItems = []; // to store todo items,

  // this will be called everytime + is pressed
  void _addTodoItem(String task) {
    // puting code inside "setstate" tells the app our state has changed -
    //and it will automatically re-render the list
    if(task.length > 0) {
      setState(() {
        _todoItems.add(task);
      });
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  void _promptRemoveTodoItem(int index) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mark "${_todoItems[index]}" as done?'),
          actions: <Widget> [
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop() //to remove
            ),
            FlatButton(
              child: Text('MARK AS DONE'),
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  // build the list of todo items

  Widget _buildTodoList() {

    return ListView.builder(
      itemBuilder: (context, index) {
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      }
      );
  }

  // build a singlr todo item

  Widget _buildTodoItem(String todoText, int index) {
    //A single fixed-height row that typically contains some text 
    //as well as a leading or trailing icon.
    return ListTile(
      title: Text(todoText),
      onTap: () => _promptRemoveTodoItem(index),
    );
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('TO-DO List'),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushAddTodoScreen, // pointer to the _addTodoItem()
        tooltip: 'Add Task',
        child: Icon(Icons.add),
        ),
    );
  }

  void _pushAddTodoScreen() {
    // push this page onto the stack
    Navigator.of(context).push(
      // MaterialpageRoute will automatically animate the scrren entry, and
      //also add a back button to close it
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Add a new task'),
            ),
            body: TextField(
              autofocus: true, // if true then the keyboard will appear as soon as the control
              //goes to the page, if it is false then we have ti click the textfield to access the keyboard
              onSubmitted: (val) {
                _addTodoItem(val);
                Navigator.pop(context); // close the add todo screen
              },
              decoration: InputDecoration(
                hintText: 'Enter something to add..',
                contentPadding: const EdgeInsets.all(16.0),
              ),

            ),
          );
        },
      ),
    );
  }
}