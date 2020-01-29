import 'package:designs/pages/design_meetings/models/member.dart';
import 'package:designs/pages/design_meetings/models/task.dart';

class Meeting {
  const Meeting(this.title, this.members, this.tasks);

  final String title;
  final List<Member> members;
  final List<Task> tasks;
}
