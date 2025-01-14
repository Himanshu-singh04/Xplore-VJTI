import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/MongoDBSeniorAdvicesModel.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/mongodb.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';
import 'package:xplorevjtiofficialapp/utilites/reg_no_tod_diya_jaye.dart';

class ParticipantSeniorAdviceView extends StatefulWidget {
  const ParticipantSeniorAdviceView({super.key});

  @override
  State<ParticipantSeniorAdviceView> createState() =>
      _ParticipantSeniorAdviceViewState();
}

class _ParticipantSeniorAdviceViewState
    extends State<ParticipantSeniorAdviceView> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as dynamic;
    log(data.toString());

    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              final userdata = await userDetails();
              Navigator.pushNamed(context, seniorAdviceRoute,
              arguments: userdata,
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Color.fromARGB(255, 124, 5, 5),
              size: 30,
            )),
        backgroundColor: Colors.deepOrange[50],
        elevation: 0,
        title: const Text(
          'VJTI',
          style: TextStyle(
            fontFamily: 'Vollkorn',
            fontSize: 50,
            letterSpacing: 7,
            color: Color.fromARGB(255, 124, 5, 5),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
                future: MongoSeniorAdviceDatabase.distinctQueryData(),
                builder: (context, snapshot) {
                  log(snapshot.data.toString() + "why this null");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var totalData = snapshot.data!.length;
                      log(totalData.toString());
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return displayCard(MongoDbSeniorAdviceModel.fromJson(
                              snapshot.data![index]));
                        },
                      );
                    } else {
                      return Center(
                        child: Text('No data available'),
                      );
                    }
                  }
                })),
      ),
    );
  }

  Widget displayCard(MongoDbSeniorAdviceModel data) {
    var color = Colors.white;
    if (data.status == 'ADMIN') {
      color = Color.fromARGB(255, 247, 233, 202);
    } else {
      color = Colors.white;
    }
    var userStatus = '';
    if (data.status == 'ADMIN') {
      userStatus = '~(Admin)';
    } else {
      userStatus = '';
    }
    // final detailsfromregId = detailsFromRegID(userdetails['regId']);
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Text('${data.id}'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${data.name}",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color.fromARGB(255, 124, 5, 5),
                ),
              ),
              Text(
                "${data.year}",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color.fromARGB(255, 124, 5, 5),
                ),
              ),
              Text(
                '$userStatus',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color.fromARGB(255, 124, 5, 5),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
