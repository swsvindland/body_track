import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Graph extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final weights = Provider.of<Iterable<String>>(context);

    print(weights);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(weights.first),
        Text(weights.last)
      ],
    );
  }
}