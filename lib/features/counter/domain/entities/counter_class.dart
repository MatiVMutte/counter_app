class CounterClass {
  int count;
  Map<DateTime, String> historyCounter;

  CounterClass({this.count = 0, this.historyCounter = const {}});

  CounterClass copyWith({int? count, Map<DateTime, String>? historyCounter}) {
    return CounterClass(
      count: count ?? this.count,
      historyCounter: historyCounter ?? this.historyCounter,
    );
  }
}