import 'package:flutter/material.dart';
import 'package:my_provider/page/base_page.dart';

import 'models/user_info_model.dart';
import 'my_provider/my_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyProvider(
      create: ()=> UserInfoModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TabBarPage(),
      ),
    );
  }
}