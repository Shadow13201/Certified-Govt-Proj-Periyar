import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:periyar_adminportal/data/models/WorkProfileModel.dart';

class FullProfile extends StatefulWidget {
  final WorkProfileModel workProfileModel;
  const FullProfile({Key? key,required this.workProfileModel}) : super(key: key);

  @override
  State<FullProfile> createState() => _FullProfileState();
}

class _FullProfileState extends State<FullProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFD233),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(

            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text("name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 33),)

                  ]),
              Text("Designation",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("Task Completed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          SizedBox(height: MediaQuery.of(context).size.height/50,),
                          SizedBox(
                          height: 90,
                          width: 90,
                          child: CircleAvatar(
                            backgroundColor: Color(0xffFFD233),
                            child: Text(widget.workProfileModel.taskcompletedlength.toString(),
                              style: TextStyle(
                                  fontSize: 30,color: Colors.black),),

                          ),
                    ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text("Ongoing Task",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          SizedBox(height: MediaQuery.of(context).size.height/50,),
                          SizedBox(
                            width: 90,
                            height: 90,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(widget.workProfileModel.taskongoinglength.toString(),
                                style: TextStyle(
                                    fontSize: 30,color: Colors.black),),

                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text("Task Delayed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                          SizedBox(height: MediaQuery.of(context).size.height/50,),
                          SizedBox(
                            width: 90,
                            height: 90,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Text(widget.workProfileModel.taskdelayedlength.toString(),
                                style: TextStyle(
                                    fontSize: 30,color: Colors.black),),

                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 20,
                      ),


                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
