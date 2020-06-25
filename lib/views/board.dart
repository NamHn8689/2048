import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/board.dart';
import '../utils/tile_colors.dart';

class BoardView extends StatefulWidget {
  BoardView({this.board});

  Board board;

//  List<Tile> list;

  @override
  _BoardViewState createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  bool gameOver = false;

  void gameover() => setState(() {
        if (widget.board.gameOver()) {
          gameOver = true;
        }
      });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final list = widget.board.boardTilesToList();
    return Container(
      width: size.width,
      height: size.width - 20,
      decoration: BoxDecoration(
          color: const Color(0xFFBAAC9F),
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(2),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: List.generate(16, (index) {
                const Duration(milliseconds: 500);
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      color: tileColors[list[index].value],
                      borderRadius: BorderRadius.circular(3)),
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      list[index].value == 0
                          ? ''
                          : list[index].value.toString(),
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                );
              }),
            ),
          ),
          Opacity(
            opacity: gameOver ? 1.0 : 0.0,
            child: Container(
              color: Colors.white54,
              child: Center(
                  child: Text(
                'Game Over',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
