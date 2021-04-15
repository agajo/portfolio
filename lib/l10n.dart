import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class L10n {
  const L10n(this.locale);

  final Locale locale;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  String _makeAndGetResource(
      {required String enStr, required String jaStr, required String zhStr}) {
    if (locale.languageCode == 'ja') {
      return jaStr;
    } else if (locale.languageCode == 'zh') {
      return zhStr;
    } else {
      return enStr;
    }
  }

  String get appTitle => _makeAndGetResource(
        enStr: 'Oka Ryunoske Portfolio Website',
        jaStr: '岡竜之介ポートフォリオサイト',
        zhStr: '岡竜之介组合网站',
      );
  String get showsDeviceFrame => _makeAndGetResource(
        enStr: 'show device frame',
        jaStr: 'デバイスフレームを表示する',
        zhStr: '显示设备框架',
      );
}

class L10nDelegate extends LocalizationsDelegate<L10n> {
  const L10nDelegate();

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'zh'].contains(locale.languageCode);

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(L10n(locale));
  }

  @override
  bool shouldReload(L10nDelegate old) => false;
}
