import 'package:flutter/material.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Bottom Sheet'),
        actions: [
          IconButton(icon: Icon(Icons.open_in_new), onPressed: showBottomSheet)
        ],
      ),
      body: Container(),
    );
  }

  void showBottomSheet() => showModalBottomSheet(
    enableDrag: false,
    isDismissible: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    barrierColor: Colors.orange.withOpacity(0.2),
    context: context, 
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share'),
          onTap: () {
            Navigator.of(context).pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.link),
          title: Text('Copy link'),
          onTap: () {},
        ),
      ],
    ),
  );
}