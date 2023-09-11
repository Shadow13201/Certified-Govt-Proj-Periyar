import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyar_adminportal/bloc/profilebloc.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void initState(){


    super.initState();

    BlocProvider.of<ProfileBloc>(context).add(CheckProfile(
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Profile",style: TextStyle(color: Colors.black),),
          backgroundColor: Color(0xffFFD233),
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<ProfileBloc,ProfileState>(
            builder: (context,state){
              if(state is ProfileChecked) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,15,9,9),
                    child: Container(
                      child:
                      Column(
                        children: [


                          //Center(child: Text("MY PROFILE",style: TextStyle(fontSize: 20))),
                          // Divider(
                          //   thickness: 2,
                          //
                          // ),
                          SizedBox(
                            height: 10,
                          ),SizedBox(

                            height: 200,

                            child: Stack(

                              children: [

                                const CircleAvatar(

                                  radius: 100,

                                  backgroundImage: AssetImage('assets/periyaar.png'),

                                ),
                                // Positioned(
                                //
                                //     right: 10,
                                //
                                //     top: 150,

                                    // child: IconButton(
                                    //
                                    //   onPressed: () {},
                                    //
                                    //   icon: const Icon(
                                    //
                                    //     Icons.camera_alt,
                                    //
                                    //     size: 40,
                                    //
                                    //
                                    //   ),
                                    //
                                    // ))



                              ],

                            ),

                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*0.60,
                                color: Color(0xffFFFFFF),

                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(

                                      children: [
                                        Icon(Icons.account_box),

                                        Column(


                                          children: [

                                            SizedBox(
                                              width: 122,
                                            ),
                                            Text("Name:",style: TextStyle(fontSize: 20)),

                                            Text(state.profileModel.user!.name!,style: TextStyle(fontSize: 18),),
                                            // Text("This is not your username or pin."
                                            //     "This name will be visible to your SuperAdmin and DeputyManager"),
                                          ],

                                        ),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        // Icon(Icons.edit)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Divider(
                                        height: 5,
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(

                                      children: [
                                        Icon(Icons.mail),
                                        SizedBox(
                                          width: 40,
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,


                                          children: [

                                            SizedBox(
                                              width: 122,
                                            ),
                                            Text("Email:",style: TextStyle(fontSize: 20)),


                                            Row(
                                              children: [

                                                Text(state.profileModel.user!.email!,style: TextStyle(fontSize: 18),),
                                              ],
                                            ),
                                          ],

                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        //Icon(Icons.edit,)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:60.0),
                                      child: Divider(
                                        height: 5,
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(

                                      children: [
                                        Icon(Icons.location_city_outlined),
                                        SizedBox(
                                          width: 40,
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,


                                          children: [

                                            SizedBox(
                                              width: 122,
                                            ),
                                            Text("City:",style: TextStyle(fontSize: 20)),


                                            Row(
                                              children: [

                                                Text(state.profileModel.user!.city!.toString(),style: TextStyle(fontSize: 18),),
                                              ],
                                            ),
                                          ],

                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:60.0),
                                      child: Divider(
                                        height: 5,
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(

                                      children: [
                                        Icon(Icons.phone),
                                        SizedBox(
                                          width: 40,
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,


                                          children: [

                                            SizedBox(
                                              width: 122,
                                            ),
                                            Text("Phone:",style: TextStyle(fontSize: 20)),


                                            Row(
                                              children: [

                                                Text(state.profileModel.user!.phoneNumber!.toString(),style: TextStyle(fontSize: 18),),
                                              ],
                                            ),
                                          ],

                                        ),
                                        SizedBox(
                                          width: 110,
                                        ),
                                        //Icon(Icons.edit)
                                      ],
                                    ),

                                  ],
                                ),

                              ),
                            ),
                          )


                        ],

                      ),
                    ),
                  ),
                ) ;
              }
              else if(state is CheckingProfile) {
                return Center(child: CupertinoActivityIndicator(
                  radius: 30,
                  color: Color(0xfffad249),
                ));
              }
              else {
                return Container();
              }
            }
        )
    );
  }


}