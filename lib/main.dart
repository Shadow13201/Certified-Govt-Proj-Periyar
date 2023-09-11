import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyar_adminportal/UI%20design/DD%20AFD/HomeDD.dart';
import 'package:periyar_adminportal/UI%20design/Hr/hrpage.dart';
import 'package:periyar_adminportal/UI%20design/Staff/homepagestaff.dart';
import 'package:periyar_adminportal/UI%20design/Task/tasks.dart';
import 'package:periyar_adminportal/UI%20design/Task/viewtask.dart';
import 'package:periyar_adminportal/UI%20design/Users/userdemo.dart';
import 'package:periyar_adminportal/UI%20design/loginpage.dart';
import 'package:periyar_adminportal/UI%20design/ranger/Homepageranger.dart';
import 'package:periyar_adminportal/UI%20design/stepper/updates.dart';
import 'package:periyar_adminportal/bloc/allprofilebloc.dart';
import 'package:periyar_adminportal/bloc/profilebloc.dart';
import 'package:periyar_adminportal/bloc/taskall.dart';
import 'package:periyar_adminportal/bloc/taskdelete.dart';
import 'package:periyar_adminportal/bloc/workprofilebloc.dart';

import 'package:periyar_adminportal/data/models/AllprofileModel.dart';

import 'package:periyar_adminportal/bloc/taskadd.dart';

import 'bloc/firstbloc.dart';
import 'bloc/logoutbloc.dart';
import 'helper/sharedpreferences.dart';

void main() => runApp(const AppHome());

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var token, role;

  void initState() {

    super.initState();
  }

  getrole() async {
    await first();
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<LogBloc>(create: (context) => LogBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        BlocProvider<AllprofileBloc>(create: (context) => AllprofileBloc()),
        BlocProvider<TaskaddBloc>(create: (context) => TaskaddBloc()),
        BlocProvider<AllTaskBloc>(create: (context) => AllTaskBloc()),
        BlocProvider<TaskDeleteBloc>(create: (context) => TaskDeleteBloc()),
        BlocProvider<WorkBloc>(create: (context) => WorkBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'periyar',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          home: NewHome()),
    );
  }


  first() async {
    token = await TempStorage.getToken();
    role = await TempStorage.getRole();
    if (token != null) {
      if (role == "Staff") {
        return homestaff();
      } else if (role == "Ranger") {
        return HomeRanger();
      } else if (role == "DD") {
        return HomeDD();
      }
    } else if (token == null) {
      return LoginPage();
    }
  }
}


class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  void initState() {

    BlocProvider.of<LogBloc>(context).add(CheckAuth());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocListener<LogBloc,LogState>(
        listener: (context,state){
          if(state is AuthConfirmed){

            if (state.role == "Staff") {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                homestaff()), (Route<dynamic> route) => false);
            } else if (state.role == "Ranger") {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomeRanger()), (Route<dynamic> route) => false);
            } else if (state.role == "DD") {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomeDD()), (Route<dynamic> route) => false);
            }
          }
          else{
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                LoginPage()), (Route<dynamic> route) => false);
          }
        },
        child: Container(),
      ),
    );
  }
}

