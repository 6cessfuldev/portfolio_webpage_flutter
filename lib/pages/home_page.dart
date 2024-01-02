import 'package:flutter/material.dart';
import 'package:elastic_drawer/elastic_drawer.dart';
import '../widgets/body.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElasticDrawer(
          mainColor: Colors.white,
          drawerColor: Colors.brown.shade100,
          markPosition: 0.01,
          markWidth: 1,
          mainChild: const SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                Body(),
                Footer(),
              ],
            ),
          ),
          drawerChild: const DrawerWidget()),
    );
  }
}
