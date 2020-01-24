import 'package:designs/constants.dart';
import 'package:designs/pages/user_profile/photo_urls.dart';
import 'package:designs/shared/rounded_square.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 48.0,
            ),
            onPressed: Navigator.of(context).maybePop,
          ),
        ),
        primary: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: screenHeight / 2,
            width: double.infinity,
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Image.network(
                  'https://images.pexels.com/photos/1559671/pexels-photo-1559671.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                  // 'https://images.pexels.com/photos/1760698/pexels-photo-1760698.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    kPaLg,
                    kPaLg,
                    kPaLg,
                    (screenHeight * 0.05) + kPaLg,
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Mia Hollis',
                          style: Theme.of(context).textTheme.display2.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: kGapSmall),
                        IntrinsicHeight(
                          child: Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    (japanUrls.length +
                                            laUrls.length +
                                            seattleUrls.length)
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text('PHOTOS'),
                                ],
                              ),
                              const SizedBox(width: kGapLarge),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '410k',
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text('FOLLOWERS'),
                                ],
                              ),
                              const SizedBox(width: kGap),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    SizedBox(
                                      height: double.infinity,
                                      child: RoundedSquare(
                                        onPressed: () {},
                                        borderRadius: BorderRadius.circular(10),
                                        borderColor: Colors.white,
                                        color: Colors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'FOLLOW',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button
                                                  .copyWith(
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: kGapLarge),
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: RoundedSquare(
                                        onPressed: () {},
                                        borderRadius: BorderRadius.circular(10),
                                        borderColor: Colors.white,
                                        color: Colors.transparent,
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 1,
            initialChildSize: 0.55,
            minChildSize: 0.55,
            builder: (context, controller) {
              return Card(
                margin: const EdgeInsets.all(0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36.0),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, kPaLg, 0, kPaLg),
                  shrinkWrap: true,
                  controller: controller,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPaLg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Heading('Kyoto, Japan'),
                          const SizedBox(height: kGapSmall),
                          Caption('${japanUrls.length} PHOTOS'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          kPaLg,
                          kGap,
                          0,
                          kGapLarge,
                        ),
                        separatorBuilder: (_, __) {
                          return const SizedBox(width: kGapLarge);
                        },
                        shrinkWrap: true,
                        itemCount: japanUrls.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ThumbNail(japanUrls[index]);
                        },
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(left: kPaLg),
                      child: Divider(thickness: 2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPaLg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: kGapSmall),
                          Heading('LA Holiday'),
                          const SizedBox(height: kGapSmall),
                          Caption('40 PHOTOS'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          kPaLg,
                          kGap,
                          0,
                          kGapLarge,
                        ),
                        separatorBuilder: (_, __) {
                          return const SizedBox(width: kGapLarge);
                        },
                        shrinkWrap: true,
                        itemCount: laUrls.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ThumbNail(laUrls[index]);
                        },
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(left: kPaLg),
                      child: Divider(thickness: 2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPaLg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Heading('Seattle'),
                          const SizedBox(height: kGapSmall),
                          Caption('${seattleUrls.length} PHOTOS'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          kPaLg,
                          kGap,
                          0,
                          kGapLarge,
                        ),
                        separatorBuilder: (_, __) {
                          return const SizedBox(width: kGapLarge);
                        },
                        shrinkWrap: true,
                        itemCount: seattleUrls.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ThumbNail(seattleUrls[index]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ThumbNail extends StatelessWidget {
  ThumbNail(this.src);

  final String src;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Transform(
            transform: Matrix4.diagonal3Values(.95, .7, 1),
            child: Container(
              decoration: ShapeDecoration(
                shadows: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: Colors.black38,
                    offset: Offset(0, 73),
                  ),
                ],
                // color: Colors.blue,
                shape: CircleBorder(),
              ),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {},
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(src),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Caption extends StatelessWidget {
  Caption(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption.copyWith(),
    );
  }
}

class Heading extends StatelessWidget {
  Heading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
