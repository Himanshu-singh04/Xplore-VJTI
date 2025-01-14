import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/views/side_bar.dart';

class DashboardView_nonVJTI extends StatefulWidget {
  const DashboardView_nonVJTI({super.key});

  @override
  State<DashboardView_nonVJTI> createState() => _DashboardView_nonVJTIState();
}

class _DashboardView_nonVJTIState extends State<DashboardView_nonVJTI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
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
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(width: 0),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
                color: Color.fromARGB(219, 124, 5, 5),
              ),
              height: 200,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome!!',
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                                height: 100,
                                width: 100,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'How to \nget VJTI',
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
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const SizedBox(width: 90),
                  
                ],
              ),
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
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Map \nof VJTI',
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
                      Navigator.pushNamed(context, extracurricularsRoute);
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
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Extra \nCurriculars',
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
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 124, 5, 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, loginNonVJTIRoute);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: 50,
                              width: 100,
                              child: const Center(
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );;
  }
}