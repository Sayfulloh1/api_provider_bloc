import 'package:equatable/equatable.dart';
import 'package:get_api_bloc_provider/model/to_do_model.dart';

// Define your events
abstract class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object?> get props => [];
}

class FetchToDoList extends ToDoEvent {}

