import 'package:flutter_clean_app/features/counter/domain/entities/counter_class.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  CounterClass build() {
    return CounterClass(
      count: 0,
      historyCounter: {},
    );
  }

  void increment() {
    state = state.copyWith(
      count: state.count + 1,
      historyCounter: {
        ...state.historyCounter,
        DateTime.now(): 'Increment'
      }
    );
  }

  void decrement() {
    state = state.copyWith(
      count: state.count - 1,
      historyCounter: {
        ...state.historyCounter,
        DateTime.now(): 'Decrement'
      }
    );
  }

  void reset() {
    state = state.copyWith(
      count: 0,
      historyCounter: {
        ...state.historyCounter,
        DateTime.now(): 'Reset'
      }
    );
  }
}