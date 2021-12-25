import 'dart:math';

import 'package:emaxapp/common_widgets/creat_app_bar.dart';
import 'package:emaxapp/common_widgets/creat_text_field.dart';
import 'package:emaxapp/providers/language_provider.dart';
import 'package:emaxapp/providers/todo_provider.dart';
import 'package:emaxapp/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListViewScreen extends StatefulWidget {
  static const route = "ListViewScreen";

  const ListViewScreen({Key key}) : super(key: key);
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  LanguageProvider languageProvider;
  ToDoProvider toDoProvider;
  TextEditingController _bodycontrallerD = TextEditingController();
  TextEditingController _bodycontrallerW = TextEditingController();
  TextEditingController _bodycontrallerM = TextEditingController();
  List<String> titleAR = [" شهري", "أسبوعي", "يومي"];
  List<String> titleEN = ["Daily", "Weekly", "Monthly"];
  List<String> images = [
    'assets/image/d.jpg',
    'assets/image/w.jpg',
    'assets/image/m.jpg'
  ];
  List<String> imagesAR = [
    'assets/image/mAR.jpg',
    'assets/image/wAR.jpg',
    'assets/image/dAR.jpg'
  ];
  List<Color> color = [Colors.yellow[600], Colors.orange[500], Colors.red[500]];
  List<Color> titleColor = [Colors.red[500], Colors.yellow[600], Colors.orange[500]];

  @override
  void initState() {
    super.initState();
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    toDoProvider = Provider.of<ToDoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    toDoProvider = Provider.of<ToDoProvider>(context, listen: true);
    Size size = MediaQuery.of(context).size;
    final AlertDialog alert = AlertDialog(
        title: Text(languageProvider.getTexts('ErrorText')),
        content: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(languageProvider.getTexts('done')),
        ));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CreatAppBar(
          label: languageProvider.getTexts('thirdNavBarTitle'),
        ),
        body: GridView.builder(
            padding: EdgeInsets.all(30),
            shrinkWrap: false,
            physics: NeverScrollableScrollPhysics(),
            reverse: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                childAspectRatio: 0.8),
            itemCount: 3,
            itemBuilder: (context, indexgrid) => Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10.0),
                  color: color[indexgrid],
                  height: size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: size.height * 0.1,
                        color: titleColor[indexgrid],
                        child: Directionality(
                          textDirection: languageProvider.isEnglish == true
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      languageProvider.isEnglish == true
                                          ? AssetImage(images[indexgrid])
                                          : AssetImage(imagesAR[indexgrid]),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  languageProvider.isEnglish == true
                                      ? titleEN[indexgrid]
                                      : titleAR[indexgrid],
                                  style: Maintext.display5(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        // flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            // color: Colors.black,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: indexgrid == 0 
                                    ? toDoProvider.allTasks1.length
                                    : indexgrid == 1
                                        ? toDoProvider.allTasks2.length
                                        : toDoProvider.allTasks3.length,
                                itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.all(3.0),
                                      // color: Colors.white,
                                      // height: 45,
                                      child: Directionality(
                                        textDirection:
                                            languageProvider.isEnglish == true
                                                ? TextDirection.ltr
                                                : TextDirection.rtl,
                                        child: Container(
                                          width: size.width,
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    titleColor[indexgrid],
                                                maxRadius: 10,
                                                minRadius: 5,
                                              ),
                                              SizedBox(width : 10),
                                              Expanded(
                                                child: Text(
                                                  indexgrid == 0
                                                      ? toDoProvider
                                                          .allTasks1[index].taskbody
                                                      : indexgrid == 1
                                                          ? toDoProvider
                                                              .allTasks2[index]
                                                              .taskbody
                                                          : toDoProvider
                                                              .allTasks3[index]
                                                              .taskbody,
                                                  maxLines: 40,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 18),
                                                  // textDirection: TextDirection.rtl,
                                                  // textAlign: TextAlign.end,
                                                  // style: Bodytask.display5(context),
                                                ),
                                              ),
                                             
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      ),
                      // Spacer(),
                      Directionality(
                        textDirection: languageProvider.isEnglish == true
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                flex: 3,
                                child: CreatTextField(
                                  controller: indexgrid == 0
                                      ? _bodycontrallerD
                                      : indexgrid == 1
                                          ? _bodycontrallerW
                                          : _bodycontrallerM,
                                )),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  // margin: EdgeInsets.only(bottom: 30),
                                  height: 75,
                                  child: IconButton(
                                      onPressed: () {
                                        if (_bodycontrallerD.text.isEmpty &&
                                            _bodycontrallerM.text.isEmpty &&
                                            _bodycontrallerW.text.isEmpty) {
                                          print(indexgrid);
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return alert;
                                            },
                                          );
                                        } else {
                                          print(indexgrid);
                                          if(languageProvider.isEnglish == true){
                                              if (indexgrid == 0) {
                                            toDoProvider.addTask1(
                                                index: toDoProvider
                                                    .allTasks1.length,
                                                body: _bodycontrallerD.text);
                                            _bodycontrallerD.clear();
                                          }
                                          if (indexgrid == 1) {
                                            toDoProvider.addTask2(
                                                index: toDoProvider
                                                    .allTasks2.length,
                                                body: _bodycontrallerW.text);
                                            _bodycontrallerW.clear();
                                          }
                                          if (indexgrid == 2) {
                                            toDoProvider.addTask3(
                                                index: toDoProvider
                                                    .allTasks3.length,
                                                body: _bodycontrallerM.text);
                                            _bodycontrallerM.clear();
                                          }
                                          }
                                          else{
  if (indexgrid == 0) {
                                            toDoProvider.addTask3(
                                                index: toDoProvider
                                                    .allTasks3.length,
                                                body: _bodycontrallerD.text);
                                            _bodycontrallerD.clear();
                                          }
                                          if (indexgrid == 1) {
                                            toDoProvider.addTask2(
                                                index: toDoProvider
                                                    .allTasks2.length,
                                                body: _bodycontrallerW.text);
                                            _bodycontrallerW.clear();
                                          }
                                          if (indexgrid == 2) {
                                            toDoProvider.addTask1(
                                                index: toDoProvider
                                                    .allTasks1.length,
                                                body: _bodycontrallerM.text);
                                            _bodycontrallerM.clear();
                                          }
                                          }
                                          
                                        }
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.plusCircle,
                                        size: 40,
                                        color: Colors.white,
                                      ))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
