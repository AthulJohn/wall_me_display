import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:wall_me/presentation/screens/workshop.dart';

// import 'global_functions.dart';
// import 'logic/bloc/notes/notes_bloc.dart';
// import 'navigator_generator.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'route_generator.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wall.me',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
