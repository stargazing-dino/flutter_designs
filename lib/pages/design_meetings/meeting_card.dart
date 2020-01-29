import 'package:designs/constants.dart';
import 'package:designs/pages/design_meetings/meeting_details.dart';
import 'package:designs/pages/design_meetings/models/meeting.dart';
import 'package:designs/pages/design_meetings/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard(this.meeting, this.isSelected);

  final Meeting meeting;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(kBorderRadiusLarge + 6.0),
      topRight: Radius.circular(kBorderRadius),
      bottomLeft: Radius.circular(kBorderRadius),
      bottomRight: Radius.circular(kBorderRadius),
    );

    return AnimatedContainer(
      height: isSelected ? 250 : 170,
      width: 1 / 3 * width,
      margin: const EdgeInsets.only(right: kPaLg),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: isSelected ? 24.0 : 20.0,
            spreadRadius: isSelected ? -10.0 : -4.0,
            offset: Offset(2, 0),
            color: isSelected ? kPrimaryColor : Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Material(
          borderRadius: borderRadius,
          color: isSelected ? kPrimaryColor : Colors.white,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => MeetingDetails(meeting)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    meeting.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: isSelected ? Colors.white : null,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      ...meeting.members
                          .take(2)
                          .toList()
                          .asMap()
                          .map(
                            (index, member) {
                              return MapEntry(
                                index,
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: AnimatedContainer(
                                    margin: EdgeInsets.only(left: 24.0 * index),
                                    height: isSelected ? 50.0 : 40.0,
                                    width: isSelected ? 50.0 : 40.0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        width: 4,
                                        color: isSelected
                                            ? kPrimaryColor
                                            : Colors.white,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: SvgPicture.asset(
                                        member.photoUrl,
                                        fit: BoxFit.fitHeight,
                                        height: 50.0,
                                        width: 50.0,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                          .values
                          .toList()
                          .reversed,
                      if (meeting.members.length > 2)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '+${meeting.members.length - 2}',
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Theme.of(context).textTheme.caption.color,
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
