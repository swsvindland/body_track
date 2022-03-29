import 'package:body_track/widgets/height.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:body_track/models/models.dart';
import 'package:body_track/services/database_service.dart';
import 'package:body_track/utils/constants.dart';
import 'package:body_track/widgets/notifications.dart';

import '../widgets/sex.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage() : super();

  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User?>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
      body: StreamProvider<Preferences>.value(
        initialData: Preferences.empty(),
        value: db.streamPreferences(user!.uid),
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Sex(),
                Height(),
                Notifications()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
