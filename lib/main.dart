import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: Page1()
    );
  }

}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int currentIndex = 0;

  Widget getPageByIndex() {
    if (currentIndex == 1) {
      return Page2();
    } else {
      return Page3();
    }
  }

  void navigateToPreviousPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => getPageByIndex()));
    }
  }

  void navigateToNextPage() {
    if (currentIndex < 2) {
      setState(() {
        currentIndex++;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => getPageByIndex()));
    }
  }

  MySnackBar(message,context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        titleSpacing: 2,
        centerTitle: true,
        toolbarHeight: 65,
        toolbarOpacity: 1,
        elevation: 20,
        actions: [
          IconButton(onPressed: (){MySnackBar('Info', context );}, icon: Icon(Icons.info))
        ],
      ),
      body: Center(
        child: Text(
          'Page 1',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
      drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://www.freecodecamp.org/news/content/images/2021/07/Screenshot-2021-07-20-at-9.10.06-PM.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    UserAccountsDrawerHeader(
                      accountName: Text('Tanvir Rahman'),
                      accountEmail: Text('tanvir@gmail.com'),
                      currentAccountPicture: Image.network('https://thumbs.dreamstime.com/z/young-kid-avatar-carton-character-little-boy-laughing-profile-picture-cartoon-portrait-vector-illustration-graphic-design-149728098.jpg'),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Page 1'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Page 2'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Page 3'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Page3()));
                },
              ),
            ],
          )
      ),
      // endDrawer: ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.navigate_before), label: "Previous"),
          BottomNavigationBarItem(icon: Icon(Icons.navigate_next), label: "Next")
        ],
        onTap: (int index) {
          if(index == 0) {
            navigateToPreviousPage();
          }
          if(index == 1) {
            navigateToNextPage();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        onPressed: () { MySnackBar('Floating Action', context ); },
      ),
    );
  }

}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Text(
          'Page 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () { },
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Center(
        child: Text(
          'Page 3',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () { },
      ),
    );
  }
}