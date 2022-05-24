import 'package:flutter/material.dart';
import 'package:body_track/utils/constants.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('About'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Designed and Built by',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'Sam Svindland',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                'Version',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '1.3.0',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
