// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'package:todo_provider_state/model/todo_model.dart';
import 'package:todo_provider_state/providers/providers.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;
  const FilteredTodosState({
    required this.filteredTodos,
  });

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(filteredTodos: []);
  }

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filteredTodos];
}

class FilteredTodos extends StateNotifier<FilteredTodosState>
    with LocatorMixin {
  FilteredTodos() : super(FilteredTodosState.initial()); // read 해서 변경 필요

  @override
  void update(Locator watch) {
    final Filter filter = watch<TodoFilterState>().filter;
    final String searchTerm = watch<TodoSearchState>().searchTerm;
    final List<Todo> todos = watch<TodoListState>().todos;

    List<Todo> filteredTodos;

    switch (filter) {
      case Filter.active:
        filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        filteredTodos = todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        filteredTodos = todos;
    }

    if (searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }

    state = state.copyWith(filteredTodos: filteredTodos);

    super.update(watch);
  }
}


// class FilteredTodos with ChangeNotifier {
//   late FilteredTodosState _state;
//   late List<Todo> todos;

//   FilteredTodos({
//     required this.todos,
//   }) {
//     _state = FilteredTodosState(filteredTodos: todos);
//   }

//   FilteredTodosState get state => _state;

//   void update(
//     TodoFilter todoFilter,
//     TodoSearch todoSearch,
//     TodoList todoList,
//   ) {
//     List<Todo> filteredTodos;

//     switch (todoFilter.state.filter) {
//       case Filter.active:
//         filteredTodos =
//             todoList.state.todos.where((Todo todo) => !todo.completed).toList();
//         break;
//       case Filter.completed:
//         filteredTodos =
//             todoList.state.todos.where((Todo todo) => todo.completed).toList();
//         break;
//       case Filter.all:
//       default:
//         filteredTodos = todoList.state.todos;
//     }

//     if (todoSearch.state.searchTerm.isNotEmpty) {
//       filteredTodos = filteredTodos
//           .where((Todo todo) => todo.desc
//               .toLowerCase()
//               .contains(todoSearch.state.searchTerm.toLowerCase()))
//           .toList();
//     }

//     _state = _state.copyWith(filteredTodos: filteredTodos);

//     // print(_state);

//     notifyListeners();
//   }
// }
