import 'dart:convert';
import 'package:flutter_clean_app/features/counter/domain/entities/counter_class.dart';
import 'package:flutter_clean_app/config/utils/local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  final String _key = 'counter_state';

  @override
  CounterClass build() {
    // Intenta restaurar el contador desde localStorage
    _loadCounter();
    return CounterClass(
      count: 0,
      historyCounter: {},
    );
  }

  Future<void> _loadCounter() async {
    final value = await LocalStorage().getValue(_key);
    if (value != null) {
      final map = jsonDecode(value);
      final history = <DateTime, String>{};
      (map['historyCounter'] as Map<String, dynamic>).forEach((k, v) {
        history[DateTime.parse(k)] = v as String;
      });
      state = CounterClass(
        count: map['count'] as int,
        historyCounter: history,
      );
    }
  }

  Future<void> _saveCounter(CounterClass newState) async {
    final map = {
      'count': newState.count,
      'historyCounter': newState.historyCounter.map((k, v) => MapEntry(k.toIso8601String(), v)),
    };
    await LocalStorage().setValue(_key, jsonEncode(map));
  }

  void increment() {
    final newState = state.copyWith(
      count: state.count + 1,
      historyCounter: {
        ...state.historyCounter,
        DateTime.now(): 'Increment'
      }
    );
    state = newState;
    _saveCounter(newState);
  }

  void decrement() {
    final newState = state.copyWith(
      count: state.count - 1,
      historyCounter: {
        ...state.historyCounter,
        DateTime.now(): 'Decrement'
      }
    );
    state = newState;
    _saveCounter(newState);
  }

  void reset() {
    final newState = state.copyWith(
      count: 0,
      historyCounter: {
        ...state.historyCounter,
        DateTime.now(): 'Reset'
      }
    );
    state = newState;
    _saveCounter(newState);
  }
}