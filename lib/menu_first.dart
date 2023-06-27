import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:maimaid_api_test/bloc/message.dart';
import 'package:maimaid_api_test/library/widget/components/decoration.dart';
import 'package:maimaid_api_test/library/widget/components/spacing.dart';
import 'package:maimaid_api_test/library/widget/ui/image.dart';
import 'package:maimaid_api_test/library/widget/ui/text.dart';
import 'package:maimaid_api_test/menu_add.dart';
import 'package:maimaid_api_test/menu_edit.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final Message msg = Get.find();
  Future<List<dynamic>> _fetchData() async {
    const apiUrl = 'https://reqres.in/api/users?page=2';
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  Future<void> _delData(int index) async {
    final apiUrl = 'https://reqres.in/api/users/${index.toString()}';
    var result = await http.delete(Uri.parse(apiUrl));
    if (result.statusCode == 204) {
      msg.okDialog("Data has been deleted", callback: () {
        Get.off(() => const FirstPage());
      });
    } else {
      msg.okDialog("Failed to delete data", title: "Failure", callback: () => Get.back());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wege - Read'),
      ),
      body: SafeArea(
        child: Stack(children: [
          FutureBuilder<List<dynamic>>(
            future: _fetchData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: snapshot.data.length,
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
                                          child: ImageOnly(url: snapshot.data[index]['avatar'], isRounded: true),
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
                                          Titles(snapshot.data[index]['first_name'] + " " + snapshot.data[index]['last_name']),
                                          Subtitle(snapshot.data[index]['email']),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Icons
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        editButton(context, snapshot.data[index]['id']),
                                        const SizedBox(width: 10.0),
                                        delButton(context, snapshot.data[index]['id']),
                                        const SizedBox(width: 10.0),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
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
          //Add button
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.lightBlueAccent,
                  elevation: 7.0,
                  mini: false,
                  onPressed: () {
                    Get.off(() => const AddPage());
                  },
                  child: const Icon(Icons.add_sharp, color: Colors.white),
                ),
                const SizedBox(height: 30.0)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  //Edit button
  Widget editButton(BuildContext context, int index) {
    return IconButton(
      icon: const Icon(Icons.edit_note_sharp),
      padding: zero,
      constraints: const BoxConstraints(),
      onPressed: () => Get.off(() => EditPage(id: index)),
      color: Colors.black54,
      iconSize: 32.0,
    );
  }

  //Delete button
  Widget delButton(BuildContext context, int index) {
    return Container(
      padding: zero,
      width: 28.0,
      height: 28.0,
      decoration: iconDecor,
      child: IconButton(
        icon: const Icon(Icons.delete_forever_sharp),
        padding: zero,
        constraints: const BoxConstraints(),
        onPressed: () async => await _delData(index),
        color: Colors.white,
        iconSize: 20.0,
      ),
    );
  }
}

/*
              ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(snapshot.data[index]['avatar']),
                        ),
                        title: Text(snapshot.data[index]['first_name'] + " " + snapshot.data[index]['last_name']),
                        subtitle: Text(snapshot.data[index]['email']),
                      );
*/