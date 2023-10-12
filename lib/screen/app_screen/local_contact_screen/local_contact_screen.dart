import 'dart:ui';
import 'package:contactbook/provider/local_contact_provider.dart';
import 'package:contactbook/screen/auth_screen/splash_screen.dart';
import 'package:contactbook/screen/services/database_model_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/config.dart';

class LocalContact extends StatefulWidget {
  const LocalContact({Key? key}) : super(key: key);

  @override
  State<LocalContact> createState() => _LocalContactState();
}

class _LocalContactState extends State<LocalContact> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final LocalContactController localContactCtrl =
        Provider.of<LocalContactController>(context, listen: false);
    localContactCtrl.viewData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalContactController>(
        builder: (context, localContactCtrl, child) {
      return Scaffold(
          backgroundColor: Colors.yellow,
          appBar: AppBar(elevation: 0, backgroundColor: Colors.yellow),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                          visible: !localContactCtrl.isFavorite,
                          child: Container(
                              height: 60,
                              width: localContactCtrl.isSearch ? 390 : 190,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            localContactCtrl.isSearch =
                                                !localContactCtrl.isSearch;
                                          });
                                        },
                                        icon: Icon(localContactCtrl.isSearch
                                            ? Icons.close
                                            : Icons.search)),
                                    if (localContactCtrl.isSearch)
                                      Expanded(
                                          child: TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  if (value.isNotEmpty) {
                                                    localContactCtrl
                                                        .searchData = [];
                                                    for (int i = 0;
                                                        i <
                                                            localContactCtrl
                                                                .contactDetails
                                                                .length;
                                                        i++) {
                                                      String name =
                                                          localContactCtrl
                                                                  .contactDetails[
                                                              i]["name"];
                                                      String number =
                                                          localContactCtrl
                                                                  .contactDetails[
                                                              i]["number"];
                                                      if (name
                                                              .toLowerCase()
                                                              .contains(value
                                                                  .toLowerCase()) ||
                                                          number.contains(
                                                              value)) {
                                                        localContactCtrl
                                                            .searchData
                                                            .add(localContactCtrl
                                                                .contactDetails[i]);
                                                      }
                                                    }
                                                  } else {
                                                    localContactCtrl
                                                            .searchData =
                                                        localContactCtrl
                                                            .contactDetails;
                                                  }
                                                });
                                              },
                                              autofocus: true,
                                              controller: localContactCtrl
                                                  .searchController,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      '${localContactCtrl.contactDetails.length} Contacts',
                                                  border: InputBorder.none)))
                                  ]))),
                      Visibility(
                          visible: !localContactCtrl.isSearch,
                          child: SingleChildScrollView(
                              child: Column(children: [
                            Container(
                                height: 60,
                                width: 190,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(40)),
                                ),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.center,
                                    onPressed: () {},
                                    icon: const Icon(Icons.star)))
                          ])))
                    ]),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 30),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0))),
                        child: localContactCtrl.searchData.isEmpty
                            ? Center(child: Text(textCommon.noDataFound))
                            : ListView.builder(
                                itemCount: localContactCtrl.isSearch
                                    ? localContactCtrl.searchData.length
                                    : localContactCtrl.contactDetails.length,
                                itemBuilder: (context, index) {
                                  Map map = localContactCtrl.isSearch
                                      ? localContactCtrl.searchData[index]
                                      : localContactCtrl.contactDetails[index];
                                  return Container(
                                      child: ListTile(
                                          leading: IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                          title: Text(textCommon
                                                              .changeProfile),
                                                          content: Column(
                                                              children: [
                                                                Text(textCommon
                                                                    .chooseFromGallery),
                                                                Text(textCommon
                                                                    .cancel)
                                                              ]));
                                                    });
                                              },
                                              icon: const Icon(
                                                  Icons.account_circle,
                                                  size: 30)),
                                          title: Text("${map['name']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                          subtitle: Text(
                                              "  +91 ${map['number']}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black))));
                                })))
              ]),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: AlertDialog(
                              title: const Column(children: [
                                Text("contactdetail"),
                                SizedBox(height: 20),
                                Tooltip(
                                    message: "addimg",
                                    child: Icon(Icons.contacts))
                              ]),
                              actions: [
                                TextField(
                                    controller: localContactCtrl.name,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        label: const Text("name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100)))),
                                const SizedBox(height: 20),
                                TextField(
                                    keyboardType: TextInputType.phone,
                                    controller: localContactCtrl.number,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        label: const Text("number",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100)))),
                                const SizedBox(height: 20),
                                GestureDetector(
                                    onTap: () {
                                      int user = SplashScreen.prefs!
                                              .getInt("userid") ??
                                          0;
                                      DataBaseHelper()
                                          .insertContact(
                                              localContactCtrl.name.text,
                                              localContactCtrl.number.text,
                                              user,
                                              db!)
                                          .then((value) {
                                        localContactCtrl.viewData(context);
                                      });
                                      localContactCtrl.name.text = "";
                                      localContactCtrl.number.text = "";
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        decoration: BoxDecoration(
                                            color: bgColor,
                                            border: Border.all(color: bgColor),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Text("save",
                                            style: TextStyle(
                                                color: Colors.black))))
                              ]));
                    });
              },
              child: const Icon(Icons.add)));
    });
  }
}
