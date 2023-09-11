import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Staffbill extends StatefulWidget {
  const Staffbill({Key? key}) : super(key: key);

  @override
  State<Staffbill> createState() => _StaffbillState();
}

class _StaffbillState extends State<Staffbill> {
  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BILL UPLOAD"),
        backgroundColor: Color(0xffFFD233),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          ListView.builder(
              shrinkWrap: true,

              itemCount: 3,

              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    color: Color(0xffE5E5E5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BILL NO:",style: TextStyle(fontSize: 15),),
                        SizedBox(
                          height: 20,
                        ),
                        Text("DESCRIPTION:",style: TextStyle(fontSize: 15),),
                        SizedBox(
                          height: 20,
                        ),
                        Text("STATUS:",style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                );

              }
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xffffffff),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.050,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xffFFD233),
          onPressed: () {
            openDialog();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget CustomButton({
    required String title,
    required IconData icon,
    required VoidCallback onClick,
  }) {
    return Container(
      width: 200,
      child: ElevatedButton(
          onPressed: onClick,
          child: Row(
            children: [Icon(icon), Text(title)],
          )),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text('Bill'),
            content: Container(
                width: MediaQuery.of(context).size.width * 1.2,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                          label: Text('BILL NO'),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.2),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                            gapPadding: 4.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.2),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                            gapPadding: 4.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                          label: Text('DESCRIPTION'),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.2),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                            gapPadding: 4.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.2),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                            gapPadding: 4.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                          label: Text('BILL AMOUNT'),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.2),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                            gapPadding: 4.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.2),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                            gapPadding: 4.0,
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      title: 'UPLOAD',
                      icon: Icons.image_outlined,
                      onClick: () {
                        getImage(ImageSource.gallery)
                            .then((value) => setState(() {}));
                      },
                    ),
                    CustomButton(
                        title: 'OPEN CAMERA',
                        icon: Icons.camera,
                        onClick: () {
                          getImage(ImageSource.camera)
                              .then((value) => setState(() {}));
                        }),
                    _image != null
                        ? Image.file(
                      _image!,
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                    )
                        : Text("pls upload the image"),
                  ],
                )),
            actions: [TextButton(onPressed: () {}, child: Text("submit"))],
          ),
        );
      }));
}

