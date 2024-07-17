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
      // application theme
      theme: ThemeData(
        brightness: Brightness.light,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.green,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 24,
              )),
          //Button Theme
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ))),
        //here we use border theme reuse code
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              //borderSide: BorderSide.none
              borderSide: BorderSide(
                width: 10,
              )),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,

      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _descriptionTEcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        // title: Text(
        //   'Login Page',
        //   style: TextStyle(color: Colors.white, fontSize: 24),
        // ),
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            TextField(
              enabled: true,
              decoration: InputDecoration(
                hintText: 'Email Address',

                // lable
                label: Text('Email'),
                labelStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),

                //icon prefix and sufix
                icon: Icon(Icons.email_outlined),
                prefixIcon: Icon(
                  Icons.safety_check_outlined,
                  color: Colors.red,
                ),
                suffixIcon: TextButton(
                  child: Text('Enter'),
                  onPressed: () {},
                ),

                //hints
                hintStyle: TextStyle(
                  color: Colors.green.shade200,
                ),

                //Border
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    //borderSide: BorderSide.none
                    borderSide: BorderSide(
                      width: 10,
                    )),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),

            // second Text field description
            SizedBox(
              height: 16,
            ),
            TextField(
              enabled: true,
              controller: _descriptionTEcontroller,
              maxLines: 5,
              maxLength: 250,
              onTap: () {
                print('Click on Description');
              },
              onChanged: (String value) {
                print(value);
              },

              // Textfiled Decoration
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: 'Description',

                // lable
                label: Text('Description'),
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),

                //hints
                hintStyle: TextStyle(
                  color: Colors.green.shade200,
                ),

                //Border

              ),
            ),

            /// Password text field
            TextField(
              obscureText: true,
              enabled: true,

              // Textfiled Decoration
              decoration: InputDecoration(
                hintText: 'Password',

                // lable
                label: Text('Password'),
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),

                //hints
                hintStyle: TextStyle(
                  color: Colors.green.shade200,
                ),

                //Border
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    //borderSide: BorderSide.none
                    borderSide: BorderSide(
                      width: 10,
                    )),
              ),
            ),
            SizedBox(
              height: 16,
            ),

            /// Here use a button that clear the description
            ElevatedButton(
                onPressed: () {
                  // _descriptionTEcontroller.text='Need to clear';
                  _descriptionTEcontroller.clear();
                },
                child: Text('Description Clear'))
          ],
        ),
      ),
    );
  }
}

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: Text('Theme Screen'),
      ),
    );
  }
}
