import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/pages/todo_page.dart';
import 'package:todo_application/providers/active_todo_count.dart';
import 'package:todo_application/providers/filtered_todos.dart';
import 'package:todo_application/providers/todo_filter.dart';
import 'package:todo_application/providers/todo_list.dart';
import 'package:todo_application/providers/todo_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoFilter>(
          create: (context) => TodoFilter(),
        ),
        ChangeNotifierProvider<TodoSearch>(
          create: (context) => TodoSearch(),
        ),
        ChangeNotifierProvider<TodoList>(
          create: (context) => TodoList(),
        ),
        // TodoList를 기반으로 ActiveTodoCount를 watch 한다.
        ChangeNotifierProxyProvider<TodoList, ActiveTodoCount>(
          create: (context) => ActiveTodoCount(
              initialCount: context.read<TodoList>().state.todos.length),
          update: (BuildContext context, TodoList todoList,
                  ActiveTodoCount? activeTodoCount) =>
              activeTodoCount!..update(todoList),
        ),
        ChangeNotifierProxyProvider3<TodoFilter, TodoSearch, TodoList,
                FilteredTodos>(
            create: (context) =>
                FilteredTodos(todos: context.read<TodoList>().state.todos),
            update: (BuildContext context,
                    TodoFilter todoFilter,
                    TodoSearch todoSearch,
                    TodoList todoList,
                    FilteredTodos? filteredTodos) =>
                filteredTodos!..update(todoFilter, todoSearch, todoList)),
      ],
      child: MaterialApp(
        title: 'TODOS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodosPage(),
      ),
    );
  }
}
