import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:periyar_adminportal/UI%20design/Profile/Profile.dart';

import 'package:periyar_adminportal/UI%20design/Task/tasks.dart';
import 'package:periyar_adminportal/UI%20design/Task/viewtask.dart';
import 'package:periyar_adminportal/UI%20design/Users/userdemo.dart';
import 'package:periyar_adminportal/UI%20design/loginpage.dart';
import 'package:periyar_adminportal/bloc/taskall.dart';
import 'package:periyar_adminportal/bloc/taskdelete.dart';
import 'package:periyar_adminportal/data/models/AllTaskModel.dart';

import '../../bloc/logoutbloc.dart';
import '../loadingscreen.dart';


class HomeDD extends StatefulWidget {
  const HomeDD({Key? key}) : super(key: key);

  @override
  State<HomeDD> createState() => _HomeDDState();
}

class _HomeDDState extends State<HomeDD> {
  void initState() {
    super.initState();

    BlocProvider.of<AllTaskBloc>(context).add(CheckAllTask());
  }
  var d1 = new DateFormat('dd');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Periyar"),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                
                  textTheme: TextTheme().apply(bodyColor: Colors.black),
                  dividerColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.black)), //3 dots color
              child: PopupMenuButton<int>(
                color: Colors.black, //full body or pop window color
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                      value: 0, child: Text("Profile")),
                  PopupMenuItem<int>(value: 1, child: Text("View Employee Profile")),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<LogBloc>(context)
                                  .add(CheckLOGOUT());
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
                            },
                            // color: Colors.black,
                            // height: 30,
                            // minWidth:10,
                            // minWidth: MediaQuery.of(context).size.width,
                            //style: ButtonStyle(
                            //backgroundColor:(Colors.),),
                            child: BlocConsumer<LogBloc, LogState>(
                              builder: (context, state) {

                                  return Text(
                                    "Logout",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  );

                              },
                              listener: (context, state) {
                                if (state is LogoutChecked) {
                                  Navigator.pop(context);
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      LoginPage()), (Route<dynamic> route) => false);
                                } else if (state is LogoutError) {
                                  Navigator.pop(context);
                                  Fluttertoast.showToast(

                                    msg: state.error,
                                  );
                                }
                                else if(state is CheckingLogout){
                                  Loading.showLoading(context);
                                }
                              },
                            ),
                          ),

                          // Icon(
                          //   Icons.logout,
                          //   color: Colors.white,
                          // ),
                        ],
                      )),

                ],
                onSelected: (item) => SelectedItem(context, item),
              ),
            ),
          ],
          elevation: 1,
          backgroundColor: Colors.grey[100],
          bottom: TabBar(
            indicatorColor: Colors.yellow[700],
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Ranger",
              ),
              Tab(
                text: "Staffs",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
//------------------------ Home page listview builder-------------------------------------------------------------

                  child: BlocBuilder<AllTaskBloc, AllTaskState>(
                      builder: (context, state) {
                        if (state is AllTaskChecked) {
                          return ListView.builder(
                            
                              shrinkWrap: true,
                              itemCount: state.alltaskModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CardTile(
                                  datafromTile:state.alltaskModel.data![index] ,
                                  title: state.alltaskModel.data![index].taskName.toString(),
                                  subtitle: state.alltaskModel.data![index].task.toString(),
                                  date: d1.format(DateTime.parse(
                                      state.alltaskModel.data![index].taskAssignedTo
                                          .toString())),

                                );

                              }
                          );



                        }
                        else if (state is AllTaskError) {
                          return Text(state.error);
                        } else {
                          return Center(child: Container(child: CupertinoActivityIndicator(
                            radius: 30,
                            color: Color(0xfffad249),
                          )));
                        }
                      }
                  ),

                ),

              ],
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 40,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Card(
                            clipBehavior: Clip.values[3],
                            borderOnForeground: false,
                            margin: EdgeInsets.all(3),
                            color: Colors.grey[100],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Flexible(
                                    //flex: 2,
                                      child: Text(
                                        "Task  $index",
                                        style: TextStyle(color: Colors.black),
                                        maxLines: 5,
                                        overflow: TextOverflow.fade,
                                      )),
                                ),

                                //Spacer(flex: 3,),
                                // Spacer(),
                                // Spacer(),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.2,
                                  height:
                                  MediaQuery.of(context).size.height * 0.12,
                                  color: Colors.yellow[
                                  700], //alignment: Alignment.bottomRight,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "$index",
                                            style: TextStyle(
                                                fontSize: 45,
                                                color: Colors.grey[900]),
                                          )),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Icon(
                                            Icons.calendar_month_rounded,
                                            size: 20,
                                          ))
                                    ],
                                  ),
                                ),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(2),
                                //   child: Card(color: Color(0xffFFD233),
                                //     child: Text("$index",style: TextStyle(fontSize: 80,),),
                                // )
                                // )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 40,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Card(
                            clipBehavior: Clip.values[2],
                            borderOnForeground: false,
                            margin: EdgeInsets.all(3),
                            color: Colors.grey[100],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Flexible(
                                    //flex: 2,
                                      child: Text(
                                        "Task  $index",
                                        style: TextStyle(color: Colors.black),
                                        maxLines: 5,
                                        overflow: TextOverflow.fade,
                                      )),
                                ),

                                //Spacer(flex: 3,),
                                // Spacer(),
                                // Spacer(),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.2,
                                  height:
                                  MediaQuery.of(context).size.height * 0.12,
                                  color: Colors.yellow[
                                  700], //alignment: Alignment.bottomRight,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "$index",
                                            style: TextStyle(
                                                fontSize: 45,
                                                color: Colors.grey[900]),
                                          )),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Icon(
                                            Icons.calendar_month_rounded,
                                            size: 20,
                                          ))
                                    ],
                                  ),
                                ),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(2),
                                //   child: Card(color: Color(0xffFFD233),
                                //     child: Text("$index",style: TextStyle(fontSize: 80,),),
                                // )
                                // )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )
          ],
        ),
        // bottomNavigationBar: BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   color: Colors.grey[100],

        // ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.yellow[700],
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => tasks()));
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Profile()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => userdemo()));
        break;
    }
  }
}

