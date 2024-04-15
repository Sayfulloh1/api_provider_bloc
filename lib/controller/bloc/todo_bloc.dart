import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_api_bloc_provider/controller/bloc/todo_event.dart';
import 'package:get_api_bloc_provider/controller/bloc/todo_state.dart';
import 'package:get_api_bloc_provider/controller/service/to_do_service.dart';


class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final ToDoService toDoService;

  ToDoBloc(this.toDoService) : super(ToDoInitial()) {
    on<FetchToDoList>(_fetchToDoList);
  }

  Future<void> _fetchToDoList(FetchToDoList event, Emitter<ToDoState> emit) async {
    emit(ToDoLoading());
    try {
      final todos = await toDoService.getToDos();
      emit(ToDoSuccess(todos));
    } catch (e) {
      emit(ToDoFailure(e.toString()));
    }
  }
}
