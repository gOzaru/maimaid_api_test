import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/bloc/message.dart';
import 'package:maimaid_api_test/library/widget/components/decoration.dart';
import 'package:maimaid_api_test/library/widget/components/spacing.dart';
import 'package:maimaid_api_test/library/widget/ui/image.dart';
import 'package:maimaid_api_test/library/widget/ui/input.dart';
import 'package:maimaid_api_test/library/widget/ui/text.dart';
import 'package:maimaid_api_test/menu_first.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.id});
  final int id;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController job = TextEditingController();
  final Message msg = Get.find();

  Future<Map<String, dynamic>> _read() async {
    log(widget.id.toString()); //${widget.id.toString()}
    final apiUrl = 'https://reqres.in/api/users/${widget.id.toString()}';
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)["data"];
  }

  Future<void> _send(Map<String, dynamic> inputData) async {
    final apiUrl = 'https://reqres.in/api/users/${widget.id.toString()}';
    var result = await http.patch(Uri.parse(apiUrl), body: inputData);

    if (result.statusCode == 200) {
      msg.okDialog("Data has been added\n Status code: ${result.statusCode}\nResponse: ${result.body}", callback: () {
        Get.off(() => const FirstPage());
      });
    } else {
      msg.okDialog("Failed", callback: () => Get.back());
    }
    log('Response status: ${result.statusCode}');
    log('Response body: ${result.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wege - Edit'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Read data first
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: FutureBuilder<Map<String, dynamic>>(
                      future: _read(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              padding: const EdgeInsets.all(10),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 10.0,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                  child: SizedBox(
                                    height: 84.0,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              //Album Cover
                                              Stack(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: ImageOnly(url: snapshot.data!['avatar'], isRounded: true),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: Container(
                                                      padding: zero,
                                                      width: 18,
                                                      height: 18,
                                                      decoration: numDecor,
                                                      child: Center(
                                                        child: Titles(
                                                          (index + 1).toString(),
                                                          size: 12.0,
                                                          color: Colors.white,
                                                          align: TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 10.0),
                                              //Information
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Titles("Name: ${snapshot.data!['first_name']} ${snapshot.data!['last_name']}"),
                                                    Subtitle("Email: ${snapshot.data!['email']}"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Edit the current data
                  const Titles("Edit current data"),
                  InputText(label: "First Name:", ctrl: firstName),
                  InputText(label: "Last Name:", ctrl: lastName),
                  InputText(label: "Job:", ctrl: job),
                ],
              ),
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
                        msg.warnTop("First Name can't be empty", context, () {
                          Get.back();
                        });
                      } else {
                        if (lastName.text.isEmpty) {
                          msg.warnTop("Last Name can't be empty", context, () {
                            Get.back();
                          });
                        } else {
                          if (job.text.isEmpty) {
                            msg.warnTop("Job can't be empty", context, () {
                              Get.back();
                            });
                          } else {
                            Map<String, dynamic> data = {
                              "name": "${firstName.text} ${lastName.text}",
                              "job": job.text,
                            };
                            await _send(data);
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
