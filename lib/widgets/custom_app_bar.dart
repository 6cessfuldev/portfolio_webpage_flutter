import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/scroll_bloc.dart';
import '../commons/theme.dart' as theme;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.isInAppBar});

  final bool isInAppBar;

  @override
  Widget build(BuildContext context) {
    final scrollBloc = BlocProvider.of<ScrollBloc>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * theme.contentPaddingRatio),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<ScrollBloc, ScrollState>(
              bloc: scrollBloc,
              builder: (context, state) {
                double position = state.position;
                double headerHeight = MediaQuery.of(context).size.height;
                double shaderDivider = 0;

                debugPrint("portion ${position + 30 - headerHeight}");

                debugPrint("position $position headerHeight $headerHeight");
                if (position <= headerHeight - 30 - 100 + 25) {
                  shaderDivider = 0;
                } else if (position > headerHeight - 30 - 100 + 25 &&
                    position < headerHeight - 30 - 25) {
                  debugPrint("middle");
                  shaderDivider =
                      1 - (headerHeight - (position + 30 + 25)) / 50;
                } else {
                  shaderDivider = 1;
                }

                debugPrint("divider $shaderDivider");

                return Stack(
                  children: [
                    const SizedBox(
                      height: 50,
                      width: 100,
                      child: Text('Yuk',
                          style: TextStyle(fontSize: 40, shadows: [
                            Shadow(
                              offset: Offset(5.0, 2.0),
                              blurRadius: 5.0,
                              color: theme.darkBlue,
                            ),
                          ])),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: const <Color>[Colors.blue, Colors.white],
                          stops: [shaderDivider, shaderDivider],
                        ).createShader(bounds);
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Text('Yuk',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
