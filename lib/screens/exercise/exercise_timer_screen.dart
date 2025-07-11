import 'dart:async';
import 'package:aletha_health/Utils/app_colors.dart';
import 'package:aletha_health/blocs/exercise_bloc/exercise_bloc.dart';
import 'package:aletha_health/blocs/exercise_bloc/exercise_event.dart';
import 'package:aletha_health/models/exercise_model/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ExerciseTimerScreen extends StatefulWidget {
  final Exercise exercise;

   const ExerciseTimerScreen({super.key, required this.exercise});

  @override
  _ExerciseTimerScreenState createState() => _ExerciseTimerScreenState();
}

class _ExerciseTimerScreenState extends State<ExerciseTimerScreen> {
  late int remainingSeconds;
  Timer? timer;
@override
void initState() {
  super.initState();
  remainingSeconds = widget.exercise.duration;
  timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    setState(() {
      remainingSeconds--;

      if (remainingSeconds == 0) {
        timer.cancel();
        context.read<ExerciseBloc>().add(MarkExerciseCompleted(widget.exercise.id));
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Completed!'),
            content: Text('${widget.exercise.name} is done.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  });
}


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        foregroundColor: AppColors.backGroundColor,
        title: const Text("Exercise Timer",style: TextStyle(fontSize: 20,color: AppColors.backGroundColor),),backgroundColor:  AppColors.opacBlack),
    
      body: Center(
        child: Column(
          children: [
            Lottie.asset("assets/running.json"),
            Container(
               width: 300,
                height: 150,
                 decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                  AppColors.primaryopacBlack,
                                  AppColors.opacBlack
                                ])
                              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$remainingSeconds',
                    style: const TextStyle(fontSize: 48,color: AppColors.backGroundColor),
                  ),
                   const Text(
              'Sec remaining',
              style: TextStyle(fontSize: 28,color: AppColors.backGroundColor),
            ),
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
