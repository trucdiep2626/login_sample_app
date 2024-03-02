import 'package:flutter/material.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/l10n/intl/messages_all.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:multiple_localization/multiple_localization.dart';


class L10nDelegate extends LocalizationsDelegate<L10n> {
  const L10nDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      Constants.enLanguage
    ].contains('${locale.languageCode}'
        '${locale.countryCode != null ? ('_${locale.countryCode}') : ''}');
  }

  @override
  Future<L10n> load(Locale locale) {
    return MultipleLocalizations.load(
      initializeMessages,
      locale,
      (l) => L10n(),
      setDefaultLocale: true,
    );
  }

  @override
  bool shouldReload(L10nDelegate old) => false;
}
