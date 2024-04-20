import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/config/routes/router.dart';
import 'package:mobile/config/theme/app_theme.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_bloc.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_event.dart';
import 'package:mobile/features/idea/presentation/pages/on_boarding.dart';
import 'package:mobile/injection.container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalIdeaBloc> (
      create:  (context) => sl<LocalIdeaBloc>()..add(const GetIdea()),
      child: MaterialApp(
        title: 'Idea Note',
        theme: theme(),
        home: const OnBoarding(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: "/",
      ),
    );
  }
}

