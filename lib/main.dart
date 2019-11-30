import 'package:flutter/material.dart';
import 'package:chat_app/utils/db.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget{
  @override
  build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
  @override
  build(context){
    return Scaffold(
      appBar: AppBar(title: Text("Select Contact", style: TextStyle(color: Colors.blue),), centerTitle:  true,
      actions: <Widget>[Icon(Icons.menu, color: Colors.blue,)],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: makeCards(),
      ),
    );
  }


  makeCards(){
    Widget card = GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ChatPage()));
      },
      child:
    Center(child:Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.person_pin, color: Colors.white,),
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Nelson Bassey",style: TextStyle(color: Colors.white, fontSize: 18),),
              Text("0785659455", style: TextStyle(color: Colors.white),),
            ],
          )
        ],
      ),
    )
    )
    );
    List<Widget> tmp = [];

    for(int i=0; i < 10; i++){
      tmp.add(card);
    }

    return tmp;
  }
}

class ChatPage extends StatefulWidget{


  @override
  createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>{

  @override
  build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatting with...")
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child:
        ListView(
          children: chatsDisplay()
        ),
      ),
    );
  }

  chatsDisplay(){
    Widget chatCard = Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(topRight: Radius.circular(40),
          bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40),)
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.person_pin, size: 50, color: Colors.white,),
          Text("hi there just wanted to say", style: TextStyle(fontSize: 16,
              color: Colors.white),),



        ],
      )
    );

    Widget chatCard2 = Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(20),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
              bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40),)
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Text("hi there just wanted to say", textAlign: TextAlign.right, style: TextStyle(fontSize: 16,
                  color: Colors.white),),
            ),
            Expanded(
              flex: 2,
              child: Icon(Icons.person_pin, size: 50, color: Colors.white,),
            )




          ],
        )
    );


    List<Widget> tmp = [];
    for(int i=0; i < 5; i++){
     if(i%2 == 0){
       tmp.add
         (chatCard);
     }
     else{
       tmp.add
         (chatCard2);
     }
    }

    return tmp;
  }
}