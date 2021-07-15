
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtl_flutter/localization/localization_constants.dart';
import 'package:rtl_flutter/pages/homepage.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
    required this.title,
    required this.scrollDirection,
  }) : super(key: key);

  final String title;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: new Icon(Icons.group_add),
                    title: new Text(getTranslated(context, 'add_person')?? 'Add Person'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.share),
                    title: new Text( getTranslated(context, 'share')?? 'share'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>HomePage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.screen_rotation),
                    title: new Text(getTranslated(context, 'orrientation')?? 'Orrientation Change'),
                    onTap: () {
                      if (scrollDirection == Axis.horizontal) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            });
      },
      child: const Icon(Icons.bookmarks_outlined),
      backgroundColor: Colors.blueGrey,
    );
  }
}