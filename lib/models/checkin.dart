class CheckIn {
  DateTime date;
  double neck;
  double shoulders;
  double chest;
  double leftBicep;
  double rightBicep;
  double navel;
  double waist;
  double leftThigh;
  double rightThigh;
  double leftCalf;
  double rightCalf;

  CheckIn(
      {required this.date,
      required this.neck,
      required this.shoulders,
      required this.chest,
      required this.leftBicep,
      required this.rightBicep,
      required this.navel,
      required this.waist,
      required this.leftThigh,
      required this.rightThigh,
      required this.leftCalf,
      required this.rightCalf});

  factory CheckIn.fromMap(Map data) {
    data = data;
    return CheckIn(
      date: data['date'].toDate(),
      neck: data['neck'],
      shoulders: data['shoulders'],
      chest: data['chest'],
      leftBicep: data['leftBicep'],
      rightBicep: data['rightBicep'],
      navel: data['navel'],
      waist: data['waist'],
      leftThigh: data['leftThigh'],
      rightThigh: data['rightThigh'],
      leftCalf: data['leftCalf'],
      rightCalf: data['rightCalf'],
    );
  }

  static Map<String, dynamic> toMap(CheckIn data) {
    data = data;
    return {
      'date': data.date,
      'neck': data.neck,
      'shoulders': data.shoulders,
      'chest': data.chest,
      'leftBicep': data.leftBicep,
      'rightBicep': data.rightBicep,
      'navel': data.navel,
      'waist': data.waist,
      'leftThigh': data.leftThigh,
      'rightThigh': data.rightThigh,
      'leftCalf': data.leftCalf,
      'rightCalf': data.rightCalf,
    };
  }
}
