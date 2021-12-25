
import 'package:emaxapp/providers/language_provider.dart';
import 'package:emaxapp/providers/todo_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ToDoProvider()),
  ChangeNotifierProvider(create: (_) => LanguageProvider()),

];
