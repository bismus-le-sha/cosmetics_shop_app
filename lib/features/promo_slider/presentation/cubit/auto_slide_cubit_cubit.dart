import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class AutoSlideCubit extends Cubit<int> {
  final int slideCount;
  final Duration interval;
  final bool isCyclic;
  Timer? _timer;

  AutoSlideCubit({
    required this.slideCount,
    required this.interval,
    required this.isCyclic,
  }) : super(0) {
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    if (slideCount <= 1) return;
    _timer = Timer.periodic(interval, (_) => nextPage());
  }

  void restartAutoScroll() {
    _timer?.cancel();
    _startAutoScroll();
  }

  void nextPage() {
    if (slideCount == 0) return;
    final next = state + 1;
    if (next >= slideCount) {
      if (isCyclic) {
        emit(0);
      } else {
        _timer?.cancel();
      }
    } else {
      emit(next);
    }
  }

  void manualPageChange(int page) {
    emit(page);
    restartAutoScroll();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
