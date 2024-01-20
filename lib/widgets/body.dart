import 'package:flutter/material.dart';
import '../commons/theme.dart' as theme;

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 600),
        Container(height: 600, color: theme.lightBlue),
        Container(height: 600),
        Container(height: 600, color: theme.lightBlue),
        Container(height: 600),
      ],
    );
  }
}
