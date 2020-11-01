import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/screens/routes/authentication.dart';
import 'package:cc_bogota/screens/routes/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CCBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Centro Cristiano Bogotá',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.black_russian,
      ),
      home: ChangeNotifierProvider<CCState>(
        create: (context) => CCState(),
        child: MainRoute(),
      ),
    );
  }
}
