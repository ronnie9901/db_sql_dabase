import 'package:db_sql_dabase/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
var controller = Get.put(HomeController());
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Obx(
              () => Column(
            children: [
              Card(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(controller.totalIncome.value.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(controller.totalExpense.value.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              )),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: controller.data[index]['isIncome'] == 1
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                    child: ListTile(
                      leading: Text(controller.data[index]['id'].toString()),
                      title: Text(controller.data[index]['amount'].toString()),
                      subtitle: Text(controller.data[index]['category'].toString()),
                      trailing: IconButton(onPressed: () {

                  controller.remove(int.parse( controller.data[index]['id'].toString()));

                      }, icon: Icon(Icons.delete)),

                    ),
                  ),
                  itemCount: controller.data.length,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(margin: EdgeInsets.only(left: 35),height: 50,width: double.infinity,decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),child:TextButton(onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Add Record'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(controller: controller.txtamount,decoration: InputDecoration(labelText: 'Amount',),keyboardType: TextInputType.number,),
                      TextField(controller: controller.txtcate,decoration: InputDecoration(labelText: 'Category'),),
                      Obx(() => SwitchListTile(
                        title: const Text('Income / Expense'),
                        value: controller.isIncome.value, onChanged: (value) {
                        controller.setIncome(value);
                      },),),
                    ],
                  ),
                  actions: [
                    TextButton(onPressed: () {
                      Get.back();
                    }, child: const Text('Cancel')),
                    TextButton(onPressed: () {
                      double amount = double.parse(controller.txtamount.text);
                      int isIncome = controller.isIncome.value?1:0;
                      String category = controller.txtcate.text;
                      controller.insertRecord(amount,isIncome,category);

                      controller.txtamount.clear();
                      controller.txtcate.clear();
                      controller.setIncome(false);
                      Get.back();
                    }, child: const Text('Save'))
                  ],
                ),
              );
            }, child: Text('add')) ,)

          ],
        ),
        );
  }
}