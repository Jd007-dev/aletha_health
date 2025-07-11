import 'package:aletha_health/Utils/app_colors.dart';
import 'package:aletha_health/models/exercise_model/exercise.dart';
import 'package:aletha_health/screens/exercise/exercise_detail_screen.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key, required this.name, required this.duration, required this.ex});
  final String name;
    final String duration;
        final Exercise ex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Column(
        children: [
          ListTile(
            leading: Container(width: 50,height: 50,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),color:  AppColors.opacBlack.withOpacity(0.30)),
              child: const Icon(Icons.tornado_rounded),
              ),
                              title: Text(name),
                              subtitle: Text(duration),
                             trailing: ex.isCompleted
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ExerciseDetailScreen(exercise: ex),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: Divider(
                                thickness: 1,
                                color:  AppColors.opacBlack.withOpacity(0.30),
                              ),
                            )
        ],
      ),
    );
  }
}