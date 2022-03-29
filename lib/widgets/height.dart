import 'package:body_track/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:body_track/models/models.dart';
import 'package:body_track/services/database_service.dart';

import '../utils/helper.dart';
import 'input.dart';

class Height extends StatefulWidget {
  Height() : super();

  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {
  final db = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  final feetController = TextEditingController();
  final inchesController = TextEditingController();
  bool set = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    feetController.dispose();
    inchesController.dispose();

    super.dispose();
  }

  void update(User? user, Preferences preferences) {
    preferences.setHeight(
        int.parse(feetController.text), int.parse(inchesController.text));
    set = false;

    db.updatePreferences(user!.uid, preferences);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final preferences = Provider.of<Preferences>(context);

    setState(() {
      if (!set) {
        feetController.text = (preferences.height / 12).floor().toString();
        inchesController.text = (preferences.height % 12).toString();
      }
    });

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Height'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Input(
                        label: 'Feet',
                        decimal: false,
                        variant: "secondary",
                        controller: feetController,
                        validator: checkInValidator),
                  ),
                  SizedBox(
                    width: 100,
                    child: Input(
                        label: 'Inches',
                        decimal: false,
                        variant: "secondary",
                        controller: inchesController,
                        validator: checkInValidator),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Button(
                onPressed: () {
                  update(user, preferences);
                },
                child: new Text(
                  'Update',
                ),
                variant: 'secondary',
              )
            ],
          ),
        ),
      ),
    );
  }
}
