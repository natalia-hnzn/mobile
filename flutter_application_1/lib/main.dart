import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp( //widget
    debugShowCheckedModeBanner: false,
      home: Homepage(), //atributo
    ),
  );
}

PageController pageController = PageController();
int paginaAtual = 0;


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nubank'),
        backgroundColor: Color.fromARGB(255, 123, 48, 136),
        
        // centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(color: Colors.amber,),
          Container(color: Colors.orange,),
          Container(color: Colors.red,),
        ],
      ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //   Container(
      //   // margin:EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //   // padding: EdgeInsets.all(20),
      //   width: double.infinity,
      //   height: 200,
      //   decoration: BoxDecoration(color: Colors.amber,
      //   borderRadius: BorderRadius.circular(20),
      //   gradient: LinearGradient(colors: [Colors.orange, Colors.red])),
      //   child: Text('Container 1'),
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Container(
      //       width: 50,
      //       height: 50,
      //       color: Colors.amberAccent,
      //       ),
      //       Container(
      //       width: 50,
      //       height: 50,
      //       color: Colors.amberAccent,
      //       )
      // ],)
      // ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        selectedItemColor: Colors.purple,
        onTap: (page) {
          pageController.animateToPage(page, duration: Duration(milliseconds: 200), curve: Curves.linear);
          
        setState(() {
          
          paginaAtual = page;
        });

          print(paginaAtual);

        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
