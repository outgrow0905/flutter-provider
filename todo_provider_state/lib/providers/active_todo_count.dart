// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:todo_provider_state/model/todo_model.dart';
import 'package:todo_provider_state/providers/todo_list.dart';

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

class ActiveTodoCount extends StateNotifier<ActiveTodoCountState>
    with LocatorMixin {
  ActiveTodoCount() : super(ActiveTodoCountState.initial());

  @override
  void update(Locator watch) {
    final List<Todo> todos = watch<TodoListState>().todos;

    state = state.copyWith(
        count: todos.where((Todo todo) => !todo.completed).toList().length);

    super.update(watch);
  }
}
