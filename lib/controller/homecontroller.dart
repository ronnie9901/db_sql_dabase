
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../helper/dbhelper.dart';

class HomeController extends GetxController
{

  RxList data = [].obs;
  RxBool isIncome = false.obs;
  RxDouble totalIncome = 0.0.obs;
  RxDouble totalExpense = 0.0.obs;

  var txtamount =TextEditingController();
  var txtcate =TextEditingController();

  @override
  void onInit()
  {
    super.onInit();
    initDb();
  }


  Future initDb()
  async {
    await DbHelper.dbHelper.database;
    await  getRecords();
  }

  Future insertRecord(double amount ,int isIncome,String category)
  async {
    await DbHelper.dbHelper.insertData(amount ,isIncome,category);
    await getRecords();
  }

  Future getRecords()
  async {

    totalExpense.value = 0.0;
    totalIncome.value = 0.0;
    data.value =  await DbHelper.dbHelper.readData();
    for(var i in data)
    {
      if(i['isIncome']==1)
      {
        totalIncome.value = totalIncome.value + i['amount'];
      }
      else
      {
        totalExpense.value = totalExpense.value + i['amount'];
      }
    }

    return data;
  }
  void setIncome(bool value)
  {
    isIncome.value = value;
  }

   Future<void>  remove( int id) async {
     await  DbHelper.dbHelper.removeData(id);
     await  getRecords();
   }



}