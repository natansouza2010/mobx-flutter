import 'package:flutter/material.dart';
import 'package:primeiroapp/stores/todo.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'models/todo.model.dart';



final todoStore = TodoStore();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_)=> Text(todoStore.todos.length.toString())),
        ),
      body: Container(
        child: Observer(
          builder: (_)=> ListView.builder(
            itemCount: todoStore.todos.length,
            itemBuilder: (context, index) {
              var todo = todoStore.todos[index];
              return Text(todo.title);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton( onPressed: (){
        var todo = new Todo(1, "Testando", false);
        todoStore.add(todo);
      },child: Icon(Icons.add),),
    ));
  }
}