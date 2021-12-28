// import 'package:flutter/cupertino.dart';

// class LanguageProvider extends ChangeNotifier {
//   List<String> languageList = ['English', 'Arabic'];
//   bool isEnglish = true;
//   Map<String, Object> arabicTexts = {
    
//     "thirdNavBarTitle": "القائمه المهام",
//     "hinttext" :  "اضف مهمه جديده",
//     "ErrorText" : "من فضلك اكتب المهمه",
//     "done" : "تمام",
//     "lang" : 'EN'
    
//     };
//   Map<String, Object> englishTexts = {
    
//     "thirdNavBarTitle": "MY-TO-DO-List",
//      "hinttext" : "Add new task",
//     "ErrorText" : "Please enter a new task",
//     "done" : "Okay",
//     "lang" : 'عربي'

    
//     };

//   void changeLanguage(bool language) async {
//     isEnglish = language;
//     notifyListeners();
//   }

//   // ignore: missing_return
//   Object getTexts(String text) {
//     if (isEnglish == true) return englishTexts[text];
//     return arabicTexts[text];
//   }
// }
