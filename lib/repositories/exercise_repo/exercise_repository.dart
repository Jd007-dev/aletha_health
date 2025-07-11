import 'dart:convert';
import 'package:aletha_health/Utils/api_urls.dart';
import 'package:aletha_health/models/exercise_model/exercise.dart';
import 'package:http/http.dart' as http;

class ExerciseRepository {


  Future<List<Exercise>> fetchExercises() async {
    final response = await http.get(Uri.parse(AppUrls.getExericse));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => Exercise.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load exercises');
    }
  }
}
