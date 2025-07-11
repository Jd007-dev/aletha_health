
#  Aletha Health Exercise Tracker App

A simple, clean, and responsive **Flutter exercise tracking app** built for **Aletha Health**.  
Helps users stay active by fetching workouts from a REST API, showing detailed exercise info, and timing their sessions — built using **Flutter, Dart, Bloc pattern, and custom utility classes for colors, strings, paths, and API management**.

---

##  Features

-  List of exercises fetched from a remote API.
-  Detailed view with description, difficulty, and duration.
-  Interactive timer for each exercise.
-  Local marking of completed exercises.
-  Bloc state management for clean and scalable architecture.
-  Centralized app theme, string, and API management via utilities.
-  Responsive and intuitive UI.
-  Graceful error handling for network/API issues.

---

##  Tech Stack

- **Flutter & Dart**
- **flutter_bloc** for state management
- **http** for API integration
- Custom utility classes for app constants, colors, strings, and asset paths

---

##  Project Structure

```
/assets
  aletha_health_logo.png
  background_vector.png
  running.json
  user_lottie.json

/lib
 ├── blocs/
 │    └── exercise_bloc/
 │         ├── exercise_bloc.dart
 │         ├── exercise_event.dart
 │         └── exercise_state.dart
 │
 ├── models/
 │    └── exercise_model/
 │         └── exercise.dart
 │
 ├── repositories/
 │    └── exercise_repo/
 │         └── exercise_repository.dart
 │
 ├── screens/
 │    ├── exercise/
 │    │     ├── exercise_detail_screen.dart
 │    │     ├── exercise_timer_screen.dart
 │    ├── home/
 │    │     └── home_screen.dart
 │    └── splash_screen/
 │          └── splash_screen.dart
 │
 ├── utils/
 │    ├── api_urls.dart
 │    ├── app_colors.dart
 │    ├── app_path.dart
 │    └── app_strings.dart
 │
 ├── widgets/
 │    └── exercise_card.dart
 │
 └── main.dart
```

---

##  Utility Classes Overview

###  App Colors (`utils/app_colors.dart`)
```dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color backGroundColor = Colors.white;
  static const Color primaryTextColor = Colors.black;
  static const Color primaryopacBlack = Color(0xff202021);
  static const Color opacBlack = Color(0xff404041);
}
```

###  App Strings (`utils/app_strings.dart`)
```dart
class AppStrings {
  static const String appName = "Aletha Health";
}
```

###  App Asset Paths (`utils/app_path.dart`)
```dart
class AppPath {
  static const String logo = "assets/aletha_health_logo.png";
  static const String background = "assets/background_vector.png";
  static const String runningAnimation = "assets/running.json";
  static const String userAnimation = "assets/user_lottie.json";
}
```

###  API URLs (`utils/api_urls.dart`)
```dart
class ApiUrls {
  static const String baseUrl = "https://68252ec20f0188d7e72c394f.mockapi.io/dev/";
  static const String workoutList = "${baseUrl}workouts";
}
```

---

##  Code Highlights

- **Bloc Events:** `FetchExercises`, `MarkExerciseCompleted`
- **Bloc States:** `ExerciseInitial`, `ExerciseLoading`, `ExerciseLoaded`, `ExerciseError`
- **Bloc Logic:** Fetch exercises, mark as completed, handle errors gracefully
- **Timer Screen:** Triggers completion dialog and marks the exercise completed via Bloc event

---

##  How to Run

 Clone the repository:
```bash
git clone https://github.com/Jd007-dev/aletha_health.git
cd aletha_health
```

 Install dependencies:
```bash
flutter pub get
```

 Run the app:
```bash
flutter run
```

---

##  Future Improvements

-  Add a continuous workout streak/progress tracker.
-  Local storage for persistent exercise completion data.
-  Integrate animations and a full Figma-based UI theme.
-  Push notifications/reminders for workouts.
-  User profiles and custom workout plans.

---


