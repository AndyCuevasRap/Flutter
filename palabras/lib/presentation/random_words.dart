import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Generador de palabras",
          style: GoogleFonts.englebert(),
        ),
        backgroundColor: (Colors.red[900])!,
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: "Palabras Seleccionadas",
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = _saved.contains(_suggestions[index]);

          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: GoogleFonts.englebert(color: Colors.white),
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.white : Colors.white,
              semanticLabel: alreadySaved ? "Remove from saved" : "Save",
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_suggestions[index]);
                } else {
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: (Colors.red[900])!,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: GoogleFonts.englebert(color: Colors.white),
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: (Colors.red[900])!,
              title: Text(
                "Palabras seleccionadas",
                style: GoogleFonts.englebert(),
              ),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
