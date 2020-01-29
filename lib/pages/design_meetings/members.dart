import 'package:designs/constants.dart';
import 'package:designs/pages/design_meetings/models/member.dart';
import 'package:designs/pages/design_meetings/theme_constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Members extends StatelessWidget {
  const Members(this.members);

  final List<Member> members;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: kPaLg),
      itemCount: members.length + 1,
      itemBuilder: (_, index) {
        if (index == members.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: DottedBorder(
                color: kAccentColor,
                dashPattern: [0, 6, 0],
                borderType: BorderType.RRect,
                radius: Radius.circular(kBorderRadius),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(kBorderRadius)),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        final member = members[index];

        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16.0),
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
        );
      },
      separatorBuilder: (_, __) => SizedBox(width: kGap),
    );
  }
}
