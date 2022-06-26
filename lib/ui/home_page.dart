import 'package:comparebem/main.dart';
import 'package:comparebem/ui/lista_compras.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:comparebem/ui/lista_compras.dart';
import 'package:comparebem/ui/compras_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'dart:io';




class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


final BannerAd myBanner = BannerAd(
  adUnitId: Platform.isAndroid ? 'ca-app-pub-4975130382486636/3066121895':
   'ca-app-pub-3940256099942544/2934735716',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
);



//notificações

void initState() {

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {

        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null && !kIsWeb) {
          flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title, 
            notification.body, 
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                channel!.description,
                icon: '@mipmap/ic_launcher',
                playSound: true
              )
            )
          );
        }

    });


    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification clicked');     
    });

    super.initState();
    myBanner.load();

}


  @override
  Widget build(BuildContext context) {


    //Widget da lista de ofertas 

    Widget _ofertasList1 = Container(
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
      height: 400.0,
      width: 500.0,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [

          FadeIn(
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 18.0)),
                  Text('Folhetos\nde ofertas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
                    ),
                  ),
              ],
            ), 
          ),

          Divider(color: Colors.transparent,),


          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
            decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://portal.clienteconfianca.com.br/tabloide-bauru/'), 
                    icon: Image.asset('images/compras-1.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),
                ],
              ),
            )
          ),
          ),


          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed:  () => launchUrlString('https://www.barracaosm.com.br/ofertas'), 
                    icon: Image.asset('images/compras-11.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),

                ],
              ),
            )
          ),
          ),


          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,  
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://superbombauru.com.br/ofertas/'), 
                    icon: Image.asset('images/compras-14.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),
                ],
              ),
            )
          ),
          ),


          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
            decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://www.assai.com.br/ofertas/sao-paulo/assai-bauru'), 
                    icon: Image.asset('images/compras-4.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),
                ],
              ),
            )
          ), 
          ),
         

          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://www.makro.com.br/makro.php?id=home#HomeOfertasBR'), 
                    icon: Image.asset('images/compras-6.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),

                ],
              ),
            )
          ),
          ),
         

          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:   Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://www.supersaojudas.com.br/folheto-digital/'), 
                    icon: Image.asset('images/compras-13.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),
                ],
              ),
            )
          ),
          ),
        

          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [


                  TextButton.icon(
                    onPressed: () => launchUrlString('https://www.paodeacucar.com/especial/hs_ofertas?qt=12&p=1&gt=grid'), 
                    icon: Image.asset('images/compras-3.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),

                ],
              ),
            )
          ), 
          ),
         

          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://www.samsclub.com.br/?gclid=Cj0KCQjwkIGKBhCxARIsAINMioJS6TzgQC-w-1r_gqZIsy8M_nP4aC0TpkhGDXrLmtkn368E8Uegw4UaAvbmEALw_wcB'), 
                    icon: Image.asset('images/compras-7.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),

                ],
              ),
            )
          ),
          ),
         
          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://www.spani.com.br/lojas/bauru/'), 
                    icon: Image.asset('images/compras-5.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),

                ],
              ),
            )
          ), 
          ),
         
          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://panelaosupermercados.com.br/?home=1'), 
                    icon: Image.asset('images/compras-12.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),

                ],
              ),
            )
          ), 
          ),
         

          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://www.atacadao.com.br/catalogo/'), 
                    icon: Image.asset('images/compras-10.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),
                ],
              ),
            )
          ),           
          ),
          
          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child:  Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://www.tauste.com.br/ofertas'), 
                    icon: Image.asset('images/compras-2.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),
                ],
              ),
            )
          ),
          ),
         
          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Container(
            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                children: [

                  TextButton.icon(
                    onPressed: () => launchUrlString('https://www.tendaatacado.com.br/institucional/nossas-ofertas'), 
                    icon: Image.asset('images/compras-8.png', height: 80.0, width: 80.0,), 
                    label: Text('  Confira as ofertas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold) ,
                    ),
                  ),
                
                ],
              ),
            )
          ),
          ),
          
        ],
      ),
    );



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
                  Text('Olá!\nComo você está?',
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
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0),),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0,0))]), 
                height: 40.0,
                width: 150.0,  
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  onChanged: (String? newValue) {
                     setState(() {
                      var dropdownValue = newValue!;
                    });
                  },
                  underline: Container() ,
                  icon: FaIcon(FontAwesomeIcons.angleDown, size: 15.0,),
                  iconEnabledColor: Colors.orange[700],
                  iconDisabledColor: Colors.grey,
                  dropdownColor: Colors.white,
                    items: [DropdownMenuItem(
                    child: Text('Bauru  ',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),)],
                ),
              ),                            
            ],
          ), 
          ),
                  
                
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
                      _ofertasList1,          
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
              ),

                      
            ],

          )        
        ],
      ),       
      )
      
      );
      
  }

}