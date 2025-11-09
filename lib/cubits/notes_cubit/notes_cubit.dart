import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() async {
    try {
  var notesBox = Hive.box<NoteModel>(kNotesBox);
  notes = notesBox.values.toList();
  emit(NotesSuccess());
      print("✅ Notes fetched: ${notes!.length}");

}  catch (e,s) {
  // TODO
   print("❌ Error in fetchAllNotes: $e");
    print(s);
}
  }
}
