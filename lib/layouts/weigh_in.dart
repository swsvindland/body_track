import 'package:flutter/material.dart';

import '../services/database_service.dart';
import '../utils/constants.dart';

class WeighIn extends StatefulWidget {
  const WeighIn({Key? key}) : super(key: key);

  @override
  State<WeighIn> createState() => _WeighInState();
}

class _WeighInState extends State<WeighIn> {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );
  }
}
