import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          onPressed: () {
            ElasticDrawerKey.drawer.currentState?.closeElasticDrawer(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ElasticDrawerKey.drawer.currentState
                    ?.closeElasticDrawer(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'RED page',
                  style: TextStyle(
                      color: Color(0xffdb3236),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
