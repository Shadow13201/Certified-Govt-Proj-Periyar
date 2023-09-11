import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../bloc/logoutbloc.dart';
import '../Profile/Profile.dart';
import '../Task/tasks.dart';
import '../Users/userdemo.dart';
import '../bill/billsubmission.dart';
import '../loadingscreen.dart';
import '../loginpage.dart';

class HrPage extends StatefulWidget {
  const HrPage({Key? key}) : super(key: key);

  @override
  State<HrPage> createState() => _HrPageState();
}

class _HrPageState extends State<HrPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:
        AppBar(
          automaticallyImplyLeading: false,

          iconTheme: IconThemeData(color: Colors.black),

          title: Text("HR HOME"),titleTextStyle: TextStyle(color: Colors.black,fontSize: 18),
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
                      child: Text("Profile")),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Text("Edit profile")),
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
          backgroundColor: Color(0xffFFD233),bottom: TabBar(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          tabs: [
            Tab(text: "Bill pending",),
            Tab(text: "Bill approved",)
          ],),
        ),

        body: TabBarView(
          children: [

            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,

                      itemCount: 40,

                      itemBuilder: (BuildContext context,int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child:
                          Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Color(0xffE5E5E5),
                              elevation: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.photo_album_outlined, size: 30),
                                    title: Text(
                                        'Bill number:12333',
                                        style: TextStyle(fontSize: 15.0)
                                    ), subtitle: Text(
                                        'Bill description',
                                        style: TextStyle(fontSize: 14.0),


                                    ),

                                  ),
                                  ButtonBar(
                                    children: <Widget>[

                                      RaisedButton(
                                        child: const Text('View bill'),
                                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Bill()));
                                        }
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),


                        );

                      }
    )
      ),


    ]
    ),
            Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,

                          itemCount: 40,

                          itemBuilder: (BuildContext context,int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child:
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: Color(0xffE5E5E5),
                                  elevation: 10,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const ListTile(
                                        leading: Icon(Icons.photo_album_outlined, size: 30),
                                        title: Text(
                                            'Bill number:12333',
                                            style: TextStyle(fontSize: 15.0)
                                        ),
                                        subtitle: Text(
                                            'Approved Status',
                                            style: TextStyle(fontSize: 14.0)
                                        ),
                                      ),
                                      ButtonBar(
                                        children: <Widget>[
                                          RaisedButton(
                                            child: const Text('View bill'),
                                            onPressed: () {
                                              /* ... */
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),


                            );

                          }
                      )
                  ),


                ]
            ),
    ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color(0xffffffff),
          child: Row(
            children: [
              IconButton(color: Colors.black,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>userdemo()));}, icon: Icon(Icons.people_outlined)),
              Spacer(),
              IconButton(color: Colors.black,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));}, icon: Icon(Icons.people_outlined)),
              IconButton(color: Colors.black,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>userdemo()));}, icon: Icon(Icons.people_outlined)),
            ],
          ),
        ),

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
        print("Privacy Clicked");
        break;





    }
  }
}


