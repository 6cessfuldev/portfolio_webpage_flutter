import 'package:flutter/material.dart';
import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/scroll_bloc.dart';
import '../widgets/body.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../commons/theme.dart' as theme;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  final bool _isInAppBar = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final ScrollBloc scrollBloc = BlocProvider.of<ScrollBloc>(context);
      scrollBloc.add(ScrollChanged(_scrollController.position.pixels));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElasticDrawer(
          mainColor: Colors.white,
          drawerColor: theme.darkBlue,
          markPosition: 0.5,
          markWidth: 1,
          mainChild: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: const Column(
                  children: [
                    Header(),
                    Body(),
                    Footer(),
                  ],
                ),
              ),
              CustomAppBar(isInAppBar: _isInAppBar),
            ],
          ),
          drawerChild: const DrawerWidget()),
    );
  }
}
