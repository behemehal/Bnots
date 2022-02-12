import 'dart:io';

import 'package:bnots/config.dart';
import 'package:bnots/views/ana_ekran.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  language = Platform.localeName.split("_")[0] == "tr" ? 1 : 2;
  await initPrefences();
  runApp(
    MaterialApp(
      title: 'Bnots',
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: themeSecondary,
      ),
      home: const AnaEkran(),
    ),
  );
}
