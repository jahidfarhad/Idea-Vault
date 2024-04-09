import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idea_vault/style/app_style.dart';
import 'package:intl/intl.dart';
import 'package:clock/clock.dart';

class NoteReaderScreen extends StatefulWidget {
   NoteReaderScreen(this.doc, {super.key});
   QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {

  String date = DateFormat('d MMM, y  h:mm a').format(clock.now());
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  void initState() {

    _titleController = TextEditingController(text: widget.doc['note_title'],);
    _mainController = TextEditingController(text: widget.doc['note_content'],);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    int color_id = widget.doc['color_id'];

    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Update Note', style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 8.0,),
            Text(date, style: AppStyle.dateTitle,),
            const SizedBox(height: 28.0,),

            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            )
          ],
        ),
      ),

      floatingActionButton: Row(
        children: [

          const SizedBox(
            width: 40,
          ),

          FloatingActionButton(
            backgroundColor: AppStyle.deleteColor,
            onPressed: () async {
              widget.doc.reference.delete().whenComplete(() => Navigator.pop(context));
            },
            child: const Icon(Icons.delete),
          ),

          const SizedBox(
            width: 200,
          ),

          FloatingActionButton(
            backgroundColor: AppStyle.accentColor,
            onPressed: () async {

              widget.doc.reference.update({
                'note_title': _titleController.text,
                'creation_date': date,
                'note_content': _mainController.text,
              }).whenComplete(() => Navigator.pop(context));
            },
            child: const Icon(Icons.save),
          ),
      ]
    )
    );
  }
}

