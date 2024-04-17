// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:todo_application/model/todo_model.dart';
import 'package:todo_application/providers/todo_list.dart';

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

class ActiveTodoCount with ChangeNotifier {
  late ActiveTodoCountState _state;
  final int initialCount;

  ActiveTodoCount({
    required this.initialCount,
  }) {
    _state = ActiveTodoCountState(count: initialCount);
  }

  ActiveTodoCountState get state => _state;

  void update(TodoList todoList) {
    // print(todoList.state);
    final int newActiveTodoCount = todoList.state.todos
        .where((Todo todo) => !todo.completed)
        .toList()
        .length;

    _state = _state.copyWith(count: newActiveTodoCount);

    notifyListeners();
  }
}
