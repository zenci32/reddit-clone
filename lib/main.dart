import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/views/home_view.dart';
import 'dart:developer' as devtools show log;

void main() {
  BlocOverrides.runZoned(
      () => runApp(
            const MyApp(),
          ),
      blocObserver: RedditBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomeView(),
    );
  }
}

class RedditBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    "Bloc : $bloc".log();
    super.onTransition(bloc, transition);
  }

  @override
  void onCreate(BlocBase bloc) {
    "Space Bloc Created".log();
    super.onCreate(bloc);
  }
}

extension Log on Object {
  void log() => devtools.log(toString());
}
