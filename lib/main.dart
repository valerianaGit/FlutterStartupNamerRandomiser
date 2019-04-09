import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //this class is the 'home' of the app 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: "Startup Name Generator",
  home: RandomWords(),  
    );
  }
}

class RandomWordsState extends State<RandomWords> {
//this class saves the generated word pairs
final _suggestions = <WordPair>[];
final _biggerFont = const TextStyle(fontSize: 18.0); //underscore enforces privacy
  @override
  Widget build(BuildContext context) {

    return Scaffold( //shows a hierarchy for the view 
    appBar: AppBar(
      title: Text("Startup Name Generator"),
    ),
    body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() { //function that will build the list(table)View
     return ListView.builder(
      padding: const EdgeInsets.all(16.0), //padding of 16 points on all sides
      itemBuilder: (context, i) {                          //1
      if (i.isOdd) return Divider();                       //2
      final index = i ~/ 2;                                //3
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10)); //4
      }
      return _buildRow(_suggestions[index]);
                  });
              }
      
        Widget _buildRow(WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        }
      }
      
 

class RandomWords extends StatefulWidget {
  //creates its state class
  @override
  RandomWordsState createState() => RandomWordsState();
}
