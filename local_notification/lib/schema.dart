import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  int id = 0;
  String text;
  int interval;
  String unit;

  @Property(type: PropertyType.date)
  DateTime date;
  String startTime;
  String endTime;

  Note(
      {required this.text,
      required this.unit,
      required this.interval,
      required this.startTime,
      required this.endTime,
      required this.date});
}
