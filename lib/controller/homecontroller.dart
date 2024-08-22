
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../helper/dbhelper.dart';

class HomeController extends GetxController
{

  var txtamount =TextEditingController();
  @override
  void onInit()
  {
    super.onInit();
    initDb();
  }


  Future initDb()
  async {
    await DbHelper.dbHelper.database;
  }

  Future insertRecord()
  async {
    await DbHelper.dbHelper.insertData();
  }

}