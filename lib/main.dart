import 'package:flutter/material.dart';
import 'package:get_api_bloc_provider/controller/provider/comment_provider.dart';
import 'package:get_api_bloc_provider/controller/provider/to_do_provider.dart';
import 'package:get_api_bloc_provider/view/comments_screen.dart';
import 'package:get_api_bloc_provider/view/todo_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(  create: (context)=>ToDoProvider(),),
        ChangeNotifierProvider(  create: (context)=>CommentProvider(),),
       ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CommentsScreen(),
      ),
    );
  }
}




