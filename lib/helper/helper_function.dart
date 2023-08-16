bool isWhite(int index){
   int x = index ~/ 8; //this gives as int division as row
            int y = index % 8; // this gives reminder as column
            bool isWhite = (x + y) % 2 == 0;
            return isWhite;
}