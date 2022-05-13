import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsDemo extends StatelessWidget {
  const GoogleFontsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Google fonts demonstration',
                        style: GoogleFonts.dancingScript())),
        body: Column(
          children: [
            Text(
              'This is Google Fonts',
              style: GoogleFonts.lato()),
            Text(
              'This is Google Fonts',
              style: GoogleFonts.getFont('Lato'),
            ),
            Text(
              'Changed size text',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.red, letterSpacing: .5,
                    fontSize: 40, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              'This is Google Fonts',
              style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline4),
            ),
            Text(
              'This is Google Fonts',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
