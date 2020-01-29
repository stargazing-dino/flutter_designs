import 'package:designs/constants.dart';
import 'package:designs/pages/design_meetings/models/task.dart';
import 'package:designs/pages/design_meetings/theme_constants.dart';
import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  Tasks(this.tasks);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tasks.take(2).map((task) {
        final color =
            task.completed ? kAccentColor : Theme.of(context).disabledColor;

        return Row(
          children: <Widget>[
            Icon(
              task.completed ? Icons.check_box : Icons.check_box_outline_blank,
              color: color,
              size: 28.0,
            ),
            const SizedBox(width: kGapLarge),
            Expanded(
              child: Text(
                task.title,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: color, fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
