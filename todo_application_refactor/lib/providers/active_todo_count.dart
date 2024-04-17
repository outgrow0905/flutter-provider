// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:todo_application_refactor/model/todo_model.dart';
import 'package:todo_application_refactor/providers/todo_list.dart';

class ActiveTodoCountState extends Equatable {
  final int count;

  const ActiveTodoCountState({required this.count});

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(count: 0);
  }

  ActiveTodoCountState copyWith({
    int? count,
  }) {
    return ActiveTodoCountState(
      count: count ?? this.count,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [count];
}

class ActiveTodoCount {
  final TodoList todoList;

  ActiveTodoCount({required this.todoList});

  ActiveTodoCountState get state => ActiveTodoCountState(
      count: todoList.state.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length);
}
