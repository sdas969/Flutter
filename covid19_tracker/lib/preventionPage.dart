import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';

class PreventionPage extends StatefulWidget {
  @override
  _PreventionPageState createState() => _PreventionPageState();
}

class _PreventionPageState extends State<PreventionPage> {
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 100,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            expandedHeight: 200,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset('assets/Prevention.png'),
              ),
              centerTitle: true,
              title: Text(
                'Prevention',
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                )),
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
            stretch: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.fromLTRB(11, 20, 11, 20),
                child: Container(
                    child: const Text(
                  'The best way to prevent the coronavirus is to not get it in the first place. There’s no vaccine yet for COVID-19, the disease that the virus causes. As communities across the country begin to reopen for business, you can lower your chances of getting or spreading the virus by taking these steps:',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )),
              ),
              ResponsiveGridRow(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveGridCol(
                      lg: 4,
                      xs: 12,
                      md: 6,
                      xl: 4,
                      sm: 12,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset('assets/Mask.png'),
                            )),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
<<<<<<< HEAD
                                      const Text('Wear a Mask',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Padding(
=======
                                      Text('Wear a Mask',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Padding(
>>>>>>> 4f3af15 (Update)
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Text(
                                          'Masks can help prevent people who are asymptomatic or undiagnosed from transmitting SARS-CoV-2 when they breathe, talk, sneeze, or cough. This, in turn, slows the transmission of the virus.',
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      xs: 12,
                      md: 6,
                      xl: 4,
                      sm: 12,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset('assets/Wash.png'),
                            )),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
<<<<<<< HEAD
                                      const Text('Wash your hands frequently',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Padding(
=======
                                      Text('Wash your hands frequently',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Padding(
>>>>>>> 4f3af15 (Update)
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Text(
                                          'Use warm water and soap and rub your hands for at least 20 seconds. Work the lather to your wrists, between your fingers, and under your fingernails.',
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      xs: 12,
                      md: 6,
                      xl: 4,
                      sm: 12,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset('assets/Cover.png'),
                            )),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
<<<<<<< HEAD
                                      const Text('Cover Etiquette',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Padding(
=======
                                      Text('Cover Etiquette',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Padding(
>>>>>>> 4f3af15 (Update)
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Text(
                                          'Use a tissue or sneeze into your elbow to keep your hands as clean as possible. Wash your hands carefully after you sneeze or cough, regardless.',
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      xs: 12,
                      md: 6,
                      xl: 4,
                      sm: 12,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset('assets/Touch.png'),
                            )),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
<<<<<<< HEAD
                                      const Text('Avoid touching your face',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Padding(
=======
                                      Text('Avoid touching your face',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Padding(
>>>>>>> 4f3af15 (Update)
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Text(
                                          'Avoid touching any part of your face or head, including your mouth, nose, and eyes. Also avoid biting your fingernails.',
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      xs: 12,
                      md: 6,
                      xl: 4,
                      sm: 12,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset('assets/Contact.png'),
                            )),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
<<<<<<< HEAD
                                      const Text('Social Distancing',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Padding(
=======
                                      Text('Social Distancing',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Padding(
>>>>>>> 4f3af15 (Update)
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Text(
                                          'If you must go out for necessities, keep a distance of 2 m from other people. You can transmit the virus by speaking to someone in close contact to you.',
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      xs: 12,
                      md: 6,
                      xl: 4,
                      sm: 12,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset('assets/Disinfect.png'),
                            )),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
<<<<<<< HEAD
                                      const Text('Clean and Disinfect',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Padding(
=======
                                      Text('Clean and Disinfect',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Padding(
>>>>>>> 4f3af15 (Update)
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Text(
                                          'Use alcohol-based disinfectants to clean hard surfaces in your home. Disinfect areas after you bring groceries or packages into your home.',
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ])
            ],
          ))
        ],
      ),
    );
  }
}