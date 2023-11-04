import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdictionaryapp/screen/widgets/definition.dart';

var historyMap = {}.obs;

historyAlertDialog(String title) {
// show the history screen
  Get.dialog(
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              '$title History',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  historyMap.clear();
                  Get.back();
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                ),
              )
            ]),
        body: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    defintionAlertDialog(historyMap.keys.elementAt(index)),
                child: Card(
                  color: Colors.grey,
                  child: ListTile(
                    title: Text(
                      historyMap.keys.elementAt(index),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: historyMap.length,
          ),
        ),
      ),
    ),
  );
}
