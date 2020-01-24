import 'dart:math';

import 'package:designs/constants.dart';
import 'package:designs/pages/airline/ticket.dart';
import 'package:designs/pages/airline/timeline.dart';
import 'package:flutter/material.dart';

class BoardingPass extends StatelessWidget {
  const BoardingPass(this.seat);

  final String seat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.airplanemode_active,
          color: Colors.indigo[900],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close, color: Colors.indigo[900]),
            onPressed: Navigator.of(context).maybePop,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPa),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Boarding Pass',
              style: Theme.of(context).textTheme.headline.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900],
                  ),
            ),
            const SizedBox(height: kGapLarge),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 6.0,
                    shape: StubShape(radius: 10),
                    child: Stub(seat),
                  ),
                  Material(
                    elevation: 6.0,
                    child: BarCode(),
                    shape: StubShape(radius: 10, isTop: false),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 36.0, 16.0, 36.0),
              child: SizedBox(
                width: double.infinity,
                height: 56.0,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: OutlineButton(
                          child: Icon(Icons.print),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(width: kGap),
                    SizedBox(
                      height: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: OutlineButton(
                          child: Icon(Icons.send),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(width: kGap),
                    Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(6.0),
                          ),
                          color: Colors.indigo[900],
                          child: Text(
                            'Download',
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Stub extends StatelessWidget {
  const Stub(this.seat);

  final String seat;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(kPa),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Timeline(
            itemGap: 20.0,
            gutterSpacing: 12.0,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Krakow',
                            style: textTheme.subhead.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Colors.indigo[900],
                              fontSize: 18.0,
                            ),
                          ),
                          TextSpan(
                            text: ', Balice',
                            style: textTheme.caption.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      child: Text('KRK'),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueGrey[200]),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Berlin',
                            style: textTheme.subhead.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.indigo[900],
                            ),
                          ),
                          TextSpan(
                            text: ', Tegal',
                            style: textTheme.caption.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      child: Text('TXL'),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueGrey[200]),
                    ),
                  )
                ],
              ),
            ],
            indicators: <Widget>[
              Icon(
                Icons.radio_button_checked,
                color: Colors.indigo[900],
              ),
              Icon(
                Icons.airplanemode_active,
                color: Colors.indigo[900],
              ),
            ],
          ),
          Divider(thickness: 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: kPa),
                  HeaderText('Passenger'),
                  const SizedBox(height: kGapSmall),
                  BlueText('Jack Tyler'),
                ],
              ),
              const SizedBox(height: kGapLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText('Flight No.'),
                        const SizedBox(height: kGapSmall),
                        BlueText('LO 156'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText('Date'),
                        const SizedBox(height: kGapSmall),
                        BlueText('3 Jun, 2019'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText('Time'),
                        const SizedBox(height: kGapSmall),
                        BlueText('11:45'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kGapLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText('Class'),
                        const SizedBox(height: kGapSmall),
                        BlueText('Economy'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText('Seat'),
                        const SizedBox(height: kGapSmall),
                        BlueText(seat),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText('Gate'),
                        const SizedBox(height: kGapSmall),
                        BlueText('A2'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kPa),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class BlueText extends StatelessWidget {
  const BlueText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[900],
          ),
    );
  }
}

class BarCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Container(
      padding: const EdgeInsets.all(kPa),
      child: Row(
        children: List.generate(50, (_) {
          return Flexible(
            child: Container(
              color: Colors.black,
              margin: EdgeInsets.only(right: random.nextInt(10).toDouble()),
              height: 100,
              width: random.nextInt(20).toDouble() + 10.0,
            ),
          );
        }),
      ),
    );
  }
}
