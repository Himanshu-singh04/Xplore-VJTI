import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';
import 'package:xplorevjtiofficialapp/views/side_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  launchUrl(String url) async {
    if (await canLaunch(url)){
      await launch(url);
    } else{
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              drawer: const SideBar(),
              backgroundColor: Colors.deepOrange[50],
              appBar: AppBar(
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(
                        Icons.menu_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 124, 5, 5),
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
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
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Material(
                      color: Colors.deepOrange[50],
                      child: InkWell(
                        onTap: () async {
                          Navigator.pushNamed(context, studentAccountRoute);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(219, 124, 5, 5),
                            borderRadius: BorderRadius.zero,
                          ),
                          height: 200,
                          width: 500,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Welcome\n${snapshot.data['name'].substring(0, snapshot.data['name'].indexOf(' '))}',
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/VJTilogoforappbar.jpeg'),
                                radius: 70,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SENIORS' ADVICE
                        Material(
                          color: Colors.deepOrange[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () async {
                              final userdata = await userDetails();
                              Navigator.pushNamed(context, seniorAdviceRoute,
                                  arguments: userdata);
                            },
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Image.asset(
                                      'assets/advice.png',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Seniors\' \nAdvice',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 80),
                        // EXTRA CURRICULARS
                        Material(
                          color: Colors.deepOrange[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, extracurricularsRoute);
                            },
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Image.asset(
                                      'assets/extracurriculars.png',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Extra\nCurriculars',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // NOTES & PYQS
                        Material(
                          color: Colors.deepOrange[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.of(context).pushNamed(notesAndPyqRoute);
                            },
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Image.asset(
                                      'assets/notespyqs.png',
                                      fit: BoxFit.fill,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Notes & \nPYQs',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 80),
                        // ABOUT VJTI
                        Material(
                          color: Colors.deepOrange[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.pushNamed(context, aboutVJTIRoute);
                            },
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Image.asset(
                                      'assets/about.png',
                                      fit: BoxFit.fill,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'About \nVJTI',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // GALLERY
                        Material(
                          color: Colors.deepOrange[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              const url = 'https://play.google.com/store/apps/details?id=com.raviowl.vjtimaps';
                              launch(url);
                            },
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: Image.asset(
                                      'assets/Locations1.png',
                                      fit: BoxFit.fill,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Location within \nthe campus',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    
                        

                        const SizedBox(width: 80),
                        // HOW TO GET VJTI
                        Material(
                          color: Colors.deepOrange[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.pushNamed(context, howToGetVJTIRoute);
                            },
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Image.asset(
                                      'assets/howtoget.png',
                                      fit: BoxFit.fill,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'How to get \nVJTI',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Material(
                          color: Colors.deepOrange[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.pushNamed(context, mapOfVJTIRoute);
                            },
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Image.asset(
                                      'assets/VJTITopView.png',
                                      fit: BoxFit.fill,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Map of \nVJTI',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                    
                  ],
                  
                ),
                
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
