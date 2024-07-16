import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> fridendList = [
    'Hamza',
    'Rakib',
    'Joy',
    'Borson',
    'Mustak',
    'Sajib'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              child: Text('My Laptop'),
              padding: EdgeInsets.all(8),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.black, width: 8),
                //borderRadius: BorderRadius.circular(25),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  // shape: BoxShape.circle,
                ),

                image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/250?image=9'),
                    fit: BoxFit.cover,
                    opacity: 1),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.blue.withOpacity(1),
                    spreadRadius: 5,
                    blurRadius: 50,
                    offset: Offset(0, 3),
                  ),
                  BoxShadow(
                    color: Colors.green.withOpacity(1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     //     showAboutDialog(
            //     //       context: context,
            //     //       applicationName: 'Laptop',
            //     //       applicationVersion: '1.2.3',
            //     //     );
            //
            //     // Our custom Dialog
            //
            //   },
            //   child: Text('Dialog'),
            // )
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      // barrierColor: Colors.transparent,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Our custom Dialog'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('This is a Dialog'),
                              Text('This is a Dialog'),
                              Text('This is a Dialog'),
                              Text('This is a Dialog'),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('cancle')),
                            TextButton(onPressed: () {}, child: Text('Okey')),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            // borderRadius: BorderRadius.zero
                          ),
                          backgroundColor: Colors.white,
                        );
                      });
                },
                child: Text('Dialog')),
            SizedBox(
              height: 20,
            ),
            // Bottom Sheet
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      barrierColor: Colors.black38,
                      isDismissible: false,
                      enableDrag: true,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text('Info'),
                              ),
                              Divider(
                                color: Colors.blue,
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Text('Bottom Sheet Button'))
          ],
        ),
      ),
    );
  }
}
