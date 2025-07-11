import 'package:aletha_health/Utils/app_colors.dart';
import 'package:aletha_health/Utils/app_strings.dart';
import 'package:aletha_health/blocs/exercise_bloc/exercise_bloc.dart';
import 'package:aletha_health/blocs/exercise_bloc/exercise_event.dart';
import 'package:aletha_health/blocs/exercise_bloc/exercise_state.dart';
import 'package:aletha_health/widgets/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExerciseBloc>().add(FetchExercises());

    return Scaffold(
      body: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          if (state is ExerciseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExerciseLoaded) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width:double.infinity,
                        height: 210,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          gradient: LinearGradient(
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
                          Padding(
                            padding: const EdgeInsets.only(top:70.0,left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColors.backGroundColor,
                                        borderRadius: BorderRadius.circular(50)),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            height: 42,
                                            child: Lottie.asset("assets/user_lottie.json",)),
                                        ],
                                      )),
                                  const SizedBox(width: 250,),
                                  
                                  const Icon(Icons.notifications_active_outlined,color: AppColors.backGroundColor,size: 28,),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.menu_rounded,color: AppColors.backGroundColor,size: 28,),
                                    )
                                  ],
                                ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Hi John,",style: TextStyle(color: AppColors.backGroundColor,fontSize: 25),),
                                  ),
                                   const Padding(
                                    padding: EdgeInsets.symmetric(horizontal:8.0),
                                    child: Text("Welcome to ${AppStrings.appName}",style: TextStyle(color: AppColors.backGroundColor,fontSize: 15),),
                                  )
                              ],
                            ),
                          ),
                        ]),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.exercises.length,
                        itemBuilder: (context, index) {
                          final ex = state.exercises[index];
                          return ExerciseCard(
                            name:ex.name,
                            duration: '${ex.duration} sec',
                            ex: ex,
                    
                          );
                        },
                      ),
                    ],
                  ),
                ),
                IgnorePointer(child: Image.asset("assets/background_vector.png"))
              ],
            );
          } else if (state is ExerciseError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
