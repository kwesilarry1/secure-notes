import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String notesKey = "notes";
  static const String pinKey = "pin";

  static Future<void> saveNotes(List<String> notes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(notesKey, notes);
  }

  static Future<List<String>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(notesKey) ?? [];
  }

  static Future<void> savePin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(pinKey, pin);
  }

  static Future<String?> getPin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(pinKey);
  }

  static Future<bool> hasPin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(pinKey);
  }
}