import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lets_talk_flutter_chat_app/LightColors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.KLightYellow,
    statusBarColor: Colors.transparent
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: LightColors.KDarkYellow
      ),
      home: OnlineUsers(),
    );
  }
}
class OnlineUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.KLightYellow,
     appBar: AppBar(
       title: Text("Online",style: TextStyle(color: Colors.black54,fontSize: 18),),
       centerTitle: true,
       backgroundColor: LightColors.KLightYellow,
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatBox()));
        },
        child: Icon(Icons.chat,color: LightColors.KDarkYellow,),
        backgroundColor: LightColors.KWhite,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Chat()));
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrc5gKtC_DVz0MBNo_5Lt5G3-D3D8WYK8Rmg&usqp=CAU'),
            ),
            title: Text("Imran Khan"),
            subtitle: Text("Prime Minister, Pakistan"),
            trailing: Icon(Icons.circle_notifications,color: Colors.green,),
          ),
        ],
      ),
    );
  }
}
class Chat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.KLightYellow,
          appBar: AppBar(
            title: Text("Hassan Shabir", style: TextStyle(color: Colors.black54,fontSize: 18),),
            centerTitle: true,
            elevation: 0,
            backgroundColor: LightColors.KLightYellow,
          ),
          body: Container(
            margin: EdgeInsets.only(top: 15,left: 5,right: 5),
              decoration: BoxDecoration(
                color: LightColors.KWhite,
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  // bottomLeft: Radius.circular(15),
                  // bottomRight: Radius.circular(15),
              ),),
              child: ChatListItemView(
                name: "Imran Khan",
                image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrc5gKtC_DVz0MBNo_5Lt5G3-D3D8WYK8Rmg&usqp=CAU',
                message: "Hello",
                hasUnreadMessage: true,
              ),
          ),
        );
  }
}
class ChatListItemView extends StatelessWidget{
  String? name;
  String? image;
  String? message;
  bool hasUnreadMessage;

  ChatListItemView({
     this.name,
     this.image,
     this.message,
     required this.hasUnreadMessage,
});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 10,
                  child: ListTile(
                    title: Text(name??'',style: TextStyle(fontSize: 16),),
                    subtitle: Text(message??'',style: TextStyle(fontSize: 12),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage( image??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrc5gKtC_DVz0MBNo_5Lt5G3-D3D8WYK8Rmg&usqp=CAU'),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('12:45AM',style: TextStyle(fontSize: 12),),
                        if (hasUnreadMessage) Container(
                          margin:  const EdgeInsets.only(top: 5),
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              )
                          ),
                          child: Center(
                            child: Text("3",style: TextStyle(fontSize: 11),),
                          ),
                        ) else SizedBox()
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatBox()));
                    },
                  )
              ),
            ],
          ),
          Divider(
            endIndent: 12,
            indent: 12,
            height: 0,
          ),
        ],
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: ()async{

          },
        ),
      ],
    );
  }

}
class ChatBox extends StatefulWidget{
  final String? name;
  final int? coins;

  const ChatBox({Key? key, this.name, this.coins}): super(key: key);
  @override
   _ChatBoxState createState()=> _ChatBoxState();
}
class _ChatBoxState extends State<ChatBox>{
  final messageInsert = TextEditingController();
  List<Map> messages = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context)
    .size
    .height;
    return Scaffold(
      backgroundColor: LightColors.KLightYellow,
      appBar: AppBar(
        elevation: 0.0,
        leadingWidth: 2.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrc5gKtC_DVz0MBNo_5Lt5G3-D3D8WYK8Rmg&usqp=CAU'),
            ),
            Flexible(child: Text("Imran Khan",style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold),))
          ],
        ),
        actions: [
          SizedBox(height: 5,),
          InkWell(
            onTap: ()async{},
            child: CircleAvatar(backgroundColor: Colors.orange,child: Center(child: Icon(Icons.call,color: Colors.white,),),),
          ),
          SizedBox(height: 5,),
          InkWell(
            onTap: ()async{},
            child: CircleAvatar(backgroundColor: Colors.blue,child: Center(child: Icon(Icons.video_call,color: Colors.white,),),),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            messages.isEmpty?Flexible(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrc5gKtC_DVz0MBNo_5Lt5G3-D3D8WYK8Rmg&usqp=CAU'),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Flexible(child: Text("Imran Khan",style: TextStyle(color: Colors.black,fontSize: 16),),),
                  Text("Follow 20M",style: TextStyle(color: Colors.black,fontSize: 14),),
                ],
              ),
            ),): Flexible(child: ListView.builder(reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) => chat(
              messages[index]["message"].toString(),
                messages[index]["data"]),),),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: roundedContainer(),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                        //BotToast.showText(text: 'Empty message');
                      } else {
                        setState(() {
                          messages.insert(0,
                              {"data": 1, "message": messageInsert.text});
                        });
                        //response(messageInsert.text);
                        messageInsert.clear();
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.send,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }
  Widget roundedContainer (){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLengthEnforced: true,
                maxLength: 40,
                controller: messageInsert,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.attach_file,
                size: 30.0, color: Colors.orange),
            SizedBox(width: 8.0),
            Icon(Icons.camera_alt,
                size: 30.0, color: Colors.orange),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          color: data == 0 ? Colors.blue : Colors.orange,
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                  data == 0 ? NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrc5gKtC_DVz0MBNo_5Lt5G3-D3D8WYK8Rmg&usqp=CAU'): NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrc5gKtC_DVz0MBNo_5Lt5G3-D3D8WYK8Rmg&usqp=CAU'),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                      message,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )),
    );
  }
}


