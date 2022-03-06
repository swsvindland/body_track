import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:body_track/layouts/layouts.dart';
import 'package:body_track/models/models.dart';
import 'package:body_track/services/database_service.dart';
import 'package:body_track/services/sign_in.dart';
import 'package:body_track/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:body_track/widgets/graph.dart';

class HomePage extends StatelessWidget {
  final db = DatabaseService();

  handleWeighIn() {

  }

  handleCheckIn() {

  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User?>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          actions: <Widget>[
            PopupMenuButton<Popup>(
              onSelected: (Popup result) {
                if (result == Popup.settings) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                }
                if (result == Popup.about) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                }
                if (result == Popup.logOut) {
                  signOut();
                  navigatorKey.currentState!
                      .pushNamedAndRemoveUntil('/login', (route) => false);
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Popup>>[
                const PopupMenuItem<Popup>(
                  value: Popup.settings,
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ),
                const PopupMenuItem<Popup>(
                  value: Popup.about,
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                  ),
                ),
                const PopupMenuItem<Popup>(
                  value: Popup.logOut,
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Log Out'),
                  ),
                ),
              ].toList(),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: StreamProvider<Drinks>.value(
          initialData: Drinks.empty(),
          value: db.streamDrinks(user!.uid),
          child: StreamProvider<Preferences>.value(
            initialData: Preferences.empty(),
            value: db.streamPreferences(user.uid),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Graph(),
                  ),
                ),
                SizedBox(height: 300),
              ],
            ),
          ),
        ),
        floatingActionButton:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: handleWeighIn,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                child: const Icon(Icons.monitor_weight),
              ),
              SizedBox(width: 16),
              FloatingActionButton.extended(
                onPressed: handleCheckIn,
                label: const Text('Check In'),
                icon: const Icon(Icons.straighten),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
            ],
          )
      ),
    );
  }
}

enum Popup { about, settings, logOut }
