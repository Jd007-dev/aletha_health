import 'package:aletha_health/repositories/exercise_repo/exercise_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'exercise_event.dart';
import 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository repository;

  ExerciseBloc(this.repository) : super(ExerciseInitial()) {
    on<FetchExercises>((event, emit) async {
      emit(ExerciseLoading());
      try {
        final exercises = await repository.fetchExercises();
        emit(ExerciseLoaded(exercises));
      } catch (e) {
        emit(ExerciseError(e.toString()));
      }
    });

    on<MarkExerciseCompleted>((event, emit) {
      if (state is ExerciseLoaded) {
        final updatedExercises = (state as ExerciseLoaded).exercises.map((e) {
          if (e.id == event.id) e.isCompleted = true;
          return e;
        }).toList();
        emit(ExerciseLoaded(updatedExercises));
      }
    });
  }
}
