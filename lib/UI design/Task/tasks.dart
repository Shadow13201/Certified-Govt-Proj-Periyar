import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:periyar_adminportal/UI%20design/DD%20AFD/HomeDD.dart';
import 'package:periyar_adminportal/UI%20design/Task/item.dart';
import 'package:periyar_adminportal/UI%20design/Task/product.dart';
import 'package:periyar_adminportal/UI%20design/Task/taskpack.dart';
import 'package:intl/intl.dart';
import 'package:periyar_adminportal/bloc/taskadd.dart';
import 'package:periyar_adminportal/bloc/taskall.dart';

import '../../bloc/allprofilebloc.dart';
import '../loadingscreen.dart';

class tasks extends StatefulWidget {
  const tasks({Key? key}) : super(key: key);

  @override
  State<tasks> createState() => _tasksState();
}

String? ddate;
String cdate = DateTime.now().toString();
List<SubDescription> susu = [];
List<Product> pickItems = [];
List<String> ids = [];
List<TaskPackage> dispTask = [];
final fieldText = TextEditingController();

//List<String> idd = ['62ad7687ab2f769b29c1efd5',"62aec4d20bcf223acf1b32e2"];
var d1 = new DateFormat('dd/MM/yyyy');

class _tasksState extends State<tasks> {
  @override
  var addNewFeatureController1 = TextEditingController();
  var addTitle = TextEditingController();
  var addDiscription = TextEditingController();

  void clearText() {
    addNewFeatureController1.clear();
    addTitle.clear();
    addDiscription.clear();
  }

