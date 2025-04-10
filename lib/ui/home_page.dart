import 'package:bloc_cubit/controllers/tasks_bloc.dart';
import 'package:bloc_cubit/controllers/tasks_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  final TextEditingController textEditingController = TextEditingController();

  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocProvider(
        create: (context) => TasksBloc(),
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            final controller = context.read<TasksBloc>();
            return Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(hintText: 'Add Your Task'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.isEmpty) return;
                    controller.add(AddTaskEvent(textEditingController.text));
                    // textEditingController.clear();
                  },
                  child: Text('Add'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(state.tasks[index].title),
                        leading: Checkbox(
                          value: state.tasks[index].isCompleted,
                          onChanged: (value) {
                            controller.add(
                              ToggleTaskEvent(state.tasks[index].id),
                            );
                          },
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            controller.add(
                              RemoveTaskEvent(state.tasks[index].id),
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
