import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/board.dart';
import 'board.dart';

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  Board board;

  bool _isMoving;
  bool gameOver;

  @override
  void initState() {
    super.initState();
    _isMoving = false;
    gameOver = false;
    board = Board(4, 4);

    newGame();
  }

  void newGame() => setState(() {
        board.initBoard();
        gameOver = false;
      });

  void gameover() => setState(() {
        if (board.gameOver()) {
          gameOver = true;
        }
      });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

//    print(listTile[0].value.toString());
    return SafeArea(
      child: GestureDetector(
        onVerticalDragUpdate: (detail) {
          if (detail.delta.distance == 0 || _isMoving) {
            return;
          }
          _isMoving = true;
          if (detail.delta.direction > 0) {
            setState(() {
              board.moveDown();
              gameover();
            });
          } else {
            setState(() {
              board.moveUp();
              gameover();
            });
          }
        },
        onVerticalDragEnd: (d) => _isMoving = false,
        onVerticalDragCancel: () => _isMoving = false,
        onHorizontalDragUpdate: (d) {
          if (d.delta.distance == 0 || _isMoving) {
            return;
          }
          _isMoving = true;
          if (d.delta.direction > 0) {
            setState(() {
              board.moveLeft();
              gameover();
            });
          } else {
            setState(() {
              board.moveRight();
              gameover();
            });
          }
        },
        onHorizontalDragEnd: (d) => _isMoving = false,
        onHorizontalDragCancel: () => _isMoving = false,
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: const Color(0xFFF9F7EE),
            height: size.height,
            width: size.width,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "2048",
                      style: TextStyle(
                          fontSize: 68,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF736A61)),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
//            Container(
//              decoration: BoxDecoration(
//                  color: Color(0xFFBAAC9F),
//                  border: Border.all(width: 1),
//                  borderRadius: BorderRadius.circular(8)),
//              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//              child: Column(
//                children: <Widget>[
//                  Text("HIGH SCORE",
//                      style: TextStyle(fontSize: 13, color: Colors.white60)),
//                  Text(_board.score.toString(),
//                      style: TextStyle(fontSize: 20, color: Colors.white)),
//                ],
//              ),
//            ),
//            SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFBAAC9F),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: Column(
                        children: <Widget>[
                          const Text("SCORE",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.white60)),
                          Text(board.score.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                BoardView(board: board),
                const SizedBox(height: 8),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  splashColor: const Color(0xFF21242E),
                  color: Colors.green[700],
                  onPressed: newGame,
                  child: const Text("RESET",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
//                Container(
//                  height: 40.0,
//                  child: Opacity(
//                    opacity: gameOver ? 1.0 : 0.0,
//                    child: Center(child: Text('Game Over')),
//                  ),
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
