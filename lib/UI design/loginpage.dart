
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:periyar_adminportal/UI%20design/DD%20AFD/HomeDD.dart';
import 'package:periyar_adminportal/UI%20design/Hr/hrpage.dart';
import 'package:periyar_adminportal/UI%20design/Staff/homepagestaff.dart';
import 'package:periyar_adminportal/UI%20design/loadingscreen.dart';
import 'package:periyar_adminportal/UI%20design/ranger/Homepageranger.dart';
import 'package:periyar_adminportal/bloc/tokenBlocManaager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/firstbloc.dart';
import '../helper/sharedpreferences.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isObscure = true;


//   @override
  var token=null;
   void initState() {
     super.initState();

   }
   initFunc() async{
     token=await TempStorage.getToken();

   }

//    BlocProvider.of<AuthBloc>(context).add(OtpChecked());

//  }
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
          // height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Container(
              height: MediaQuery.of(context).size.height*0.73,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/peri.png",height: MediaQuery.of(context).size.height*0.73,)),
                Padding(
                  padding: const EdgeInsets.only(left: 55,right: 55),
                  child: Container(
 child: Column(
            children: [

            SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
            ),
            Text(
            "Login",
              style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 38,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              color: Colors.black,
                 // backgroundColor: Color(0xfffad249)
              ),
            ),
              
            SizedBox(height:  MediaQuery.of(context).size.height*0.35,),

              Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: emailController,

                      
                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        label: Text('Username'),
                        prefixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.email),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 1.2),
                          borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                          gapPadding :4.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 1.2),
                          borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                          gapPadding :4.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black,width: 1.2 ),
                          borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                          gapPadding :4.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: TextField(
                        controller: passwordController,
                        obscureText: _isObscure,

                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          prefixIcon: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.password),
                          ),
                          label: Text('Password'),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black,width: 1.2),
                            borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                            gapPadding :10.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black,width: 1.2 ),
                            borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                            gapPadding :10.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 1.2),
                            borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                            gapPadding :10.0,
                          ),
                        ),
                      ),
                      
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    child:MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                      ),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(CheckOTP(
                            email: emailController.text,
                            password: passwordController.text, ));
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
                      },
                      color: Color(0xfffad249),
                      height: 50,
                      minWidth: 300,
                      child: BlocConsumer<AuthBloc, AuthState>(
                        builder: (context, state) {

                            return Text(
                              "Log in",
                              style: TextStyle(fontSize: 14),
                            );

                        },
                        listener: (context, state) {
                          if (state is OtpChecked) {
                            Navigator.pop(context);
                            if(state.role == 'Ranger'){
                              {{Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  HomeRanger()), (Route<dynamic> route) => false);}}
                            }
                            else if(state.role =='Staff'){
                              {{Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  homestaff()), (Route<dynamic> route) => false);}}
                            }
                            else if(state.role =='DD'){
                              {Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  HomeDD()), (Route<dynamic> route) => false);}
                            }
                            else if(state.role =='HR'){
                              {Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  HrPage()), (Route<dynamic> route) => false);}
                            }

                          } else if (state is OtpError) {
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                              msg: state.error,
                            );
                          }
                          else if(state is CheckingOtp){
                            Loading.showLoading(context);
                          }
                        },
                      ),
                    ),

                  ),

            
            ]
            ),
                  ),
                )
            ],)
            
           
        
            ),
        ),

    ),

    );

  }
}