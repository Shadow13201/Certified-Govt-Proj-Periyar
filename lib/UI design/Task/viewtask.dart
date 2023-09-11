import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:periyar_adminportal/data/models/AllTaskModel.dart';
class ViewTask extends StatefulWidget {
  final Data? data;
  const ViewTask({Key? key,this.data}) : super(key: key);

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  int currentStep = 0;
  var d1 = new DateFormat('dd/MMMM/yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        //title: Text("Task Details"+widget.data!.userid!.district!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        shape: Border(bottom: BorderSide(width: 2,color: Colors.yellow.shade700,)),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:4.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.data!.taskStatus!,style: TextStyle(color: widget.data!.taskStatus==('Delayed')?Colors.red:widget.data!.taskStatus==('Pending')?Colors.blue:Colors.yellow.shade700,fontWeight: FontWeight.w700,fontSize: 16),),
                      Container(
                        
                        child: Text(widget.data!.taskName!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),)),
                    ],
                  ),
                ),
                
               // Text("Description",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(d1.format(DateTime.parse(widget.data!.taskAssignedTo!.toString())),
                      style: TextStyle(color: Colors.red.shade700,fontSize: 16,)),
                    Text(
                      d1.format(DateTime.parse(widget.data!.taskAssigedFrom!.toString())),
                      style: TextStyle(color: Colors.black,fontSize: 16,)),
                    
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Colors.yellow.shade700,
                ),
                Text(widget.data!.task!,style: TextStyle(color: Colors.black,fontSize: 16,)),
                
                Theme(
                  data: ThemeData(
                    colorScheme: const ColorScheme.light(
                      primary: Colors.green
                    )
                  ),
                  child: Stepper(
                    currentStep: currentStep,
                    onStepTapped: (index){
                      setState(() => currentStep = index );
                    },
                    controlsBuilder: (context,_) {
                      return Row(
                        children: <Widget>[
                          TextButton(
                            onPressed: (){ if (currentStep!= 2 ){
                              setState(()=> currentStep++);
                            }},
                            child: const Text('Next'),
                          ),
                          TextButton(
                            onPressed: (){
                              if (currentStep!= 0 ){
                              setState(()=> currentStep--);
                            }},
                            child: const Text('Back'),
                          ),
                        ],
                      );
                    },
                    steps: [
                      Step(isActive: currentStep >= 0,
                          title: Text("Initialized"),
                          content: TextField(style: TextStyle(fontSize: 18)
                          )),
                      Step(isActive: currentStep >= 1,
                          title: Text("Progress Indicator"),
                          content: TextField(
                              style: TextStyle(fontSize: 18)
                          )),
                      Step(isActive: currentStep >= 2,
                          title: Text("Title"),
                          content: TextField(
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/10,
                  color: Color(0xffFFD233),
                    child: Text("Submit",style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                    onPressed: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
