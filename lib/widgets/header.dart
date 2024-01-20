import 'package:flutter/material.dart';
import '../commons/theme.dart' as theme;

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/images/header_background.png',
          fit: BoxFit.cover,
        ));
  }
}
