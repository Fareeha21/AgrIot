import 'package:agriot/utils/constants.dart';
import 'package:flutter/material.dart';

class DrawerIcon extends StatefulWidget {
  @override
  _DrawerIconState createState() => _DrawerIconState();
}

class _DrawerIconState extends State<DrawerIcon> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (
        ctx,
      ) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Scaffold.of(ctx).openDrawer();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(
                Constants.IMAGE_LOGO,
              ),
            ),
          ),
        );
      },
    );
  }
}
