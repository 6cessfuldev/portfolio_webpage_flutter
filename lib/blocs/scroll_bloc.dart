import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 스크롤 이벤트 정의
abstract class ScrollEvent {}

class ScrollChanged extends ScrollEvent {
  final double position;

  ScrollChanged(this.position);
}

// 스크롤 상태 정의
class ScrollState {
  final double position;

  ScrollState(this.position);
}

// ScrollBloc 정의
class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollBloc() : super(ScrollState(0)) {
    on<ScrollChanged>((event, emit) {
      emit(ScrollState(event.position));
      debugPrint("in bloc ${event.position}");
    });
  }
}
