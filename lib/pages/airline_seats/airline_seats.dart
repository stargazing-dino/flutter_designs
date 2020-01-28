import 'package:designs/constants.dart';
import 'package:designs/pages/airline_seats/boarding_pass.dart';
import 'package:designs/pages/airline_seats/plane_painter.dart';
import 'package:flutter/material.dart';

// https://dribbble.com/shots/9706802-Check-in-flow-LOT-iOS-App/attachments/1736215?mode=media
class AirlineSeatsPage extends StatefulWidget {
  @override
  _AirlineSeatsPageState createState() => _AirlineSeatsPageState();
}

class _AirlineSeatsPageState extends State<AirlineSeatsPage> {
  final letters = 'ABCDEFG';
  String selectedSeat;
  final List<String> availableSeats = ['B6', 'E11', 'A15', 'B15', 'F8'];

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Colors.grey[200];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 106),
        child: Material(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
          elevation: 6.0,
          child: Column(
            children: <Widget>[
              AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.indigo[900]),
                  onPressed: Navigator.of(context).maybePop,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kPa),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Choose a seat',
                      style: Theme.of(context).textTheme.headline.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                    ),
                    const SizedBox(height: kGapLarge),
                    DefaultTextStyle(
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 14.0, color: Colors.grey[700]),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            RoundedSquare(color: Colors.greenAccent),
                            const SizedBox(width: kGapSmall),
                            Text('Selected'),
                            const SizedBox(width: kGap),
                            RoundedSquare(color: Colors.transparent),
                            const SizedBox(width: kGapSmall),
                            Text('Available'),
                            const SizedBox(width: kGap),
                            RoundedSquare(color: Colors.grey[200]),
                            const SizedBox(width: kGapSmall),
                            Text('Booked'),
                            const SizedBox(width: kGap),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomPaint(
        painter: PlanePainter(
          strokeColor: Colors.blueGrey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          children: <Widget>[
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(
                56.0,
                16.0,
                56.0,
                kGapSmall,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: kGapSmall,
                mainAxisSpacing: kGapSmall,
              ),
              children: List.generate(
                77,
                (i) {
                  String seat;
                  int row;

                  if (i % 7 > 3) {
                    seat = letters[(i % 7) - 1];
                  } else if (i % 7 < 4) {
                    seat = letters[i % 7];
                  }

                  if (i < 7) {
                    if (i == 3) return Container();
                    if (i > 3) {
                      return Center(child: Text(seat));
                    }
                    return Center(child: Text(seat));
                  }

                  row = (i ~/ 7) + 5;

                  if (i % 7 == 3) {
                    return Center(child: Text(row.toString()));
                  }

                  final isAvailable = availableSeats.contains('$seat$row');
                  final isSelected = selectedSeat == '$seat$row';

                  return RoundedSquare(
                    onPressed: isAvailable
                        ? () => setState(() {
                              if (isSelected) {
                                selectedSeat = null;
                              } else {
                                selectedSeat = '$seat$row';
                              }
                            })
                        : null,
                    color: isSelected
                        ? Colors.greenAccent
                        : isAvailable ? Colors.transparent : Colors.grey[200],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 56.0,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: RoundedSquare(
                      child: Center(child: Text('WC')),
                      color: Colors.blueGrey[100],
                      aspectRatio: 3 / 1,
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    flex: 3,
                    child: RoundedSquare(
                      child: Center(child: Text('WC')),
                      color: Colors.blueGrey[100],
                      aspectRatio: 3 / 1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 36.0, 16.0, 36.0),
              child: SizedBox(
                width: double.infinity,
                height: 56.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(6.0),
                  ),
                  color: Colors.indigo[900],
                  child: Text(
                    'Get boarding pass',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: selectedSeat == null
                      ? null
                      : () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BoardingPass(selectedSeat),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedSquare extends StatelessWidget {
  RoundedSquare({
    this.color,
    this.aspectRatio = 1,
    this.child,
    this.onPressed,
  });

  final Color color;
  final double aspectRatio;
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 2.0,
          ),
        ),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(4.0),
          child: InkWell(
            onTap: onPressed,
            child: child == null ? Container() : child,
          ),
        ),
      ),
    );
  }
}
