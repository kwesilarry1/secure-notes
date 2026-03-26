import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/note.dart';
import '../services/storage_service.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final title = TextEditingController();
  final content = TextEditingController();

  void save() async {
    if (title.text.isEmpty) return;

    List<Note> notes = await StorageService.getNotes();

    notes.add(Note(
      title: title.text,
      content: content.text,
      date: DateFormat('MMM d, HH:mm').format(DateTime.now()),
    ));

    await StorageService.saveNotes(notes);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("New Secure Note")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: content,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write note...",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: save,
              child: Text("Add Note"),
            )
          ],
        ),
      ),
    );
  }
}