import 'package:body_track/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:body_track/models/models.dart';
import 'package:body_track/services/database_service.dart';

class Sex extends StatefulWidget {
  Sex() : super();

  _SexState createState() => _SexState();
}

class _SexState extends State<Sex> {
  final db = DatabaseService();
  SexOptions? _sex = SexOptions.male;
  bool set = false;


  void update(User? user, Preferences preferences) {
    preferences.setSex(_sex == SexOptions.male ? 'male' : 'female');
    set = false;
    db.updatePreferences(user!.uid, preferences);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final preferences = Provider.of<Preferences>(context);

    setState(() {
      if (!set) {
        _sex = preferences.sex == 'male' ? SexOptions.male : SexOptions.female;
      }
    });

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: Column(
            children: [
              ListTile(
                title: const Text('Male'),
                leading: Radio<SexOptions>(
                  value: SexOptions.male,
                  groupValue: _sex,
                  onChanged: (SexOptions? value) {
                    setState(() {
                      _sex = value;
                      set = true;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio<SexOptions>(
                  value: SexOptions.female,
                  groupValue: _sex,
                  onChanged: (SexOptions? value) {
                    setState(() {
                      _sex = value;
                      set = true;
                    });
                  },
                ),
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
    );
  }
}

enum SexOptions { male, female }
