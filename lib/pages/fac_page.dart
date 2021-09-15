import 'package:celta/models/fac.dart';
import 'package:celta/src/widgets/fac_widget.dart';
import 'package:flutter/material.dart';

class FacPage extends StatefulWidget {
  FacPage({Key? key}) : super(key: key);

  @override
  _FacPageState createState() => _FacPageState();
}

class _FacPageState extends State<FacPage> {
  List<Fac>? fac;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FacWidget(),
        ],
      ),
    );
  }
}
