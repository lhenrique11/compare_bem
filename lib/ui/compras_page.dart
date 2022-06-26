import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher_string.dart';



class ComprasPage extends StatefulWidget {
  const ComprasPage({ Key? key }) : super(key: key);

  @override
  _ComprasPageState createState() => _ComprasPageState();
}

class _ComprasPageState extends State<ComprasPage> {


  final BannerAd myBanner = BannerAd(
  adUnitId: Platform.isAndroid ? 'ca-app-pub-4975130382486636/8320294489':
   'ca-app-pub-3940256099942544/2934735716',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
);

void initState() {
    super.initState();
    myBanner.load();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
        scrollDirection: Axis.vertical,
        child: Column(  
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

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
                  Text('Compre no\nseu supermercado\nfavorito',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold
                    ) ,
                  ),
              ],
              ), 
          ),

          Divider(color: Colors.transparent,),
          Divider(color: Colors.transparent,),

          FadeIn(
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
            child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/sitecompras.png',),
                Text('Faça suas compras \ndiretamente no site do seu \nsupermercado preferido',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold
                    ) ,
                ),

              ]
            ) 
          ),
          ),
          

          Divider(color: Colors.transparent,),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [

              Divider(color: Colors.transparent),             
              FadeIn(
              duration: Duration(seconds: 2),
              curve: Curves.easeIn,
              child: Center(
                child: Container(
                  child: ListView(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      _compreonlineList1,          
                    ],
                  ),
                  
                ),
              ), 
              ),    

              Divider(color: Colors.transparent,),
              
              Container(
              width: 468.0,
              height: 60.0,
              child: AdWidget(ad: myBanner),
              ) 
          
            ],
          )  
        ]

        ),        
      ),      
    );

    
  }
  
}

Widget _compreonlineList1 = Container(
    margin: EdgeInsets.symmetric(vertical: 10.0),
    decoration: BoxDecoration(
      color: Colors.orange[700],
        borderRadius: BorderRadius.all(Radius.circular(40.0),),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 2,
          blurRadius: 8,
          offset: Offset(0,0))]),
    height: 250.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [

          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/compras-1.png', width: 120.0, height: 120.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      TextButton.icon(
                      onPressed: () => launchUrlString('https://www.confianca.com.br/'),
                      icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange[700]), 
                      label: Text('Acesse o site',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold
                        ) ,
                      ),  
                      )
                    ]
                  )
                  
                ],
              ),
            )
          ),

         
          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 200.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/compras-2.png', width: 120.0, height: 120.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      TextButton.icon(
                      onPressed: () => launchUrlString('https://www.tauste.com.br/'),
                      icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange[700]), 
                      label: Text('Acesse o site',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold
                        ) ,
                      ),  
                      )
                    ]
                  )
                ],
              ),
            )
          ), 
          ),

         
          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 200.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/compras-3.png', width: 120.0, height: 120.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      TextButton.icon(
                      onPressed: () => launchUrlString('https://www.paodeacucar.com/'),
                      icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange[700]), 
                      label: Text('Acesse o site',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold
                        ) ,
                      ),  
                      )
                    ]
                  )
                ],
              ),
            )
          ), 
          ),

         
          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 200.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/compras-5.png', width: 120.0, height: 120.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      TextButton.icon(
                      onPressed: () => launchUrlString('https://www.spanionline.com.br/'),
                      icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange[700]), 
                      label: Text('Acesse o site',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold
                        ) ,
                      ),  
                      )
                    ]
                  )
                ],
              ),
            )
          ),
          ),


          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 200.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/compras-7.png', width: 120.0, height: 120.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      TextButton.icon(
                      onPressed: () => launchUrlString('https://www.samsclub.com.br/'),
                      icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange[700]), 
                      label: Text('Acesse o site',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold
                        ) ,
                      ),  
                      )
                    ]
                  )
                ],
              ),
            )
          ), 
          ),
          
         
          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 200.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/compras-8.png', width: 120.0, height: 120.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      TextButton.icon(
                      onPressed: () => launchUrlString('https://www.tendaatacado.com.br/'),
                      icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange[700]), 
                      label: Text('Acesse o site',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold
                        ) ,
                      ),  
                      )
                    ]
                  )
                ],
              ),
            )
          ),
          ),

         FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 200.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/compras-10.png', width: 120.0, height: 120.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      TextButton.icon(
                      onPressed: () => launchUrlString('https://www.atacadao.com.br/'),
                      icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange[700]), 
                      label: Text('Acesse o site',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold
                        ) ,
                      ),  
                      )
                    ]
                  )
                ],
              ),
            )
          ), 
         ),
         
          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 200.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/compras-11.png', width: 120.0, height: 120.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      TextButton.icon(
                      onPressed: () => launchUrlString('https://www.barracaosm.com.br/'),
                      icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange[700]), 
                      label: Text('Acesse o site',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold
                        ) ,
                      ),  
                      )
                    ]
                  )
                ],
              ),
            )
          ), 
         ),        
        ],
      ),
    );