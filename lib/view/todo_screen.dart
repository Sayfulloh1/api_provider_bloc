import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider/to_do_provider.dart';


class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the provider
    final toDoProvider = Provider.of<ToDoProvider>(context);

    // Use `Consumer` to rebuild the UI when the provider's state changes
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Consumer<ToDoProvider>(
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
              itemCount: provider.toDoList!.length,
              itemBuilder: (context, index) {
                final todo = provider.toDoList![index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {
                      // Handle checkbox state change if needed
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
