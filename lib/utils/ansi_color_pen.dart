import 'package:ansicolor/ansicolor.dart';

main(List<String> arguments) {
  AnsiPen greenPen = AnsiPen()..green();
  AnsiPen greenBackGroundPen = AnsiPen()..green(bg: true);

  AnsiPen redTextBlueBackgroundPen = AnsiPen()
    ..blue(bg: true)
    ..red();

  AnsiPen boldPen = AnsiPen()..white(bold: true);

  AnsiPen someColorPen = AnsiPen()..rgb(r: .5, g: .2, b: .4);

  print(greenPen("Hulk") + " " + greenBackGroundPen("SMASH!!!"));
  print(redTextBlueBackgroundPen("Spider-Man!!!") +
      " " +
      boldPen("Far From Home!!!"));

  print(someColorPen("Chameleon"));
}
