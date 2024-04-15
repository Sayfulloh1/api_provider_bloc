// Define your states
import 'package:equatable/equatable.dart';

import '../../model/to_do_model.dart';

abstract class ToDoState extends Equatable {
  const ToDoState();

  @override
  List<Object?> get props => [];
}

class ToDoInitial extends ToDoState {}

class ToDoLoading extends ToDoState {}

class ToDoSuccess extends ToDoState {
  final List<ToDoModel> toDoList;

  const ToDoSuccess(this.toDoList);

  @override
  List<Object?> get props => [toDoList];
}

class ToDoFailure extends ToDoState {
  final String error;

  const ToDoFailure(this.error);

  @override
  List<Object?> get props => [error];
}
