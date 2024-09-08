import 'package:flutter/material.dart';
import 'package:mvvm_api/views/posts/posts_view.dart';

main()=>runApp(const MyApp());



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  PostsView(),
    );
    
  }
}