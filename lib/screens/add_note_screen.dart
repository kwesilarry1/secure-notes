import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _controller = TextEditingController();

  void saveNote() async {
    if (_controller.text.isEmpty) return;

    List<String> notes = await StorageService.getNotes();
    notes.add(_controller.text);
    await StorageService.saveNotes(notes);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write your note...",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveNote,
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}