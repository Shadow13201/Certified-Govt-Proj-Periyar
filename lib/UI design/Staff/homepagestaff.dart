import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:periyar_adminportal/UI%20design/DD%20AFD/HomeDD.dart';
import 'package:periyar_adminportal/UI%20design/bill/staffbill.dart';

import '../../bloc/logoutbloc.dart';
import '../Profile/Profile.dart';
import '../loadingscreen.dart';
import '../loginpage.dart';
import '../stepper/updates.dart';
class homestaff extends StatefulWidget {
  const homestaff({Key? key}) : super(key: key);

  @override
  _homestaffState createState() => _homestaffState();
}

class _homestaffState extends State<homestaff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("HOME",style: TextStyle(color: Colors.black),),backgroundColor: Color(0xffFFD233),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: TextTheme().apply(bodyColor: Colors.black),
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black)),//3 dots color
            child: PopupMenuButton<int>(
              color: Colors.black,//full body or pop window color
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0,
                    child: Text("profile                ")),
                PopupMenuItem<int>(
                    value: 1,
                    child: Text("edit profile")),
                PopupMenuItem(
                    value: 2,
                    child: Text("Bill Upload")),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                    value: 3,
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
      ),
      // drawer: Drawer(
      //   child: Scaffold(
      //     body: ListView(
      //       children: [
      //         DrawerHeader(child: CircleAvatar(
      //           backgroundImage: AssetImage("assets/Mohanlal.png"),
      //         )),
      //         InkWell(onTap: (){
      //           Navigator.push(context,MaterialPageRoute(builder: (context)=>rangerHome()));
      //         },
      //           child: ListTile(
      //             title: Text("Profile"),
      //             tileColor: Color(0xffFFD233),
      //           ),
      //         )
      //       ],
      //     ),
      //     bottomNavigationBar: Container(
      //       color: Color(0xffFFD233),
      //       child: Row(
      //         children: [
      //           IconButton(color: Colors.black,
      //               onPressed: (){}, icon: Icon(Icons.logout)),
      //           Spacer(),
      //           IconButton(color: Colors.black,
      //               onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Updates()));}, icon: Icon(Icons.settings)),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body:
      Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,

                  itemCount: 40,

                  itemBuilder: (BuildContext context,int index){

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("5:00pm"),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                ),
                              )
                            ],

                          ),
                          Card(
                            color: Color(0xffE5E5E5),
                            child: Row(
                              children: [
                                Flexible(child: Text("Task will be displayed with details provided by the admin.",style: TextStyle(color: Colors.black,fontSize: 20),maxLines: 5,overflow: TextOverflow.fade,)),

                                SizedBox(
                                  width: 5,
                                  height: 5,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: Card(color: Color(0xffFFD233),
                                    child: Text("07",style: TextStyle(fontSize: 80,),),

                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      )
      ,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xffffffff),
        child: Container(
          height: MediaQuery.of(context).size.height*0.070,
        ),
      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.add),backgroundColor: Color(0xffFFD233), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Profile()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Staffbill()));
        break;
      case 1:
        print("Privacy Clicked");
        break;
    }
  }

}