//----------------------------------Card Weidget------------------------------------------------------
class CardTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String date;
  final Data? datafromTile;
  const CardTile({
    Key? key,
    required this.title,this.datafromTile,
    required this.subtitle,
    required this.date,
  }) : super(key: key);

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ViewTask(data:widget.datafromTile )));
        },
        onLongPress: (){
          showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Do you want to Delete it?"),
          content: Text("True or false"),
          actions: [
            MaterialButton(
                onPressed: () {
                BlocProvider.of<TaskDeleteBloc>(context).add(CheckTaskDelete(
                  id: widget.datafromTile!.id!,
                )
                );
                //BlocProvider.of<AllTaskBloc>(context).add(CheckAllTask());
                
                
              },
              child: BlocConsumer<TaskDeleteBloc, TaskDeleteState>(
                        builder: (context, state) {

                            return Text(
                              "ok",
                              //style: TextStyle(fontSize: 14),
                            );

                        },
                        listener: (context, state) {
                          if (state is TaskDeleteChecked) {
                            BlocProvider.of<AllTaskBloc>(context).add(CheckAllTask());
                            Navigator.pop(context);
                             Navigator.pop(context);
                            

                          } else if (state is TaskDeleteError) {
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                              msg: state.error,
                            );
                          }
                          else if(state is CheckingTaskDelete){
                            Loading.showLoading(context);
                          }
                        },
                      ),
                          
            
            ),
            MaterialButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    
        },
        child: Card(
          
          clipBehavior: Clip.values[2],
          borderOnForeground: false,
          margin: EdgeInsets.all(5),
          color: Colors.grey[100],
          child: InkWell(
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            widget.subtitle,
                            style: TextStyle(color: Colors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ))
                    ],
                  ),
                ),
                
                //Spacer(flex: 3,),
                // Spacer(),
                // Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.12,
                  color:widget.datafromTile!.taskStatus==('Delayed')?Colors.red:widget.datafromTile!.taskStatus==('Pending')?Colors.blue:Colors.yellow.shade700, //alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.date,
                            style: TextStyle(fontSize: 45, color: Colors.grey[900]),
                          )),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.calendar_month_rounded,
                            size: 20,
                          ))
                    ],
                  ),
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(2),
                //   child: Card(color: Color(0xffFFD233),
                //     child: Text("$index",style: TextStyle(fontSize: 80,),),
                // )
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}