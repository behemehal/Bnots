import 'package:bnots/config.dart';

class Note {
  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.palette,
    required this.extended,
    required this.edit,
  }) {
    title = title;
    description = description;
    date = date;
    palette = palette;
    extended = extended;
    edit = edit;
  }
  int id;
  String title;
  String description;
  DateTime date;
  NoteColorPalette palette;
  bool extended;
  bool edit;

  Note.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        description = json["description"],
        date = DateTime.parse(json["date"]),
        palette = colorPalettes[json["palette"]],
        extended = json["extended"],
        edit = json["edit"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date.toIso8601String(),
        "palette": colorPalettes
            .indexWhere((element) => element.bodyColor == palette.bodyColor),
        "extended": extended,
        "edit": edit,
      };
}
