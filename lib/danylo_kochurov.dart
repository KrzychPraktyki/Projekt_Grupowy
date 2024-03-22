import 'language.dart';
import 'package:flutter/material.dart';
import 'martynaleman.dart';


class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManager();
}

class _TaskManager extends State<TaskManager> {
  bool? isCheked1 = false;
  bool? isCheked2 = false;
  bool? isCheked3 = false;
  bool? isCheked4 = false;
  bool? isCheked5 = false;
  bool? isCheked6 = false;
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themeslist().themeses[themeIndex],
        home:Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(AppLocalization.getTranslatedValue('Task Manager')),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body:Column(children: [
            Row(
              children: [
                if (counter>0) Checkbox(value: isCheked1, onChanged: (newBool){
                  setState(() {isCheked1 = newBool;});}),
                if (counter>0) const SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
              ],
            ),
            Row(
              children: [
                if (counter>1) Checkbox(value: isCheked2, onChanged: (newBool){
                  setState(() {isCheked2 = newBool;});}),
                if (counter>1) const SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
              ],
            ),
            Row(
              children: [
                if (counter>2) Checkbox(value: isCheked3, onChanged: (newBool){
                  setState(() {isCheked3 = newBool;});}),
                if (counter>2) const SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
              ],
            ),
            Row(
              children: [
                if (counter>3) Checkbox(value: isCheked4, onChanged: (newBool){
                  setState(() {isCheked4 = newBool;});}),
                if (counter>3) const SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
              ],
            ),
            Row(
              children: [
                if (counter>4) Checkbox(value: isCheked5, onChanged: (newBool){
                  setState(() {isCheked5 = newBool;});}),
                if (counter>4) const SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
              ],
            ),
            Row(
              children: [
                if (counter>5) Checkbox(value: isCheked6, onChanged: (newBool){
                  setState(() {isCheked6 = newBool;});}),
                if (counter>5) const SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
              ],
            ),

          ],),
          floatingActionButton:Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
            const SizedBox(width: 35,),
            FloatingActionButton(
              onPressed: (){setState((){if(counter==0){null;} else{counter--;}});}, child: const Icon(Icons.remove),),
            const SizedBox(width: 10,),
            FloatingActionButton(
              onPressed: (){setState((){counter=0;});}, child: const Icon(Icons.restart_alt),),
            const SizedBox(width: 10,),
            FloatingActionButton(
              onPressed: (){setState((){counter++;});}, child: const Icon(Icons.add),),
          ],),
        )
    );

  }


}