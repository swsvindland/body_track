import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weight.dart';

class Weights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weights = Provider.of<Iterable<Weight>>(context);

    var now = DateTime.now();

    return new TimeSeriesChart(_createSampleData(weights), animate: false, behaviors: [
      new RangeAnnotation([
        new RangeAnnotationSegment(new DateTime(now.year, now.month - 1, now.day),
            now, RangeAnnotationAxisType.domain),
      ]),
    ]);
  }

  /// Create one series with sample hard coded data.
  static List<Series<TimeSeriesWeight, DateTime>> _createSampleData(Iterable<Weight> weights) {

    final data = weights.map((e) => new TimeSeriesWeight(e.date, e.weight));

    return [
      new Series<TimeSeriesWeight, DateTime>(
        id: 'Weights',
        domainFn: (TimeSeriesWeight sales, _) => sales.time,
        measureFn: (TimeSeriesWeight sales, _) => sales.weight,
        data: data.toList(),
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesWeight {
  final DateTime time;
  final double weight;

  TimeSeriesWeight(this.time, this.weight);
}