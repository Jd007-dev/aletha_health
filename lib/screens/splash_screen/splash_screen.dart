import 'package:aletha_health/Utils/app_colors.dart';
import 'package:aletha_health/Utils/app_path.dart';
import 'package:aletha_health/Utils/app_strings.dart';
import 'package:aletha_health/repositories/exercise_repo/exercise_repository.dart';
import 'package:aletha_health/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (_) => ExerciseRepository(),
            child:  const HomeScreen(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(
            width: 200,
            child: Image.asset(AppPaths.appLogo)),
            const SizedBox(height: 20),
            const Text(
              AppStrings.appName,
              style: TextStyle(
                fontSize: 28,
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
