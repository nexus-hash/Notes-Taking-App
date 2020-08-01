import 'dbutils.dart';

class GVar {
  static String DiaryNam ="Diary";
  static String Title = "";
  static String Description = "";
  static NotesCollection a =new NotesCollection("Hello","hey there");
  static NotesCollection b =new NotesCollection("key","How Are you? "
      "You fine. What shall i do for your");

  static List<NotesCollection> notes = [a,b,b,a,b,b,a,b,a];
  static List<int> end=[9,20,20,9,20,20,9,20,9];
}