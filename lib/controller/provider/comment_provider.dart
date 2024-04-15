


import 'package:flutter/cupertino.dart';
import 'package:get_api_bloc_provider/controller/service/comment_service.dart';

import '../../model/comment_model.dart';

class CommentProvider extends ChangeNotifier{
  CommentProvider(){
    fetchAllComments();
  }
    CommentService service = CommentService();
    bool _isLoading = false;
    List<CommentModel> _commentList = [];
    String? _errorMessage;

    bool get isLoading => _isLoading;
    List<CommentModel> get commentList => _commentList;
    String? get errorMessage => _errorMessage;

    Future<void> fetchAllComments()async{
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
      try
      {
        final comments = await service.getAllComments();
        _commentList = comments ?? [];
      }
      catch(error){
        _errorMessage =  error.toString();
      }finally
          {
            _isLoading = false;
            notifyListeners();
          }
    }
}