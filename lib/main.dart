import 'package:aletha_health/blocs/exercise_bloc/exercise_bloc.dart';
import 'package:aletha_health/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/exercise_repo/exercise_repository.dart';
void main() {
  runApp(const ExerciseApp());
}

class ExerciseApp extends StatelessWidget {
  const ExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ExerciseRepository(),
      child: BlocProvider(
        create: (context) => ExerciseBloc(context.read<ExerciseRepository>()),
        child: const MaterialApp(
          title: 'Exercise App',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}

