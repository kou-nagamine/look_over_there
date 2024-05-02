enum Hand{
  up,
  down,
  left,
  right;

  String get text {
    switch(this){
      case Hand.up:
       return '👆';
      case Hand.down:
       return '👇';
      case Hand.left:
       return '👈';
      case Hand.right:
       return '👉';
    }
  }
}

enum Result{
  win,
  draw;

  String get text {
    switch (this) {
      case Result.win:
       return 'あなたの勝ち';
      case Result.draw:
       return 'あっち向いてホイ';
    }
  }
}