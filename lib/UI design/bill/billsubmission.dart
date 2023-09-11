import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();

}

class _BillState extends State<Bill> {
  bool valuefirst = false;
  bool valuesecond = false;
  void checkboxCallback(bool? checkboxState) {
    setState(() {
      // Return checkboxState. If it's null, return false
      valuefirst= checkboxState ?? false;
      valuesecond= checkboxState ?? false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
        title: Text("BILL"),titleTextStyle: TextStyle(color: Colors.black,fontSize: 16),
    actions: [
    IconButton(
    onPressed: () {},
    icon: Icon(Icons.more_vert),
    ),
    ],
    backgroundColor: Color(0xffFFD233),bottom: TabBar(
    indicatorColor: Colors.black,
    labelColor: Colors.black,
    tabs: [
    Tab(text: "Bill",),
    ],),
    ),
          body: SingleChildScrollView(
            child:Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(0xfffdfbfb),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Bill number',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Bill Description',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Amount',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height*0.28,
                      width: MediaQuery.of(context).size.width*0.28,
                      child: Image.asset("assets/peri.png",height: MediaQuery.of(context).size.height*0.73,)),
                  ButtonBar(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: const Text('Approved'),
                  ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Denied'),
                        

                      ),
                ],
              ),

            ],
          )
        )
    )
        )
    )
    );




  }
}
