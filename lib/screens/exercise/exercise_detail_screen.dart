import 'package:aletha_health/Utils/app_colors.dart';
import 'package:aletha_health/models/exercise_model/exercise.dart';
import 'package:flutter/material.dart';
import 'exercise_timer_screen.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.backGroundColor,
        title: Text(exercise.name,style: const TextStyle(fontSize: 20,color: AppColors.backGroundColor),),backgroundColor:  AppColors.opacBlack),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Container(
                width: 300,
                height: 250,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Exercise Details',style: TextStyle(color: AppColors.backGroundColor,fontSize: 25),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Description: ${exercise.description}',style: const TextStyle(color: AppColors.backGroundColor),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Duration: ${exercise.duration} seconds',style: const TextStyle(color: AppColors.backGroundColor),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Difficulty: ${exercise.difficulty}',style: const TextStyle(color: AppColors.backGroundColor),),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text('Start',style: TextStyle(color: AppColors.opacBlack),),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ExerciseTimerScreen(exercise: exercise),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
