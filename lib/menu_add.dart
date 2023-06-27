import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/bloc/message.dart';
import 'package:maimaid_api_test/library/widget/ui/input.dart';
import 'package:maimaid_api_test/library/widget/ui/text.dart';
import 'package:maimaid_api_test/menu_first.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController job = TextEditingController();
  final Message msg = Get.find();

  Future<void> _create(Map<String, dynamic> inputData) async {
    const apiUrl = 'https://reqres.in/api/users';
    var result = await http.post(Uri.parse(apiUrl), body: inputData);
    log('Response status: ${result.statusCode}');
    log('Response body: ${result.body}');
    if (result.statusCode == 201) {
      msg.okDialog("Data has been added\n Status code: ${result.statusCode}\nResponse: ${result.body}", callback: () {
        Get.off(() => const FirstPage());
      });
    } else {
      msg.okDialog("Failed to add data", title: "Failure", callback: () => Get.back());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wege - Add'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const Titles("Add new data"),
                InputText(label: "First name:", ctrl: firstName),
                InputText(label: "Last name:", ctrl: lastName),
                InputText(label: "Job:", ctrl: job),
              ],
            ),
            //Edit button
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.lightBlueAccent,
                    elevation: 7.0,
                    mini: false,
                    onPressed: () async {
                      if (firstName.text.isEmpty) {
                        msg.warnTop("First name can't be empty", context, () {
                          Get.back();
                        });
                      } else {
                        if (lastName.text.isEmpty) {
                          msg.warnTop("Last name can't be empty", context, () {
                            Get.back();
                          });
                        } else {
                          if (job.text.isEmpty) {
                            msg.warnTop("job can't be empty", context, () {
                              Get.back();
                            });
                          } else {
                            Map<String, dynamic> data = {
                              "name": "${firstName.text} ${lastName.text}",
                              "job": job.text,
                            };
                            await _create(data);
                          }
                        }
                      }
                    },
                    child: const Icon(Icons.edit, color: Colors.white),
                  ),
                  const SizedBox(height: 30.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
