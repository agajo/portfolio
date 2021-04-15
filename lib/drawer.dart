import 'package:flutter/material.dart';

import 'l10n.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: null,
          ),
          AboutListTile(),
          SwitchListTile(
              title: Text(L10n.of(context)!.showsDeviceFrame),
              value: true,
              onChanged: (bool value) {}),
        ],
      ),
    );
  }
}
