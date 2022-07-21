import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';

class OfertaAtacado extends StatefulWidget {
  const OfertaAtacado({ Key? key }) : super(key: key);

  @override
  State<OfertaAtacado> createState() => _OfertaAtacadoState();
}

class _OfertaAtacadoState extends State<OfertaAtacado> {
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
                  Text('Ofertas de Atacado',
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