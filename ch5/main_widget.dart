import 'package:flutter/material.dart';
import 'package:flutter_lab/ch5/assets_widget.dart';
import 'package:flutter_lab/ch5/form_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  int selectedIndex = 0;//bottom navigation bar 의 선택된 tab index

  List<Widget> widgets = [
    AssetTestWidget(),
    FormScreen(),
  ];

  //탭 버튼 클릭 이벤트 콜백..
  onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widget Test'),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: Text("AppBar Bottom Text"),
              )
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/big.jpeg"),
                fit: BoxFit.fill
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add_alert)),
            IconButton(onPressed: (){}, icon: Icon(Icons.navigate_next))
          ],
        ),
        body: Center(
          child: widgets.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,//shifting - 탭버튼 조정시 에니메이션효과
          // fixed - 고정..
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "first",
              backgroundColor: Colors.green//이 버튼이 선택이 되면 전체 navigation bar 의 색상이 이
              //색상으로..
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "second",
              backgroundColor: Colors.red
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber,//현재 선택된 탭 버튼의 색상..
          onTap: onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text("Drawer Header"),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
              ListTile(
                title: Text("item 1"),
                onTap: (){},
              ),
              ListTile(
                title: Text("item 2"),
                onTap: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}

