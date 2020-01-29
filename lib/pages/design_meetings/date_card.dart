import 'package:designs/constants.dart';
import 'package:designs/pages/design_meetings/theme_constants.dart';
import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final borderRadius = BorderRadius.all(Radius.circular(kBorderRadiusLarge));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20.0,
            spreadRadius: -4.0,
            offset: Offset(2, 0),
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Material(
          borderRadius: borderRadius,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(kBorderRadius),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(kPa),
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  const SizedBox(width: kGapLarge),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'January 19',
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: kAccentColor),
                        ),
                        const SizedBox(height: kGapSmall),
                        Text(
                          '9:30 - 11:30',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 18.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: kGapLarge),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right,
                      color: kAccentColor,
                    ),
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
