import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              ElasticDrawerKey.drawer.currentState?.closeElasticDrawer(context);
            },
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
