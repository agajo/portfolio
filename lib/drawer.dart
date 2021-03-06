import 'package:flutter/material.dart';
import 'package:portfolio/frame_manager.dart';

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
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.primary,
            ])),
            currentAccountPicture: ClipOval(
              child: Image.asset('assets/profile_image.png'),
            ), // TODO: アカウント画像前用意した奴assetsに追加して貼る
            accountEmail: const Text('masanada@gmail.com'),
            accountName: const Text('@agajo_tech'),
            onDetailsPressed: () {
              print("clicked!!"); // TODO: ツイッターにリンク飛べるように
            },
            arrowColor: Colors.transparent,
          ),
          ListTile(title: Text("profile page")), // TODO:l10n
          ListTile(title: Text("sample app")), // TODO: l10n
          ListTile(title: Text("change language")), // TODO: l10n
          SwitchListTile(
              title: Text(L10n.of(context)!.showsDeviceFrame),
              value: FrameManager.of(context).showsDeviceFrame,
              onChanged: (bool value) {
                FrameManager.of(context).setShowsDeviceFrame(doShow: value);
              }),
          const AboutListTile(),
        ],
      ),
    );
  }
}
