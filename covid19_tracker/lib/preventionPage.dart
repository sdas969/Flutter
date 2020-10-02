import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreventionPage extends StatefulWidget {
  @override
  _PreventionPageState createState() => _PreventionPageState();
}

class _PreventionPageState extends State<PreventionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 100,
              shape: RoundedRectangleBorder(
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
                      textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  )),
                ),
                stretchModes: [
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
                  padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 20),
                  child: Container(
                      child: Text(
                    'The best way to prevent the coronavirus is to not get it in the first place. There’s no vaccine yet for COVID-19, the disease that the virus causes. As communities across the country begin to reopen for business, you can lower your chances of getting or spreading the virus by taking these steps:',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 15,
                    )),
                  )),
                ),
                Card(
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Wear a Mask',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                      'Masks can help prevent people who are asymptomatic or undiagnosed from transmitting SARS-CoV-2 when they breathe, talk, sneeze, or cough. This, in turn, slows the transmission of the virus.',
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(fontSize: 15))),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Wash your hands frequently',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                      'Use warm water and soap and rub your hands for at least 20 seconds. Work the lather to your wrists, between your fingers, and under your fingernails. You can also use an antibacterial and antiviral soap.',
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(fontSize: 15))),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Cover Etiquette',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                      'Use a tissue or sneeze into your elbow to keep your hands as clean as possible. Wash your hands carefully after you sneeze or cough, regardless.',
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(fontSize: 15))),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Avoid touching your face',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                      'Avoid touching any part of your face or head, including your mouth, nose, and eyes. Also avoid biting your fingernails. This can give SARS-CoV-2 a chance to go from your hands into your body.',
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(fontSize: 15))),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Social Distancing',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                      'If you must go out for necessities, keep a distance of 6 feet (2 m) from other people. You can transmit the virus by speaking to someone in close contact to you.',
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(fontSize: 15))),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Clean and Disinfect',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                      'Use alcohol-based disinfectants to clean hard surfaces in your home. Clean your phone, laptop, and anything else you use regularly several times a day. Disinfect areas after you bring groceries or packages into your home.',
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(fontSize: 15))),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
