
import 'package:flutter/material.dart';
import 'package:periyar_adminportal/UI%20design/Task/product.dart';
import 'package:periyar_adminportal/UI%20design/Task/tasks.dart';

import 'package:periyar_adminportal/data/models/taskaddmodel.dart';

class item extends StatefulWidget {
  final Product? product;
  final ValueChanged <bool> onSelected;

  const item({
    
    Key? key,
    this.product,
    required this.onSelected,
    
  }) : super(key: key);

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  bool _inSelected= false;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _inSelected=!_inSelected;
          widget.onSelected(_inSelected);
         
        });
      },
      child: Container(
       // margin: EdgeInsets.all(16),
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(microseconds: 400),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: _inSelected ? Border.all(
                  width: 2.0,
                  color: Colors.amber,
                ):Border.all(
                  width: 2.0,
                  color: Colors.white,
                ),
              ),
              child: Icon(
                widget.product!.icondata,
                size: 50,
              ),
            ),
            SizedBox(height: 10,),
            Text(widget.product!.title,),
            
          ],
        ),
      ),
    );
  }
}