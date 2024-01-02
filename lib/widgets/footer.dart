import 'package:flutter/material.dart';

import '../commons/theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth * contentPaddingRatio),
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color(0xff212529)),
        child: const Column(
          children: [
            Row(
              children: [],
            ),
          ],
        ));
  }
}
