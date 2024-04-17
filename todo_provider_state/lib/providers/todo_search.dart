import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

// String 하나 있는 class를 뭐하러 만들까?
// provider는 기본적으로 type을 기반으로 접근한다.
// 따라서 이렇게 class를 여러개 만든다면 type 충돌을 회피하기 좋다.
class TodoSearchState extends Equatable {
  final String searchTerm;

  const TodoSearchState({
    required this.searchTerm,
  });

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: '');
  }

  @override
  List<Object> get props => [searchTerm];

  @override
  bool get stringify => true;

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

class TodoSearch extends StateNotifier<TodoSearchState> {
  TodoSearch() : super(TodoSearchState.initial());

  void setSearchTerm(String newSearchTerm) {
    state = state.copyWith(searchTerm: newSearchTerm);
  }
}

// class TodoSearch with ChangeNotifier {
//   TodoSearchState _state = TodoSearchState.initial();

//   TodoSearchState get state => _state;

//   void setSearchTerm(String newSearchTerm) {
//     _state = _state.copyWith(searchTerm: newSearchTerm);
//     notifyListeners();
//   }
// }
