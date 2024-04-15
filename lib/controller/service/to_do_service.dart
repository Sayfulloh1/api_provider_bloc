import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_api_bloc_provider/model/to_do_model.dart';

class ToDoService {
  final String url = 'https://jsonplaceholder.typicode.com/todos/';

  Future<List<ToDoModel>> getToDos() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // final jsonData = jsonDecode(response.body) as List<dynamic>;
        // return jsonData.map((todo) => ToDoModel.fromJson(todo)).toList();
        final List<ToDoModel> todos = toDoModelFromJson(response.body);
        return todos;
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
