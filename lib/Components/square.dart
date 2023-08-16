import 'package:chessgame/Components/piece.dart';
import 'package:chessgame/constents/colors.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  const Square({super.key, required this.isWhite, this.piece});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isWhite ? foreGroundColor : backGroundColor,
      child: piece != null ? Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(piece!.imagepath,color: piece!.isWhite?Colors.white:Colors.black,),
        
      ) : null,
    );
  }
}
