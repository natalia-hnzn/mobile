import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp( //widget
    theme: ThemeData(primarySwatch: Colors.purple),
    debugShowCheckedModeBanner: false,
      home: Homepage(), //atributo
    ),
  );
}

PageController pageController = PageController();
int paginaAtual = 0;
int contador = 0;


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
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text('Natalia Heinzen'), 
            accountEmail: Text('nataliaheinzen@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('NH'),
            ),
            ),
            ListTile(
              title: Text('Minha conta'),
              subtitle: Text('Dados da sua conta'),
              trailing: Icon(Icons.money),
              leading: Icon(Icons.money_off),
              onLongPress: (){},
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: PageView(
          controller: pageController,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(contador.toString(),style: TextStyle(fontSize: 32),),
              ),
            ),
            Container(color: Colors.orange,),
            Container(color: Colors.red,),
          ],
        ),
      ),
      
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        FloatingActionButton(onPressed: (){
          setState(() { 
            if(contador > 0){
          contador--;
            }           
          });
        }, child: Icon(Icons.remove)),
        SizedBox(width: 14,),
        FloatingActionButton(onPressed: (){
          setState(() {            
          contador++;
          });
        }, child: Icon(Icons.add))
      ]),
    );
  }
}
