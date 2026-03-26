import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/storage_service.dart';
import 'add_note_screen.dart';
import 'view_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  void loadNotes() async {
    notes = await StorageService.getNotes();
    setState(() {});
  }

  void deleteNote(int i) async {
    notes.removeAt(i);
    await StorageService.saveNotes(notes);
    setState(() {});
  }

  void goToAdd() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddNoteScreen()),
    );
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Secure Notes"),
        actions: [
          Row(
            children: [
              Icon(Icons.lock, size: 16, color: Colors.green),
              SizedBox(width: 5),
              Text("Encrypted"),
              SizedBox(width: 10),
            ],
          )
        ],
      ),
      body: notes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock_outline, size: 60),
                  SizedBox(height: 10),
                  Text("No secure notes yet"),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, i) {
                final n = notes[i];

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                        onTap: () {
   Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (_, __, ___) => ViewNoteScreen(
      note: n,
      index: i,
    ),
    transitionsBuilder: (_, animation, __, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  ),
);
  },
                      title: Text(n.title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        n.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                     trailing: SizedBox(
  width: 80,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        n.date,
        style: TextStyle(fontSize: 10),
        overflow: TextOverflow.ellipsis,
      ),
      IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        icon: Icon(Icons.delete, size: 18),
        onPressed: () => deleteNote(i),
      ),
    ],
  ),
),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToAdd,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
  padding: EdgeInsets.symmetric(vertical: 10),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Divider(thickness: 0.5),
      Text(
        "© 2026 kwesilarry • Secure Notes",
        style: TextStyle(fontSize: 11, color: Colors.grey),
      ),
    ],
    
  ),
),
    );
  }
}