import 'package:flutter/material.dart';
import '../models/note.dart';
import 'edit_note_screen.dart';

class ViewNoteScreen extends StatelessWidget {
  final Note note;
  final int index;

  const ViewNoteScreen({
    super.key,
    required this.note,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Note"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => EditNoteScreen(
        note: note,
        index: index,
      ),
    ),
  );

  if (result == true) {
    Navigator.pop(context); // go back to home
  }
},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📝 TITLE
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // 🕒 DATE
            Text(
              note.date,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 20),

            // 📖 CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  note.content,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}