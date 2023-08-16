import 'package:chessgame/Components/piece.dart';
import 'package:chessgame/Components/square.dart';
import 'package:chessgame/constents/colors.dart';
import 'package:chessgame/helper/helper_function.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // a 2-dimensional list repersenting the chessboard
  // with each position possible containing a chess piece
  late List<List<ChessPiece?>> board;

  @override
  void initState() {
    intializeBoard();
    super.initState();
  }

  void intializeBoard() {
    //intializing the position of the peice in the board

    List<List<ChessPiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));

    //Place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
          type: ChessPieceType.pawn,
          isWhite: false,
          imagepath: "assets/images/pawn.png");

      newBoard[6][i] = ChessPiece(
          type: ChessPieceType.pawn,
          isWhite: true,
          imagepath: "assets/images/pawn.png");
    }
    //Place rooks
    newBoard[0][0] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: false,
        imagepath: "assets/images/rook.png");
    newBoard[0][7] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: false,
        imagepath: "assets/images/rook.png");
    newBoard[7][0] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: true,
        imagepath: "assets/images/rook.png");
    newBoard[7][7] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: true,
        imagepath: "assets/images/rook.png");
    //Place  bishops
    newBoard[0][2] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: false,
        imagepath: "assets/images/bishop.png");
    newBoard[0][5] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: false,
        imagepath: "assets/images/bishop.png");
    newBoard[7][2] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: true,
        imagepath: "assets/images/bishop.png");
    newBoard[7][5] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: true,
        imagepath: "assets/images/bishop.png");
    //Place knights
    newBoard[0][1] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: false,
        imagepath: "assets/images/knight.png");
    newBoard[0][6] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: false,
        imagepath: "assets/images/knight.png");
    newBoard[7][1] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: true,
        imagepath: "assets/images/knight.png");
    newBoard[7][6] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: true,
        imagepath: "assets/images/knight.png");
    //Place  king
    newBoard[0][4] = ChessPiece(
        type: ChessPieceType.king,
        isWhite: false,
        imagepath: "assets/images/king.png");
    newBoard[7][3] = ChessPiece(
        type: ChessPieceType.king,
        isWhite: true,
        imagepath: "assets/images/king.png");
    //Place Queen
    newBoard[0][3] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: false,
        imagepath: "assets/images/queen.png");
    newBoard[7][4] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: true,
        imagepath: "assets/images/queen.png");

    board = newBoard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8 * 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8),
            itemBuilder: (context, index) {
              // get the row and column position in the square

              int row = index ~/ 8;
              int col = index % 8;
              return Square(
                isWhite: isWhite(index),
                piece: board[row][col],
              );
            }),
      ),
    );
  }
}
