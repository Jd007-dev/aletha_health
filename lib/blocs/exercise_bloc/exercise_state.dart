
import 'package:aletha_health/models/exercise_model/exercise.dart';

abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseLoaded extends ExerciseState {
  final List<Exercise> exercises;
  ExerciseLoaded(this.exercises);
}

class ExerciseError extends ExerciseState {
  final String message;
  ExerciseError(this.message);
}
