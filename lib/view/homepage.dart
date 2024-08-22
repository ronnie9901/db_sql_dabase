import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/homecontroller.dart';
var controller = Get.put(HomeController());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder:(context) => AlertDialog(
            title: Text('Add User'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller.txtamount,
                  decoration: InputDecoration(hintText: ' id'),
                ),



              ],
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancle'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);

                },
                child: Text('Save'),
              )
            ],
          ));

        },
      ),
    );
  }
}


