import 'package:emaxapp/providers/language_provider.dart';
import 'package:emaxapp/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatTextField extends StatefulWidget {
  final String label;
  final Function onnChanged;
  final TextEditingController controller;

  @override
  CreatTextField({
    Key key,
    this.label,
    this.onnChanged,
    this.controller,
  });

  @override
  State<CreatTextField> createState() => _CreatTextFieldState();
}

class _CreatTextFieldState extends State<CreatTextField> {
  LanguageProvider languageProvider;
  void initState() {
    super.initState();
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);
  }

  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return Container(
      // margin: EdgeInsets.only(top: 5),
      // height: 75,
      width:  MediaQuery.of(context).size.width * 0.2 ,
      child: TextFormField(
        textDirection: languageProvider.isEnglish == true
            ? TextDirection.ltr
            : TextDirection.rtl,
        textAlign: languageProvider.isEnglish == true
            ? TextAlign.left
            : TextAlign.right,
        onChanged: widget.onnChanged,
        controller: widget.controller,
        style: Textfiled.display5(context),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          filled: true,
          fillColor: Colors.white,
          hintText: languageProvider.getTexts("hinttext"),
          hintStyle: Textfiledhint.display5(context),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200], width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[200],
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200], width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
    );
  }
}
