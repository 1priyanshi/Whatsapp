import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  TabController _tabController;
  ScrollController _scrollController;

  void initState(){

    _tabController = new TabController(length: 4, vsync: this);
    _scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool InnerBoxScrolled){
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  Icon(Icons.search),
                  Container(width: 15.0,),
                  Icon(Icons.more_vert),
                  Container(width:20.0,),

                ],
                pinned: true,                                                        //so that tab bar do not go up while we scroll
                floating: true,
                centerTitle: false,                                                  //as we do not want whatsapp title at center
                backgroundColor: Color(0xFF004D40),
                title: Text('WhatsApp'),
                bottom: TabBar(                                                      //creating tab bar
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Icon(Icons.photo_camera),
                    ),
                    Tab(
                    text:'CHATS',
                    ),
                    Tab(
                     text:'STATUS',
                      ),
                    Tab(
                      text:'CALLS',
                    ),
                  ]
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              Text('camers'),
              Chats(),
              Status(),
              Text('calls'),
            ],
          ),
        ),
      ),
    );
  }
}

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  List<String> names= [
    
    'eleven',
    'vicky',
    'damon',
    'Rahul'
    'Priya'
    'Somya'
    'Nikhil'
  ];
  List<String> text=[
    'hello',
    'kaise hai',
    'R u single?',
    'Hi',
    'Are you well?'
    'Assignment'
    ':0'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
        itemBuilder:(context, index){

           return Column(
           children :<Widget>[
             ListTile(
           leading: CircleAvatar(
             backgroundImage: NetworkImage('https://specials-images.forbesimg.com/imageserve/5d2795864c687b00085c6b98/960x0.jpg?fit=scale'),
            ),
                 title: Text(names[index]),
          subtitle:Text(text[index]),
          trailing: Text('10:00 AM'),
             ),
             Divider()
          ],
          );
        });
  }
}

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
    ListTile(
    leading: CircleAvatar(
        backgroundImage: NetworkImage('https://specials-images.forbesimg.com/imageserve/5d2795864c687b00085c6b98/960x0.jpg?fit=scale'),
    ),
    title: Text('My Status'),
    subtitle:Text('Add Status'),
    trailing: Text('10:00 AM'),
    ),
    Divider()
      ],
    );
  });
}
}