  DateTime? _dateTimefrom;
  DateTime? _dateTimeto;

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Task',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      //bottom navigation bar---------------------------------------------------------------------------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 20.0),
        child: MaterialButton(
          minWidth: double.infinity,
          onPressed: () {
            BlocProvider.of<TaskaddBloc>(context).add(CheckTaskadd(
              taskName: addTitle.text,
              employeeId: ids,
              task: addDiscription.text,
              fromDate: _dateTimefrom.toString(),
              toDate: _dateTimeto.toString(),
            ));
          },
          child: BlocConsumer<TaskaddBloc, TaskaddState>(
            builder: (context, state) {
              if (state is CheckingTaskadd) {
                return CircularProgressIndicator();
              } else {
                return Text(
                  "OK",
                  style: TextStyle(fontSize: 14),
                );
              }
            },
            listener: (context, state) {
              if (state is TaskaddChecked) {
                BlocProvider.of<AllTaskBloc>(context).add(CheckAllTask());
                clearText();
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDD(),
                    ));
              } else if (state is TaskaddError) {
                Fluttertoast.showToast(
                  msg: state.error,
                );
              }
            },
            // color: const Color(0xFF68D389),
          ),
          color: Colors.yellow[700],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.black,
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ],
              controller: addTitle,
              style: TextStyle(color: Colors.black),
              decoration: new InputDecoration(
                label: Text('Title'),
                focusColor: Colors.black,
                labelStyle: TextStyle(color: Colors.black),
                //enabledBorder: InputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              cursorColor: Colors.black,
              controller: addDiscription,
              maxLines: 5,
              style: TextStyle(color: Colors.black),
              decoration: new InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.2),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  gapPadding: 4.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.2),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  gapPadding: 4.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.2),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  gapPadding: 4.0,
                ),
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: susu.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        //Text('data'),
                        Text(susu[index].SubDes.toString()),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 100,
                          width: double.infinity,
                          child: Wrap(
                            children: [
                              ...List.generate(
                                  pickItems.length,
                                  (index) => Container(
                                      child: PickNewItem(
                                          title: pickItems[index].title))),
                            ],
                          ),
                        ),
                        //Text(susu[1].toString()),
                      ],
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  child: Text('Add People'),
                  onPressed: () {
                    BlocProvider.of<AllprofileBloc>(context)
                        .add(CheckAllprofile());
                    showModalBottomSheet<void>(
                      enableDrag: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                //TextTextForm(addNewFeatureController1),
                                //print('robo1'),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: SingleChildScrollView(
                                    physics: ScrollPhysics(
                                        parent: NeverScrollableScrollPhysics()),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        //add tiles

                                        BlocConsumer<AllprofileBloc,
                                            AllprofileState>(
                                          builder: (context, state) {
                                            return GridView.count(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 5,
                                              crossAxisSpacing: 5,
                                              shrinkWrap: true,
                                              physics: ScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                ...List.generate(
                                                  profileList.length,
                                                  (index) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: item(
                                                      product:
                                                          profileList[index],
                                                      onSelected: (bool value) {
                                                        if (value) {
                                                          //add items
                                                          pickItems.add(
                                                              profileList[
                                                                  index]);
                                                        } else {
                                                          pickItems.remove(
                                                              profileList[
                                                                  index]);
                                                        }
                                                        //passfunction
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                          listener: (context, state) {
                                            if (state is AllprofileChecked) {
                                              for (int i = 0;
                                                  i < state.allprofile.length;
                                                  i++) {
                                                profileList.add(Product(
                                                    state.allprofile[i].userid!,
                                                    state.allprofile[i].name!,
                                                    CupertinoIcons
                                                        .person_alt_circle_fill));
                                              }
                                              setState(() {
                                                // BlocProvider.of<AllprofileBloc>(context).add(CheckAllprofile());
                                              });
                                              // BlocProvider.of<AllprofileBloc>(context).add(CheckAllprofile());
                                              // Navigator.pop(context);
                                              //  Navigator.pop(context);

                                            } else if (state
                                                is AllprofileError) {
                                              Navigator.pop(context);
                                              Fluttertoast.showToast(
                                                msg: state.error,
                                              );
                                            } else if (state
                                                is CheckingAllprofile) {
                                              Loading.showLoading(context);
                                            }
                                          },
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          height: 100,
                                          width: double.infinity,
                                          child: Wrap(
                                            children: [
                                              ...List.generate(
                                                  pickItems.length,
                                                  (index) => Container(
                                                        child: PickNewItem(
                                                            title: ids[index]),
                                                      )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  color: Colors.amber,
                                  child: Container(
                                      width: double.infinity,
                                      child: Center(
                                          child: const Text('ok',
                                              style: TextStyle(
                                                color: Colors.black,
                                              )))),
                                  onPressed: () {
                                    ids.clear();
                                    for (int i = 0; i < pickItems.length; i++) {
                                      ids.add(pickItems[i].id);
                                    }

                                    setState(() {
                                      susu.add(SubDescription(
                                          addNewFeatureController1.text, ids));
                                    });

                                    //pickItems.clear();
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                MaterialButton(
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                        builder: (context, child) {
                          return Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                primary: Colors.yellow.shade700, // <-- SEE HERE
                                //onPrimary: Colors.white, // <-- SEE HERE
                                //onSurface: Colors.blueAccent, // <-- SEE HERE
                              )),
                              child: child!);
                        }).then(((date) => setState(() {
                          _dateTimefrom = date;

                          // for (int i=0;i<=10;i++){
                          //   ddate
                          // }
                        })));
                  },
                  child: Text(_dateTimefrom == null
                      ? 'From Date'
                      : d1.format(DateTime.parse(_dateTimefrom.toString()))),
                  color: _dateTimefrom == null
                      ? Colors.yellow[700]
                      : Colors.grey[300],
                ),
                MaterialButton(
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                        builder: (context, child) {
                          return Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                primary: Colors.yellow.shade700, // <-- SEE HERE
                                //onPrimary: Colors.white, // <-- SEE HERE
                                //onSurface: Colors.blueAccent, // <-- SEE HERE
                              )),
                              child: child!);
                        }).then(((date) => setState(() {
                          _dateTimeto = date;

                          // for (int i=0;i<=10;i++){
                          //   ddate
                          // }
                        })));
                  },
                  child: Text(
                    _dateTimeto == null
                        ? 'To Date'
                        : d1.format(DateTime.parse(_dateTimeto.toString())),
                  ),
                  color: _dateTimeto == null
                      ? Colors.yellow[700]
                      : Colors.grey[300],
                ),
              ],
            ),

            //-----------------  //Ok page to disp mode-------------------------------------------------------
            //                     MaterialButton(
            //                       minWidth:  double.infinity,
            //                       onPressed: (){
            //                       BlocProvider.of<TaskaddBloc>(context).add(CheckTaskadd(

            //                   taskName: addTitle.text,
            //                   employeeId: idd,
            //                   task: addDiscription.text,
            //                   fromDate: _dateTimefrom.toString(),
            //                   toDate: _dateTimeto.toString(),
            //                  ));

            //                      },

            //                     child: BlocConsumer<TaskaddBloc, TaskaddState>(
            //               builder: (context, state) {
            //                 if (state is CheckingTaskadd) {
            //                   return Container(

            //                     child: CircularProgressIndicator(),
            //                   );
            //                 } else {

            //                   return Text(
            //                     "OK",
            //                     style: TextStyle(fontSize: 14),
            //                   );
            //                 }
            //               },
            //               listener: (context, state) {
            //                 if (state is TaskaddChecked) {

            // BlocProvider.of<AllTaskBloc>(context).add(CheckAllTask());

            //                  Navigator.pop(context, MaterialPageRoute(builder: (context)=>HomeDD(),

            //                  )
            //                  );
            //                 } else if (state is TaskaddError) {
            //                   Fluttertoast.showToast(
            //                     msg: state.error,
            //                   );
            //                 }
            //               },
            //               // color: const Color(0xFF68D389),
            //             ),
            //                     color: Colors.yellow[700],
            //                     )

            //-------------------------------------------------------------------------------------
          ],
        ),
      )),
    );
  }
}

class PickNewItem extends StatelessWidget {
  final String title;

  const PickNewItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(this.title),
      backgroundColor: Colors.amber,
    );
  }
}

Widget TextTextForm(addNewFeatureController1) {
  return TextFormField(
    controller: addNewFeatureController1,
    minLines: 2,
    maxLines: 10,
    style: TextStyle(color: Colors.black),
    decoration: new InputDecoration(
      hintText: 'Sub-Description',
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 1.2),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        gapPadding: 4.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 1.2),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        gapPadding: 4.0,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 1.2),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        gapPadding: 4.0,
      ),
    ),
  );
}

class SubDescription {
  String? SubDes;
  List<String> id = [];

  SubDescription(this.SubDes, this.id);
}
