import 'package:designs/pages/design_meetings/models/meeting.dart';
import 'package:designs/pages/design_meetings/models/member.dart';
import 'package:designs/pages/design_meetings/models/task.dart';

const List<Meeting> meetings = [
  Meeting('Design review', [
    Member('Stacy', 'assets/design_meetings/brown_haired_lady.svg'),
    Member('Mikey', 'assets/design_meetings/curly_haired_guy.svg'),
    Member('Rex', 'assets/design_meetings/black_haired_guy.svg'),
  ], [
    Task('Prepare moodboards and concept', true),
    Task('Discuss and approve UX scheme', false),
  ]),
  Meeting('New UI style home', [
    Member('Mikey', 'assets/design_meetings/curly_haired_guy.svg'),
    Member('Sven', 'assets/design_meetings/backwards_guy.svg'),
    Member('Olivia', 'assets/design_meetings/backwards_girl.svg'),
    Member('Stacy', 'assets/design_meetings/brown_haired_lady.svg'),
    Member('Rex', 'assets/design_meetings/black_haired_guy.svg'),
  ], [
    Task('Prepare moodboards and concept', true),
    Task('Discuss and approve UX scheme', false),
  ]),
  Meeting('Month Planning', [
    Member('Olivia', 'assets/design_meetings/backwards_girl.svg'),
    Member('Rex', 'assets/design_meetings/black_haired_guy.svg'),
  ], [
    Task('Prepare moodboards and concept', true),
    Task('Discuss and approve UX scheme', false),
  ]),
  Meeting('Candy machine repairs', [
    Member('Sven', 'assets/design_meetings/backwards_guy.svg'),
    Member('Rex', 'assets/design_meetings/black_haired_guy.svg'),
  ], [
    Task('Prepare moodboards and concept', true),
    Task('Discuss and approve UX scheme', false),
  ]),
];
