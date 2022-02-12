import 'dart:convert';
import 'package:bnots/config.dart';
import 'package:bnots/elements/main_note.dart';
import 'package:bnots/structs/note.dart';
import 'package:flutter/material.dart';
import 'about_page.dart';

bool loaded = false;

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  _AnaEkran createState() => _AnaEkran();
}

class _AnaEkran extends State<AnaEkran> {
  List<Note> notlar = [];

  @override
  Widget build(BuildContext context) {
    if (!appPrefences.containsKey("-1")) {
      appPrefences.setBool("-1", true);
      Note newNote = Note(
          id: 1,
          title: getLanguageItem(language, 4),
          description: getLanguageItem(language, 5),
          date: DateTime.now(),
          extended: false,
          palette: colorPalettes[0],
          edit: false);

      appPrefences.setString("1", jsonEncode(newNote.toJson()));
    }
    if (!loaded) {
      notlar = [];
      Set<String> notes = appPrefences.getKeys();
      for (var note in notes) {
        if (note != "-1") {
          Note n = Note.fromJson(jsonDecode(appPrefences.getString(note)!));
          notlar.add(n);
        }
      }
      if (notlar.isNotEmpty) {
        notlar[0].extended = true;
      }
      loaded = true;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeSecondary,
        centerTitle: false,
        title: const Text(
          "Bnots",
          textAlign: TextAlign.left,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              int nextColor = notlar.isEmpty
                  ? 0
                  : colorPalettes.indexOf(notlar[notlar.length - 1].palette);
              for (Note item in notlar) {
                item.extended = false;
                item.edit = false;
              }
              notlar.add(
                Note(
                  id: notlar.length + 1,
                  title: getLanguageItem(language, 6),
                  description: getLanguageItem(language, 7),
                  date: DateTime.now(),
                  extended: false,
                  palette: nextColor > colorPalettes.length - 1
                      ? colorPalettes[0]
                      : colorPalettes[nextColor + 1],
                  edit: true,
                ),
              );

              setState(() {});
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
            icon: const Icon(Icons.info),
          )
        ],
      ),
      backgroundColor: themeMain,
      body: notlar.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: const [
                  Center(
                    child: Icon(
                      Icons.description,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "No notes available",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return MainNote(
                  note: notlar[index],
                  onSave: () {
                    notlar[index].date = DateTime.now();
                    Note note = Note(
                      id: notlar[index].id,
                      title: notlar[index].title,
                      description: notlar[index].description,
                      date: notlar[index].date,
                      extended: false,
                      palette: notlar[index].palette,
                      edit: false,
                    );

                    appPrefences.setString(
                        notlar[index].id.toString(), jsonEncode(note.toJson()));
                  },
                  onTap: (state) {
                    if (state != 4) {
                      for (Note item in notlar) {
                        item.extended = false;
                        item.edit = false;
                      }
                      notlar[index].extended = state == 1 ? true : false;
                      notlar[index].edit = state == 2 ? true : false;
                      if (state == -1) {
                        appPrefences.remove(notlar[index].id.toString());
                        notlar.removeAt(index);
                      }
                    }
                    setState(() {});
                  },
                );
              },
              itemCount: notlar.length,
            ),
    );
  }
}
