import 'package:bnots/config.dart';
import 'package:bnots/elements/color_picker.dart';
import 'package:bnots/structs/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MainNote extends StatelessWidget {
  const MainNote(
      {Key? key, required this.note, required this.onTap, required this.onSave})
      : super(key: key);

  final Note note;
  final Function onTap;
  final Function onSave;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: note.extended || note.edit ? 10 : 20,
          right: note.extended || note.edit ? 10 : 20),
      duration: const Duration(milliseconds: 250),
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        minHeight: note.edit
            ? 450
            : note.extended
                ? 350
                : 100,
      ),
      decoration: BoxDecoration(
        color: note.palette.backgroundColor,
        borderRadius:
            BorderRadius.circular(note.extended || note.edit ? 5 : 10),
      ),
      child: Material(
        color: note.palette.backgroundColor,
        borderRadius:
            BorderRadius.circular(note.extended || note.edit ? 5 : 10),
        child: InkWell(
          enableFeedback: !note.extended,
          radius: 3,
          splashColor:
              note.extended ? Colors.transparent : note.palette.titleColor,
          borderRadius:
              BorderRadius.circular(note.extended || note.edit ? 5 : 10),
          onTap: () {
            if (!note.extended && !note.edit) {
              onTap(1);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            (note.extended || note.edit ? 136 : 156),
                        child: (note.edit)
                            ? Container(
                                alignment: Alignment.centerLeft,
                                width:
                                    (MediaQuery.of(context).size.width) * 0.75,
                                child: TextField(
                                  controller:
                                      TextEditingController(text: note.title),
                                  maxLines: 1,
                                  maxLength:
                                      (MediaQuery.of(context).size.width) ~/ 20,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    color: note.palette.titleColor,
                                    fontSize: 20,
                                  ),
                                  onChanged: (value) {
                                    note.title = value;
                                  },
                                ),
                              )
                            : Text(
                                note.title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: note.palette.titleColor),
                              ),
                      ),
                      SizedBox(
                        width: 96,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AnimatedOpacity(
                                opacity: note.extended || note.edit ? 1 : 0,
                                duration: const Duration(milliseconds: 250),
                                child: IconButton(
                                  splashRadius: 15,
                                  splashColor: note.palette.titleColor,
                                  onPressed: note.extended || note.edit
                                      ? () {
                                          var isEdit = note.edit;
                                          onTap(note.edit ? 3 : 2);
                                          isEdit ? onSave() : null;
                                        }
                                      : null,
                                  icon: Icon(
                                      note.edit ? Icons.check : Icons.edit,
                                      color: note.palette.titleColor),
                                ),
                              ),
                              AnimatedOpacity(
                                opacity: note.extended || note.edit ? 1 : 0,
                                duration: const Duration(milliseconds: 250),
                                child: IconButton(
                                  splashRadius: 15,
                                  splashColor: note.palette.titleColor,
                                  onPressed: note.extended || note.edit
                                      ? () {
                                          onTap(note.edit ? -1 : 0);
                                        }
                                      : null,
                                  icon: Icon(
                                    note.edit ? Icons.delete : Icons.close,
                                    color: note.palette.titleColor,
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: note.edit
                      ? 450
                      : note.extended
                          ? 350
                          : 150,
                  child: (note.edit)
                      ? TextField(
                          controller: TextEditingController(
                            text: note.description,
                          ),
                          maxLines: null,
                          expands: true,
                          autofocus: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: note.palette.bodyColor,
                          ),
                          onChanged: (value) {
                            note.description = value;
                          },
                        )
                      : Markdown(
                          padding: EdgeInsets.zero,
                          onTapLink: (_, d, __) {
                            try {
                              launch(d!);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(getLanguageItem(language, 10))),
                              );
                            }
                          },
                          selectable: false,
                          styleSheet: MarkdownStyleSheet(
                            h1: TextStyle(
                              fontSize: 18,
                              color: note.palette.titleColor,
                            ),
                            h2: TextStyle(
                              fontSize: 16,
                              color: note.palette.titleColor,
                            ),
                            h3: TextStyle(
                              fontSize: 14,
                              color: note.palette.titleColor,
                            ),
                            h4: TextStyle(
                              fontSize: 12,
                              color: note.palette.titleColor,
                            ),
                            h5: TextStyle(
                              fontSize: 10,
                              color: note.palette.titleColor,
                            ),
                            h6: TextStyle(
                              fontSize: 8,
                              color: note.palette.titleColor,
                            ),
                            p: TextStyle(
                              fontSize: 16,
                              color: note.palette.bodyColor,
                            ),
                            a: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                            code: TextStyle(
                              fontSize: 16,
                              color: note.palette.bodyColor,
                              backgroundColor: note.palette.titleColor,
                            ),
                            codeblockDecoration: BoxDecoration(
                              color: note.palette.titleColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            blockquote: TextStyle(
                              fontSize: 16,
                              color: note.palette.titleColor,
                              backgroundColor: note.palette.bodyColor,
                            ),
                          ),
                          data: note.description,
                        ),
                ),
                SizedBox(
                  height: 25,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedOpacity(
                          opacity: note.extended ? 1 : 0,
                          duration: const Duration(milliseconds: 250),
                          child: Text(
                            "Son düzenlenme: ${note.date.day}:${note.date.month}:${note.date.year} ${note.date.hour}:${note.date.minute}",
                            style: TextStyle(
                              color: note.palette.bodyColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: note.edit ? 1 : 0,
                          duration: const Duration(milliseconds: 250),
                          child: Row(
                            children: [
                              for (NoteColorPalette color in colorPalettes)
                                InkWell(
                                  onTap: () {
                                    note.palette = color;
                                    onTap(4);
                                    onSave();
                                  },
                                  child: Container(
                                    child: ColorPicker(
                                        color: color.backgroundColor,
                                        onChange: () {
                                          note.palette = color;
                                        },
                                        borderColor: note.palette.bodyColor),
                                    padding: const EdgeInsets.only(
                                        left: 2.5, right: 2.5),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
