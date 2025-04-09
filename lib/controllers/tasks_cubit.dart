import 'package:bloc_cubit/models/tasks_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  addTask(String title) {
    final model = TasksModel(id: Uuid().v4(), title: title, isCompleted: false);
    emit(UpdateTasks([...state.tasks, model]));
  }

  removeTask(String id) {
    final List<TasksModel> newList =
        state.tasks.where((task) => task.id != id).toList();
    emit(UpdateTasks(newList));
  }

  toggleTask(String id) {
    final List<TasksModel> newList =
        state.tasks.map((task) {
          return task.id == id
              ? task.copyWith(isCompleted: !task.isCompleted)
              : task;
        }).toList();
    emit(UpdateTasks(newList));
  }
}
