import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yugioh_2021/bloc/bloc_index.dart';
import '../../../services/service_index.dart';
import '../../presentional_index.dart';

class DetailOfCard extends StatefulWidget {
  const DetailOfCard({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailOfCard> createState() => _DetailOfCardState();
}

class _DetailOfCardState extends State<DetailOfCard> with CustomThemeMixin {
  bool isShowed = true;
  Duration animatedItemDuration = Duration(milliseconds: 100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          themeDisplayFor(context).currentTheme().appBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Hero(
            tag:
                'imageHero${GlobalBloc.appStateBloc.focusedCardHeroCheating().id}',
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: themeDisplayFor(context)
                        .currentTheme()
                        .cardBackgroundColor,
                    borderRadius: BorderRadius.circular(8.0)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: ThumnailCard(
                          cardName: GlobalBloc.appStateBloc
                                  .focusedCardHeroCheating()
                                  .name ??
                              '',
                          imageLink: GlobalBloc.appStateBloc
                                  .focusedCardHeroCheating()
                                  .cardImages
                                  ?.first
                                  .imageUrl ??
                              '',
                          cardDeciption: '',
                        ),
                      ),
                      _renderWithAnimatedOpacity(
                        child: Container(
                          height: 300,
                          color: Colors.red,
                        ),
                      ),
                      _renderWithAnimatedOpacity(
                        child: CupertinoButton(
                          child: Container(
                            height: 30,
                            child: Text("back"),
                          ),
                          onPressed: () {
                            setState(() {
                              isShowed = false;
                            });
                            Future.delayed(animatedItemDuration, () {
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderWithAnimatedOpacity({required Widget child}) {
    return AnimatedOpacity(
      opacity: isShowed ? 1.0 : 0.0,
      child: child,
      duration: animatedItemDuration,
    );
  }
}
