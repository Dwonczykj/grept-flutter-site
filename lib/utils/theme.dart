import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FlexColorScheme flexColorSchemeLight = FlexColorScheme.light(
  fontFamily: 'Europa',
  colors: FlexSchemeColor.from(
    secondary: Colors.grey[800],
    primary: themeShade600, //makes 'Feed' text white
    appBarColor: themeShade200,
  ),
);

//Yellow Color Scheme

// const Color themeShade100 = Color(0xFFFFF9c4);
// const Color themeShade200 = Color(0xFFFFF59d);
// const Color themeShade300 = Color(0xFFFFF176);
// const Color themeShade400 = Color(0xFFFFEE58);
// const Color themeShade500 = Color(0xFFFFEB3B);
// const Color themeShade600 = Color(0xFFFDD835);
// const Color themeShade700 = Color(0xFFFBC02D);
// const Color themeShade800 = Color(0xFFF9A825);
// const Color themeShade900 = Color(0xFFF57F17);

// GRePT Color Scheme
var color1 = Color(0xFF6AD29B); // 0xaarrggbb -> #rrggbb
var color2 = Color(0xFF6A9B7F);
var color3 = Color(0xFFF1FCF5);
var color4 = Color(0xFFD9EDDF);
var color5 = Color(0xFFC3F9FF);
var color6 = Color(0xFF487E91);

const Color greyShade10 = Color.fromARGB(10, 200, 200, 200);
const Color greyShade50 = Color.fromARGB(50, 180, 180, 180);
const Color greyShade100 = Color.fromARGB(100, 0, 0, 0);
const Color greyShade200 = Color.fromARGB(151, 50, 50, 50);
const Color greyShade300 = Color.fromARGB(195, 100, 100, 100);

//Vegi Color Scheme
const Color themeShade100 = Color(0xFFF1F8EF);
const Color themeShade200 = Color(0xFFE2F1DE);
const Color themeShade300 = Color(0xFFC5E2BC);
const Color themeShade400 = Color(0xFFA8D39B);
const Color themeShade500 = Color(0xFF99CC8A);
const Color themeShade600 = Color(0xFF8AC479);

const Color themeShade700 = Color(0xFFBFC8C4);
const Color themeShade800 = Color(0xFF7F9188);
const Color themeShade900 = Color(0xFF465E55);
const Color themeShade1000 = Color(0xFF2A443B);
const Color themeShade1100 = Color(0xFF1C372E);
const Color themeShade1200 = Color(0xFF0D2A21);

const Color themeAccent100 = Color(0xFFD8C7DA);
const Color themeAccent200 = Color(0xFFB08FB4);
const Color themeAccent300 = Color(0xFF88578F);
const Color themeAccent400 = Color(0xFF743B7C);
const Color themeAccent500 = Color(0xFF6A2D73);
const Color themeAccent600 = Color(0xFF601E69); //TODO: Add the orange shade from Canva

//Blue Color Scheme
// const Color themeShade100 = Color(0xFFb3e5fc);
// const Color themeShade200 = Color(0xFF81d4fa);
// const Color themeShade300 = Color(0xFF4fc3f7);
// const Color themeShade400 = Color(0xFF29b6f6);
// const Color themeShade500 = Color(0xFF03a9f4);
// const Color themeShade600 = Color(0xFF039be5);
// const Color themeShade700 = Color(0xFF0288d1);
// const Color themeShade800 = Color(0xFF0277bd);
// const Color themeShade900 = Color(0xFF01579b);

const List<Color> screenGradient = [
  themeShade100,
  themeShade200,
  themeShade300,
  themeShade400,
  themeShade300,
  themeShade200,
  themeShade100,
];

const List<Color> themeColors = [
  themeShade1000,
  themeShade1100,
  themeShade1200,
];

final List<Color> colorToWhiteGradient = [
  themeShade400,
  themeShade300,
  themeShade300,
  themeShade200,
  Colors.white
];

ThemeData getColorScheme({required bool useFlex, required bool isDark}) {
  if (useFlex) {
    if (!isDark) {
      return FlexThemeData.light(
        scheme: FlexScheme.deepPurple,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
    } else {
      return FlexThemeData.dark(
        scheme: FlexScheme.deepPurple,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
    }
  } else {
    if (!isDark) {
      return ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
        typography: Typography.material2018(platform: defaultTargetPlatform),
      );
    } else {
      return ThemeData.from(colorScheme: const ColorScheme.dark()).copyWith(
        typography: Typography.material2018(platform: defaultTargetPlatform),
      );
    }
  }
}
