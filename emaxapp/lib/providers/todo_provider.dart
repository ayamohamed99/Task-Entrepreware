import 'package:emaxapp/model/todoDalily_model.dart';
import 'package:emaxapp/model/todomonthly_model.dart';
import 'package:emaxapp/model/todoweekly_model.dart';

import 'package:flutter/material.dart';

class ToDoProvider extends ChangeNotifier {
  List<TODODailyList> allTasks1 = [];
  List<TODOWeeklyList> allTasks2 = [];
  List<TODOMonthlyList> allTasks3 = [];

  void addTask1({int index, String body}) {
  
      allTasks1.insert(
          index,
          TODODailyList(
            // id: index,
            taskbody: body,
          ));
    

    notifyListeners();
  }
   void addTask2({int index, String body}) {
  
      allTasks2.insert(
          index,
          TODOWeeklyList(
            // id: index,
            taskbody: body,
          ));
    

    notifyListeners();
  }
   void addTask3({int index, String body}) {
  
      allTasks3.insert(
          index,
          TODOMonthlyList(
            // id: index,
            taskbody: body,
          ));
    

    notifyListeners();
  }
}
