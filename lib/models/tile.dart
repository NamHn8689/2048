class Tile {
  Tile({this.row, this.column, this.value = 0, this.canMerge, this.isNew});

  int row;
  int column;
  int value;
  bool canMerge;
  bool isNew;

//  int getIndex() => 4 * (row - 1) + column - 1;
  int getIndex() => 4 * row + column;

  bool isEmpty() => value == 0;

  @override
  int get hashCode => value.hashCode;

  @override
  operator ==(other) => other is Tile && value == other.value;
}
//4*(r-1)+c-1= index
