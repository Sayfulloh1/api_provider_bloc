import 'package:flutter/material.dart';
import 'package:get_api_bloc_provider/controller/provider/comment_provider.dart';
import 'package:provider/provider.dart';
import '../controller/provider/to_do_provider.dart';


class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the provider
    final commentProvider = Provider.of<CommentProvider>(context);

    // Use `Consumer` to rebuild the UI when the provider's state changes
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment List'),
      ),
      body: Consumer<CommentProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            // Show loading spinner
            return Center(child: CircularProgressIndicator());
          } else if (provider.errorMessage != null) {
            // Show error message
            return Center(child: Text('Error: ${provider.errorMessage}'));
          } else {
            // Display list of to-do items
            return ListView.builder(
              itemCount: provider.commentList.length,
              itemBuilder: (context, index) {
                final todo = provider.commentList[index];
                return ListTile(
                  title: Text(todo.name),
                  trailing: Text(todo.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
