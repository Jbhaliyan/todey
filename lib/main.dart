import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey/provider/todosProvider.dart';
// import 'package:provider/provider.dart';
// import 'package:todey/provider/todosProvider.dart';
// import 'package:todey/widgets/TodoDialog.dart';
import 'pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Todey';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          primaryColor: Colors.deepPurple.shade900,
          primarySwatch: Colors.deepPurple,
        ),
        home: HomePage(),
      ),
    );
  }
}
