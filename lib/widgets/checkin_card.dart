import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/checkin.dart';

class CheckInCard extends StatelessWidget {
  const CheckInCard({Key? key, required this.data}) : super(key: key);
  final CheckIn data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${DateFormat.MMMMd().format(data.date)}',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
            Divider(),
            Wrap(
              children: [
                Text('Neck: ${data.neck}\t\t\t'),
                Text('Shoulders: ${data.shoulders}\t\t\t'),
                Text('Chest: ${data.chest}\t\t\t'),
                Text('Left Bicep: ${data.leftBicep}\t\t\t'),
                Text('Right Bicep: ${data.rightBicep}\t\t\t'),
                Text('Navel: ${data.navel}\t\t\t'),
                Text('Waist: ${data.waist}\t\t\t'),
                Text('Left Thigh: ${data.leftThigh}\t\t\t'),
                Text('Right Thigh: ${data.rightThigh}\t\t\t'),
                Text('Left Calf: ${data.leftCalf}\t\t\t'),
                Text('Right Calf: ${data.rightCalf}\t\t\t'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
