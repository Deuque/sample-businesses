import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_bookmarks/data/business_repository_impl.dart';
import 'package:sample_bookmarks/presentation/business_notifier.dart';
import 'package:sample_bookmarks/presentation/business_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BusinessNotifier(BusinessRepositoryImpl()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BusinessScreen(),
    );
  }
}
