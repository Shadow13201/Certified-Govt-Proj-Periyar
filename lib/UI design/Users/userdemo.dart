import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyar_adminportal/UI%20design/Users/Users.dart';
import 'package:periyar_adminportal/UI%20design/bill/billsubmission.dart';
import 'package:periyar_adminportal/bloc/allprofilebloc.dart';
import 'package:periyar_adminportal/bloc/workprofilebloc.dart';

import 'fullprofile.dart';

class userdemo extends StatefulWidget {
  const userdemo({Key? key}) : super(key: key);

  @override
  State<userdemo> createState() => _userdemoState();
}

class _userdemoState extends State<userdemo> {
  void initState() {
    super.initState();

    BlocProvider.of<AllprofileBloc>(context).add(CheckAllprofile());
  }

  int? number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "STAFF PROFILE",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffFFD233),
        foregroundColor: Colors.black,
      ),
      // drawer: Drawer(
      //   child: Scaffold(
      //     body: ListView(
      //       children: [
      //         DrawerHeader(
      //             child: CircleAvatar(
      //               backgroundImage: AssetImage("assets/prithvi.png"),
      //             )),
      //         ListTile(
      //           title: Text("Profile"),
      //           tileColor: Color(0xffFFD233),
      //         ),
      //       ],
      //     ),
      //     bottomNavigationBar: Container(
      //       color: Color(0xffFFD233),
      //       child: Row(
      //         children: [
      //           IconButton(
      //               color: Colors.black,
      //               onPressed: () {},
      //               icon: Icon(Icons.logout)),
      //           Spacer(),
      //           IconButton(
      //               color: Colors.black,
      //               onPressed: () {},
      //               icon: Icon(Icons.settings)),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: BlocBuilder<AllprofileBloc, AllprofileState>(
        builder: (context, state) {
          if (state is AllprofileChecked) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                                thickness: 0.5,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                              width: 5,
                            ),
                            Text(
                              "RANGER",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 2,
                              width: 5,
                            ),
                            Expanded(
                                child: Divider(
                              color: Colors.black,
                              thickness: 0.5,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CarouselSlider.builder(
                          itemCount: state.ranger.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              state.ranger[itemIndex].role != "Ranger"
                                  ? SizedBox()
                                  : Container(
                                      color: Color(0xffE5E5E5),
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                "assets/raju.png",
                                              ),
                                              radius: 70,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              state.ranger[itemIndex].name!,
                                              style: TextStyle(fontSize: 22.0),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'PHONE NO: ${state.ranger[itemIndex].phoneNumber.toString()}',
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Email: ${state.ranger[itemIndex].email}",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: Row(
                                                children: [
                                                  MaterialButton(
                                                    onPressed: () {},
                                                    color: Color(0xffFFD233),
                                                    child: Text(
                                                      "PERSONAL PROFILE",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  MaterialButton(
                                                    onPressed: () {
print(state.ranger[itemIndex].id.toString());
                                                      BlocProvider.of<WorkBloc>(context).add(CheckWORK(

                                                          id:state.ranger[itemIndex].id.toString()

                                                      ));

                                                    },
                                                    color: Color(0xffFFD233),
                                                    child:
                                                    BlocConsumer<WorkBloc, WorkState>(
                                                      builder: (context, state) {
                                                        if( state is CheckingWork)
                                                          {

                                                            return CircularProgressIndicator();
                                                          }
                                                        else{
                                                          return

                                                            Text(
                                                              "WORK PROFILE",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            );
                                                        }



                                                      },
                                                      listener: (context, state) {

                                                        if( state is WorkChecked)
                                                          {

                                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FullProfile(workProfileModel:state.workProfileModel)));

                                                          }

                                                      },
                                                    ),



                                                    // Text(
                                                    //   "WORK PROFILE",
                                                    //   style: TextStyle(
                                                    //       fontSize: 10,
                                                    //       fontWeight:
                                                    //           FontWeight.bold),
                                                    // ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.35,
                            autoPlay: false,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                                thickness: 0.5,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("STAFF"),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                                thickness: 0.5,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CarouselSlider.builder(
                          itemCount: state.staff.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              state.staff[itemIndex].role != "Staff"
                                  ? Text("Hello")
                                  : Container(
                                      color: Color(0xffE5E5E5),
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                "assets/raju.png",
                                              ),
                                              radius: 70,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              state.staff[itemIndex].name!,
                                              style: TextStyle(fontSize: 22.0),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'PHONE NO: ${state.staff[itemIndex].phoneNumber.toString()}',
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Email: ${state.staff[itemIndex].email}",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: Row(
                                                children: [
                                                  RaisedButton(
                                                    onPressed: () {},
                                                    color: Color(0xffFFD233),
                                                    child: Text(
                                                      "PERSONAL PROFILE",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {


                                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>FullProfile()));
                                                    },
                                                    color: Color(0xffFFD233),
                                                    child: Text(
                                                      "WORK PROFILE",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.35,
                            autoPlay: false,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            );
          } else if (state is AllprofileError) {
            return Text(state.error);
          } else {
            return Center(
                child: Container(
                    child: CupertinoActivityIndicator(
              radius: 30,
              color: Color(0xfffad249),
            )));
          }
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Color(0xffFFD233),
      //   shape: CircularNotchedRectangle(),
      //   child: Container(
      //     height: MediaQuery
      //         .of(context)
      //         .size
      //         .height * 0.06,
      //
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           width: 140,
      //         ),
      //       // TextButton(
      //       //   child: Text(
      //       //     "ListView",
      //       //     style: TextStyle(fontSize: 20),
      //       //   ),
      //       //   onPressed: () {},
      //       //   style: TextButton.styleFrom(
      //       //       primary: Colors.black,
      //       //       elevation: 2,
      //       //       backgroundColor: Color(0xfffad249),),
      //       // ),
      //     ],),
      //   ),
      // ),
      //
    );
  }
}
