import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:portfolio_web/pages/main_page.dart';

import 'blocs/theme_cubit.dart';

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
        mainColor: context.watch<ThemeCubit>().state.backgroundColor,
        drawerColor: context.watch<ThemeCubit>().state.bottomAppBarColor,
        markPosition: 0.01,
        markWidth: 1,
        mainChild: Column(
          children: [
            Expanded(
              child: Navigator(
                onGenerateRoute: (settings) {
                  if (settings.name == '/') {
                    return MaterialPageRoute(
                        builder: (context) => const MainPage());
                  }
                  return null;
                  // 다른 라우트들을 여기에 추가
                },
              ),
            ),
            SizedBox(
              height: 200,
              child: FooterView(
                footer: Footer(
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 300,
                    child: const Text('hi', style: TextStyle(fontSize: 30),)
                  ),

                ),
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.facebook)),
                  ]),
                ],
              ),
            ),
          ],
        ),
        drawerChild: Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              onPressed: (){
                ElasticDrawerKey.drawer.currentState
                    ?.closeElasticDrawer(context);
              }, 
              icon: const Icon(Icons.close),
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
                Switch(
                  value: context.watch<ThemeCubit>().state.brightness == Brightness.dark,
                  onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
