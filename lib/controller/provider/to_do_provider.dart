import 'package:flutter/material.dart';
import 'package:get_api_bloc_provider/controller/service/to_do_service.dart';

import '../../model/to_do_model.dart';


class ToDoProvider extends ChangeNotifier{
  ToDoProvider(){
    fetchAllTodo();
  }
  final ToDoService _service = ToDoService();
  List<ToDoModel> _toDoList = [];
  bool _isLoading = true;
  String? _errorMessage;

  List<ToDoModel>? get toDoList => _toDoList;
  bool get isLoading => _isLoading;
  String? get  errorMessage => _errorMessage;

  Future<void> fetchAllTodo() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final todos = await _service.getToDos();
      _toDoList = todos ?? []; // Handle potential null value safely
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}