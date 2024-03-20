import 'package:flutter/material.dart';

class TrzeciaStrona extends StatelessWidget {
  const TrzeciaStrona({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Trzecia Strona'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskManager(),
                ),
              );
            },
            child: const Text('Go to Task Manager'),
          ),
        ),
      ),
    );
  }
}

class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  _TaskManager createState() => _TaskManager();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Menadzer Zadan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
            if (counter>0) SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
          ],
        ),
        Row(
          children: [
            if (counter>1) Checkbox(value: isCheked2, onChanged: (newBool){
              setState(() {isCheked2 = newBool;});}),
            if (counter>1) SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
          ],
        ),
        Row(
          children: [
            if (counter>2) Checkbox(value: isCheked3, onChanged: (newBool){
              setState(() {isCheked3 = newBool;});}),
            if (counter>2) SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
          ],
        ),
        Row(
          children: [
            if (counter>3) Checkbox(value: isCheked4, onChanged: (newBool){
              setState(() {isCheked4 = newBool;});}),
            if (counter>3) SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
          ],
        ),
        Row(
          children: [
            if (counter>4) Checkbox(value: isCheked5, onChanged: (newBool){
              setState(() {isCheked5 = newBool;});}),
            if (counter>4) SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
          ],
        ),
        Row(
          children: [
            if (counter>5) Checkbox(value: isCheked6, onChanged: (newBool){
              setState(() {isCheked6 = newBool;});}),
            if (counter>5) SizedBox(height: 100,width: 300,child: TextField(style: TextStyle(fontSize: 34),),),
          ],
        ),

      ],),
      floatingActionButton:Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
        FloatingActionButton(
          onPressed: (){setState((){if(counter==0){null;} else{counter--;};print(counter);});}, child: Icon(Icons.remove),),
        FloatingActionButton(
          onPressed: (){setState((){counter=0;print(counter);});}, child: Icon(Icons.restart_alt),),
        FloatingActionButton(
          onPressed: (){setState((){counter++;print(counter);});}, child: Icon(Icons.add),),
      ],),
    );
  }


}