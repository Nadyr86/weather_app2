import 'dart:math';

import 'package:flutter/material.dart';

class MisalPage extends StatefulWidget {
  const MisalPage({Key? key}) : super(key: key);

  @override
  _MisalPageState createState() => _MisalPageState();
}

class _MisalPageState extends State<MisalPage> {
  @override
  String? _name;

  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  Future<void> getName() async {
    try {
      await Future.delayed(Duration(seconds: 3), () {
        _name = 'Bul name';
      });
      setState(() {}); 
    } catch (e) {
    throw   Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_name ?? 'Nam kele elek'),
      ),
    );
  }
}
