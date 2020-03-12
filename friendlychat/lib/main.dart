import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

void main(List<String> args) {
  runApp(FriendlyChatApp());
}

class FriendlyChatApp extends StatelessWidget {
  // break the simple app into two different subclasses of widget: 
  //a root-level FriendlychatApp widget that never changes, and a 
  //child ChatScreen widget that can rebuild when messages are sent and internal state changes.
  @override 
  final ThemeData KIOSTheme = new ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light, 
  );
  final ThemeData KDefaulTheme = new ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.orangeAccent[400],
  );
  Widget build(BuildContext context) {
    var defaultTargetPlatform;
        return MaterialApp(
          title: 'FriendlyChat',
          theme: defaultTargetPlatform == TargetPlatform.iOS ? KIOSTheme : KDefaulTheme,
      home:new ChatScreen(),
    ); 

  }
}
// modifying chatscreen to stateful widget
class ChatScreen extends StatefulWidget {
  @override 
  State createState() => new ChatScreenState();
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  String _name = "Your Name";

  @override 
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController, 
        curve: Curves.easeOut
        ),
      axisAlignment: 0.0,
      child: new Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(_name[0]),
            ), 
          ),
          new Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_name, style: Theme.of(context).textTheme.subhead),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
          ),
        ],
      ),
    ),
   ); 
  }
}

// Adding ChatScreenState in main dart.
class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

  @override 

  void dispose() {
    for(ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isComposing = false;
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('FriendlyChat'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            new Divider(
              height: 1.0
            ),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _builtTextComposer(),
          ),
        ],
      ),
      decoration: Theme.of(context).platform == TargetPlatform.iOS 
            ? new BoxDecoration(                                     
                border: new Border(                                  
                  top: new BorderSide(color: Colors.grey[200]),      
                ), 
              ) 
            : null),
    );
  }
  //build a private method that returns a container widget configured with TextField
  //To have control over the contents of the text field, we'll provide the TextField constructor with a TextEditingController. 
  //This controller can also be used to clear the field or read its value.
  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
   
   final TextEditingController _textController = new TextEditingController();
   Widget _builtTextComposer() {
     return new IconTheme(
       data: new IconThemeData(color: Theme.of(context).accentColor),
       child: new Container(
         margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
         children: <Widget>[
           new Flexible(
             child: new TextField(
               controller: _textController,
               onChanged: (String text) {
                 setState(() {
                   _isComposing = text.length > 0;
                 });
               },
               onSubmitted: _handleSubmitted,
               decoration: new InputDecoration.collapsed(
                 hintText: "Send Message"
               ),
             ),
           ),
        
     
       
             new Container(
               margin: EdgeInsets.symmetric(horizontal: 4.0),
               child: Theme.of(context).platform == TargetPlatform.iOS ?
               new CupertinoButton(
                 child: new Text('Send'), 
                 onPressed: _isComposing ?() => _handleSubmitted(_textController.text) : null,) :
               new IconButton(  
                 icon: new Icon(Icons.send),
                 onPressed: _isComposing ? () => _handleSubmitted(_textController.text) : null),
             ),
           
         ],
       ),
      
     ),);

   }
}