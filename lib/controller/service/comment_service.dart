import 'package:http/http.dart' as http;

import 'package:get_api_bloc_provider/model/comment_model.dart';

class CommentService{
  final String url = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<CommentModel>> getAllComments()async{
    try{
      final response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        return commentModelFromJson(response.body);
      }else{
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    }catch(error){
      throw Exception('Failed to fetch data: $error');
    }
  }
}