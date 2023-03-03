import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}


class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: creatExcell,
          child: Text("Create a Sheet"),
        ),
      ),
    );
  }
  Future<void> creatExcell() async{
    final Workbook workbook = Workbook();
    final  List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/tanvir.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes,flush: true);
    OpenFile.open(fileName);
  }
}
