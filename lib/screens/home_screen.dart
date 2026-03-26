import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  void loadNotes() async {
    notes = await StorageService.getNotes();
    setState(() {});
  }

  void deleteNote(int index) async {
    notes.removeAt(index);
    await StorageService.saveNotes(notes);
    setState(() {});
  }

  void goToAddNote() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddNoteScreen()),
    );
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Secure Notes")),
      body: notes.isEmpty
          ? Center(child: Text("No notes yet"))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteNote(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToAddNote,
        child: Icon(Icons.add),
      ),
    );
  }
}