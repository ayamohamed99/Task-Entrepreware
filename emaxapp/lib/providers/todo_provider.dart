import 'package:emaxapp/model/todo_model.dart';
import 'package:flutter/material.dart';

class ToDoProvider extends ChangeNotifier {
  List<TODODailyList> allTasks1 = [];
  List<TODOWeeklyList> allTasks2 = [];
  List<TODOMonthlyList> allTasks3 = [];


void addTask({ String body , int to_do_list}){
  to_do_list == 0 ?
   allTasks1.insert(
          allTasks1.length,
          TODODailyList(
            check: false,
            taskbody: body,
          )) :
          to_do_list == 1 ? 
            allTasks2.insert(
         allTasks2.length,
          TODOWeeklyList(
            check: false,
            taskbody: body,
          )):

        allTasks3.insert(
          allTasks3.length,
          TODOMonthlyList(
           check: false,
            taskbody: body,
          ));
    

    notifyListeners();
}




  // void addTask1({int index, String body}) {
  
  //     allTasks1.insert(
  //         index,
  //         TODODailyList(
  //           // id: index,
  //           taskbody: body,
  //         ));
    

  //   notifyListeners();
  // }
  //  void addTask2({int index, String body}) {
  
  //     allTasks2.insert(
  //         index,
  //         TODOWeeklyList(
  //           // id: index,
  //           taskbody: body,
  //         ));
    

  //   notifyListeners();
  // }
  //  void addTask3({int index, String body}) {
  
  //     allTasks3.insert(
  //         index,
  //         TODOMonthlyList(
  //           // id: index,
  //           taskbody: body,
  //         ));
    

  //   notifyListeners();
  // }
}
