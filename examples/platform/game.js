var game = new Drafty.Game(800, 600);
game.renderOn("dom");

var e1 = game.entity(["TwoD"]);
e1.twoD.resizeTo(30, 30);
e1.twoD.moveTo(100, 100);

var e2 = game.entity(["TwoD"]);
e2.twoD.resizeTo(50, 50);
e2.twoD.moveTo(90, 90);

