import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/storage_service.dart';
import 'package:intl/intl.dart';

class EditNoteScreen extends StatefulWidget {
  final Note note;
  final int index;

  const EditNoteScreen({
    super.key,
    required this.note,
    required this.index,
  });

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController title;
  late TextEditingController content;

  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.note.title);
    content = TextEditingController(text: widget.note.content);
  }

 void saveEdit() async {
  List<Note> notes = await StorageService.getNotes();

  notes[widget.index] = Note(
    title: title.text,
    content: content.text,
    date: DateFormat('MMM d, HH:mm').format(DateTime.now()),
  );

  await StorageService.saveNotes(notes);

  // show success message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Note updated successfully ✅"),
      duration: Duration(seconds: 2),
    ),
  );

  Navigator.pop(context); // back to view
  Navigator.pop(context); // back to home
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Edit Note")),
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
                hintText: "Edit note...",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: saveEdit,
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Text(
      "Save Changes and Refresh",
      style: TextStyle(fontSize: 16),
    ),
  ),
)
          ],
        ),
      ),
    );
  }
}