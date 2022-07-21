import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';

class CompareOfertas extends StatefulWidget {
  const CompareOfertas({ Key? key }) : super(key: key);

  @override
  State<CompareOfertas> createState() => _CompareOfertasState();
}

class _CompareOfertasState extends State<CompareOfertas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
        scrollDirection: Axis.vertical,
        child: Column(

          children: [
            Divider(color: Colors.transparent,),
            Divider(color: Colors.transparent,),
            Divider(color: Colors.transparent,),
            Divider(color: Colors.transparent,),

            FadeIn(
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 20.0)),
                  Text('Compare as ofertas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500
                    ) ,
                  ),
              ],
              ), 
              ),

          Divider(color: Colors.transparent,),

          ],
        )
      ),
    );
  }
}