import 'package:bloc/bloc.dart';
import 'package:day_eight_test/features/todos/data/task_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  List<TaskData> todos = [] ;
  TodoCubit() : super(TodoInitial());

  void addTodo( String newTodo ){
    todos.add(TaskData(taskTitle: newTodo)) ;
    emit(TodoAdd()) ;
  }

  void changeCheckState (int index ) {
    todos[index].isChecked = ! (todos[index].isChecked);
    emit(TodoCheck());
  }

  void deleteTask ( int index ) {
    todos.removeAt(index);
    emit(TodoDelete());
  }

  void editTodo ( String newTodo , int index ) {
    todos[index].taskTitle = newTodo ;
  }
}


