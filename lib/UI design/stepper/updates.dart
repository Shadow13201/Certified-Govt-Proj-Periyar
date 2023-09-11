import 'package:flutter/material.dart';

void main() {
  runApp(Updates());
}

class Updates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App Learning',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task updates"),
      ),
      body: Stepper(
        steps:getSteps(),
        currentStep: currentStep,
        onStepTapped: (int step)
        {
          setState(() {
            currentStep = step;
          });
        },
        onStepCancel: ()
        {
          currentStep > 0 ?
          setState(() => currentStep -= 1) : null;
        },
        onStepContinue: ()
        {
          currentStep < 2 ?
          setState(() => currentStep += 1): null;
        },
      ),
    );
  }

  List<Step> getSteps()
  {
    return[
      Step(
        title: new Text('Task details'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Task name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        isActive: currentStep >= 0,
        state: currentStep == 0 ?
        StepState.editing : StepState.complete,
      ),
      Step(
        title: new Text('Task details'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Task name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        isActive: currentStep >= 0,
        state: currentStep == 0 ?
        StepState.editing : StepState.complete,
      ),
      Step(
        title: new Text('Task details'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Task name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        isActive: currentStep >= 0,
        state: currentStep == 0 ?
        StepState.editing : StepState.complete,
      ),
      Step(
        title: new Text('Task details'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Task name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        isActive: currentStep >= 0,
        state: currentStep == 0 ?
        StepState.editing : StepState.complete,
      ),
      Step(
        title: new Text('25% completed'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: '50% completed'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: ''),
            ),
          ],
        ),
        isActive: currentStep >= 1,
        state: currentStep == 1 ?
        StepState.editing : currentStep < 1 ? StepState.disabled: StepState.complete,
      ),
      Step(
        title: new Text("Task completed"),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'time'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'completed'),
            ),
          ],
        ),
        isActive:currentStep >= 2,
        state: currentStep == 2 ?
        StepState.editing : currentStep < 2 ? StepState.disabled: StepState.complete,
      ),
    ];
  }
}