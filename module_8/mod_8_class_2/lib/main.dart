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
      ),
      // Simple List View
      /* body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text('Box 1'),
            ),
          ),SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text('Box 1'),
            ),
          ), SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text('Box 1'),
            ),
          ),SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text('Box 1'),
            ),
          ),SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text('Box 1'),
            ),
          ),SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text('Box 1'),
            ),
          ),SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text('Box 1'),
            ),
          ),SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text('Box 1'),
            ),
          ),SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text('Box 1'),
            ),
          ),
        ],
      ),

      */

      // body: ListView.builder(
      //   itemCount: 1000,
      //   itemBuilder: (context,index){
      //     return SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Text(index.toString()),
      //     );
      //   }
      // ),

      // Friend list data show in display
      // Listview builder
      /*body:ListView.builder(
        itemCount: fridendList.length,
        itemBuilder: (contex,index){
          return Text(fridendList[index]);
        },
      ) , */

      //Grid view
      /*
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1

          ),
          itemCount: fridendList.length,
          itemBuilder:(context,indext){
            return Column(
              children: [
                Text(indext.toString()),
                Text(fridendList[indext]),
              ],
            );
          }

      ),
       */

      // <<< Divider >>> List view separator
      body:ListView.separated(
        itemCount: fridendList.length,

        itemBuilder: (contex,index){
          return ListTile(
            tileColor: Colors.brown.shade50,
            title: Text(fridendList[index]),
            subtitle: Text('Bangladesh'),
            trailing: Icon(Icons.chat_outlined), // add icone last
            leading: Text((index+1).toString()),
            onTap: (){
              print('${fridendList[index]} on tap');
            },
            titleTextStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,

            ),
          );
        },
        separatorBuilder: (context,index){
          return Divider(
            color: Colors.blue.shade100,
            height: 16,
            thickness: 2,
            endIndent: 16,
            indent: 8,
          );
        },
      ) ,
    );
  }
}
