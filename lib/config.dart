// ignore_for_file: unnecessary_string_escapes

library config;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences appPrefences;
Color themeMain = const Color.fromRGBO(30, 35, 41, 1);
Color themeSecondary = const Color.fromRGBO(244, 179, 1, 1);

Future<bool> initPrefences() async {
  appPrefences = await SharedPreferences.getInstance();
  return true;
}

List<NoteColorPalette> colorPalettes = [
  const NoteColorPalette(
      titleColor: Colors.white,
      bodyColor: Color.fromRGBO(30, 35, 41, 1),
      backgroundColor: Color.fromRGBO(255, 126, 185, 1)),
  const NoteColorPalette(
      titleColor: Colors.white,
      bodyColor: Color.fromRGBO(30, 35, 41, 1),
      backgroundColor: Color.fromRGBO(255, 101, 163, 1)),
  const NoteColorPalette(
      titleColor: Color.fromRGBO(255, 101, 163, 1),
      bodyColor: Color.fromRGBO(30, 35, 41, 1),
      backgroundColor: Color.fromRGBO(122, 252, 255, 1)),
  const NoteColorPalette(
      titleColor: Color.fromRGBO(255, 101, 163, 1),
      bodyColor: Color.fromRGBO(30, 35, 41, 1),
      backgroundColor: Color.fromRGBO(254, 255, 156, 1)),
  const NoteColorPalette(
      titleColor: Color.fromRGBO(255, 101, 163, 1),
      bodyColor: Color.fromRGBO(30, 35, 41, 1),
      backgroundColor: Color.fromRGBO(255, 247, 64, 1)),
  const NoteColorPalette(
      titleColor: Color.fromRGBO(30, 35, 41, 1),
      bodyColor: Colors.white,
      backgroundColor: Color.fromRGBO(231, 47, 59, 1)),
];

class NoteColorPalette {
  const NoteColorPalette({
    required this.titleColor,
    required this.bodyColor,
    required this.backgroundColor,
  });
  final Color titleColor;
  final Color bodyColor;
  final Color backgroundColor;
}

int language = 1;

Map<int, String> dil = {
  1: "Türkçe",
  2: "English",
};

Map<String, String> cumleler = {
  "11": "BNotlarım",
  "21": "BNots",

  "12": "Not ekle",
  "22": "Add new note",

  "13": "Markdown desteği ile sadeliğin birleştiği not uygulaması uygulama",
  "23": "A note app that combines simplicity with Markdown support.",

  "14": "Bnotes'a Hoşgeldiniz",
  "24": "Welcome to Bnotes",

  "15": '''Markdown desteği ile sadeliğin birleştiği uygulama.

## Basit Markdown Komutları

### Başlıklar

Farklı boyutdaki başlıkları oluşturmak için, `#` karakteri kullanın. Tekrar eden karater kadar başlık boyutu azalacak

- `#` Başlık 1
- `##` Başlık 2
- `###` Başlık 3
- `####` Başlık 4
- `#####` Başlık 5
- `######` Başlık 6

### Linkler

Bir link oluşturmak için, `[Link Adı](http://link.com)` şeklinde kullanım yapabilirsiniz.

### Blok yazı

Bir yazıyı gövdeden farklı şekilde göstermek isterseniz aşağıdaki örneği kullanabilirsiniz

```

Bu çok satırlı Blok

````

`Tek` satır


### Resimler

![Alt Text](https://behemehal.net/assets/img/bBrand/main.png)''',
  // ignore: unnecessary_string_escapes
  "25": '''# Welcome to Bnots

A note app that combines simplicity with Markdown support.

## Basic Markdown Commands

### Headers

To create different sized headers, use the `#` character. Repeating the `#` character will decrease the size of the header.

- `#` Header 1
- `##` Header 2
- `###` Header 3
- `####` Header 4
- `#####` Header 5
- `######` Header 6

### Links

To create a link, use the following syntax: `[Link Text](http://link.com)`

### Block quotes

To create a block quote, use the following syntax:

\```

This is a block quote.

\````

\`Single\` line


### Pictures

![Alt Text](https://behemehal.net/assets/img/bBrand/main.png)''',

  "16": "Yeni not",
  "26": "New note",
  "17": "Notum işte tam burda",
  "27": "Your note is here",
  "18": "Hakkında",
  "28": "About",
  "19": "Kütüphaneler lisansları",
  "29": "Library licenses",
  "110": "Link tanınmadı",
  "210": "Link unrecognized",
};

String getLanguageItem(int language, int key) {
  return cumleler["$language$key"]!;
}
