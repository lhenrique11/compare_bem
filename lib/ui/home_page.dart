import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comparebem/main.dart';
import 'package:comparebem/ui/alerta_ofertas.dart';
import 'package:comparebem/ui/compare_ofertas.dart';
import 'package:comparebem/ui/lista_compras.dart';
import 'package:comparebem/ui/ofertas_atacado.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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


    final Stream<QuerySnapshot> _clubeconfiStream =
    FirebaseFirestore.instance.collection('clubeconfianca').snapshots();
    final Stream<QuerySnapshot> _clubetausteStream =
    FirebaseFirestore.instance.collection('clubetauste').snapshots();
    final Stream<QuerySnapshot> _clubemakroStream =
    FirebaseFirestore.instance.collection('clubetauste').snapshots();
    final Stream<QuerySnapshot> _clubesjStream =
    FirebaseFirestore.instance.collection('clubesaojudas').snapshots();

    //Widget da lista de ofertas 

    Widget _ofertasList1 = Container(
      alignment: Alignment.center ,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(40.0),),
      ),
      height: 450.0,
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
                Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 18.0)),
                  Text('Principais ofertas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500
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
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(FeatherIcons.arrowRight, size: 18, color: Colors.white,),  
                    label: Text( 'Confiança',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w500) 
                    ),
                    ),

                    ],
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
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(FeatherIcons.arrowRight, size: 18, color: Colors.white,),  
                    label: Text( 'Barracão',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w500) 
                    ),
                    ),

                    ],
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
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(FeatherIcons.arrowRight, size: 18, color: Colors.white,),  
                    label: Text( 'Superbom',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w500) 
                    ),
                    ),

                    ],
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
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(FeatherIcons.arrowRight, size: 18, color: Colors.white,),  
                    label: Text( 'São Judas Tadeu',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w500) 
                    ),
                    ),

                    ],
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
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(FeatherIcons.arrowRight, size: 18, color: Colors.white,),  
                    label: Text( 'Pão de Açúcar',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w500) 
                    ),
                    ),

                    ],
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
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(FeatherIcons.arrowRight, size: 18, color: Colors.white,),  
                    label: Text( 'Sams Club',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w500) 
                    ),
                    ),

                    ],
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
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            width: 300.0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(FeatherIcons.arrowRight, size: 18, color: Colors.white,),  
                    label: Text( 'Panelão',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w500) 
                    ),
                    ),

                    ],
                  ),
                         
                ],
              ), 
              
            )
          ), 
          ),

          
        ],
      ),
    );

  // lista de opções 

    Widget _opcoesList1 = Container(
    margin: EdgeInsets.symmetric(vertical: 0.0),
    
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
            color:  Colors.grey[900],
            borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 310.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                        child: Text('Ofertas de\nAtacado',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w500
                        ) ,
                      ),
                      ),

                      

                    ]
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[

                      Padding(
                        padding: EdgeInsets.fromLTRB(110.0, 20.0, 0.0, 0.0),
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OfertaAtacado()));
                          },
                          icon: FaIcon(FeatherIcons.arrowRightCircle, color: Colors.white), 
                          label: Text('Veja as ofertas',
                           textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500
                          ) ,
                        ),  
                        ) ,
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
            color: Colors.orange[700],
            borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 310.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                        child: Text('Compare as\nOfertas',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w500
                        ) ,
                      ),
                      ),
                    ]
                  ),
                  
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[

                      Padding(
                        padding: EdgeInsets.fromLTRB(110.0, 20.0, 0.0, 0.0),
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CompareOfertas()));
                          },
                          icon: FaIcon(FeatherIcons.arrowRightCircle, color: Colors.white), 
                          label: Text('Veja as ofertas',
                           textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500
                          ) ,
                        ),  
                        ) ,
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
            color: Colors.grey[700],
            borderRadius: BorderRadius.all(Radius.circular(40.0),),
            ),
            width: 310.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                        child: Text('Alerta de\nOfertas',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w500
                        ) ,
                      ),
                      ),
                    ]
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(110.0, 20.0, 0.0, 0.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      TextButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AlertaPage()));
                      },
                      icon: FaIcon(FeatherIcons.arrowRightCircle, color: Colors.white), 
                      label: Text('Veja as ofertas',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500
                        ) ,
                      ),  
                      )
                    ]
                    ),
                  )
                  
                ],
              ),
            )
          ), 
          ),

                
        ],
      ),
    );

    // Clube de Vantagens lista

    Widget _clubeList1 = Container(
    margin: EdgeInsets.symmetric(vertical: 0.0),
    
    height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [

          FadeIn(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Container(
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40.0),),
            boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 1,
            offset: Offset(0,0))]
            ),
            width: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: TextButton.icon(
                      onPressed: (){
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),
                        )),
                          context: context, 
                          builder: (context){
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),

                                  FadeIn(
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeIn,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.fromLTRB(30.0, 15.0, 0.0, 20.0)),
                                        Text('Clube de Vantagens \nConfiança',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w500
                                        ) ,
                                      ),
                                      ],
                                    ), 
                                  ),

                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),

                                  StreamBuilder<QuerySnapshot<Object?>>(
                                    stream: _clubeconfiStream,
                                    builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot>snapshot) {
                                        if (snapshot.hasError) {
                                          return const Text("Lista Vazia");
                                        }
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const Text("Loading");
                                        }
                                        return FadeIn(
                                          duration: Duration(seconds: 2),
                                          curve: Curves.easeIn,
                                          child: Column(
                                            children: <Widget>[

                                              Text('Veja as ofertas',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w500
                                                ) ,
                                              ),

                                              Divider(color: Colors.transparent,),
                                              Divider(color: Colors.transparent,),
                    
                                              ListView(
                                                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),  
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                children: 
                                                snapshot.data!.docs.map((DocumentSnapshot document) {
                                                Map<String, dynamic> data =
                                                document.data() as Map<String, dynamic>;
                                                return ListTile(
                                                  title: Text(data["ofertas"] ?? "",
                                                    style: GoogleFonts.poppins(
                                                    color: Colors.orange[700], fontSize: 15.0, fontWeight: FontWeight.w500
                                                  ) ,
                                                ),
                                                subtitle: Text(data["local"] ?? "",
                                                  style: GoogleFonts.poppins(
                                                  color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold
                                                ) ,
                                                ),
                                                trailing: IconButton(onPressed: (){
                                                  //Share.share(data['texto'], subject: data['local']);
                                                }, 
                                                icon: Icon(FeatherIcons.share,
                                                color: Colors.orangeAccent, size: 18.0,
                                                )               
                                                ), 
                                                );
                                                }).toList(),
                                              ),
                                            ],
                                          )
                                        );
                                      }
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      },
                      icon: Image.asset('images/compras-1.png', 
                        width: 100, height: 100,), 
                      label: Text(""),     
                    ) ,
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
            boxShadow: [
            BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0,0))]
            ),
            width: 150.0,
            child: Container(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: TextButton.icon(
                      onPressed: (){
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),
                        )),
                          context: context, 
                          builder: (context){
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),

                                  FadeIn(
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeIn,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.fromLTRB(30.0, 15.0, 0.0, 20.0)),
                                        Text('Clube de Vantagens \nTauste',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w500
                                        ) ,
                                      ),
                                      ],
                                    ), 
                                  ),

                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),

                                  StreamBuilder<QuerySnapshot<Object?>>(
                                    stream: _clubetausteStream,
                                    builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot>snapshot) {
                                        if (snapshot.hasError) {
                                          return const Text("Lista Vazia");
                                        }
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const Text("Loading");
                                        }
                                        return FadeIn(
                                          duration: Duration(seconds: 2),
                                          curve: Curves.easeIn,
                                          child: Column(
                                            children: <Widget>[

                                              Text('Veja as ofertas',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w500
                                                ) ,
                                              ),

                                              Divider(color: Colors.transparent,),
                                              Divider(color: Colors.transparent,),
                    
                                              ListView(
                                                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),  
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                children: 
                                                snapshot.data!.docs.map((DocumentSnapshot document) {
                                                Map<String, dynamic> data =
                                                document.data() as Map<String, dynamic>;
                                                return ListTile(
                                                  title: Text(data["ofertas"] ?? "",
                                                    style: GoogleFonts.poppins(
                                                    color: Colors.orange[700], fontSize: 15.0, fontWeight: FontWeight.w500
                                                  ) ,
                                                ),
                                                subtitle: Text(data["local"] ?? "",
                                                  style: GoogleFonts.poppins(
                                                  color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold
                                                ) ,
                                                ),
                                                trailing: IconButton(onPressed: (){
                                                  //Share.share(data['texto'], subject: data['local']);
                                                }, 
                                                icon: Icon(FeatherIcons.share,
                                                color: Colors.orangeAccent, size: 18.0,
                                                )               
                                                ), 
                                                );
                                                }).toList(),
                                              ),
                                            ],
                                          )
                                        );
                                      }
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      },
                      icon: Image.asset('images/compras-2.png', 
                        width: 100, height: 100,),
                        label: Text(""),    
                    ) ,
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
            boxShadow: [
            BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0,0))]
            ),
            width: 150.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[

                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: TextButton.icon(
                          onPressed: (){
                            showModalBottomSheet(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),
                        )),
                          context: context, 
                          builder: (context){
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),

                                  FadeIn(
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeIn,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.fromLTRB(30.0, 15.0, 0.0, 20.0)),
                                        Text('Clube de Vantagens \nMakro',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w500
                                        ) ,
                                        ),
                                      ],
                                    ), 
                                  ),

                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),

                                  StreamBuilder<QuerySnapshot<Object?>>(
                                    stream: _clubemakroStream,
                                    builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot>snapshot) {
                                        if (snapshot.hasError) {
                                          return const Text("Lista Vazia");
                                        }
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const Text("Loading");
                                        }
                                        return FadeIn(
                                          duration: Duration(seconds: 2),
                                          curve: Curves.easeIn,
                                          child: Column(
                                            children: <Widget>[

                                              Text('Veja as ofertas',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w500
                                                ) ,
                                              ),

                                              Divider(color: Colors.transparent,),
                                              Divider(color: Colors.transparent,),
                    
                                              ListView(
                                                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),  
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                children: 
                                                snapshot.data!.docs.map((DocumentSnapshot document) {
                                                Map<String, dynamic> data =
                                                document.data() as Map<String, dynamic>;
                                                return ListTile(
                                                  title: Text(data["ofertas"] ?? "",
                                                    style: GoogleFonts.poppins(
                                                    color: Colors.orange[700], fontSize: 15.0, fontWeight: FontWeight.w500
                                                  ) ,
                                                ),
                                                subtitle: Text(data["local"] ?? "",
                                                  style: GoogleFonts.poppins(
                                                  color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold
                                                ) ,
                                                ),
                                                trailing: IconButton(onPressed: (){
                                                  //Share.share(data['texto'], subject: data['local']);
                                                }, 
                                                icon: Icon(FeatherIcons.share,
                                                color: Colors.orangeAccent, size: 18.0,
                                                )               
                                                ), 
                                                );
                                                }).toList(),
                                              ),
                                            ],
                                          )
                                        );
                                      }
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                          },
                          icon: Image.asset('images/compras-6.png', 
                          width: 100, height: 100,),
                          label: Text(""), 
                        ) ,
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
            boxShadow: [
            BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0,0))]
            ),
            width: 150.0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: TextButton.icon(
                      onPressed: (){
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),
                        )),
                          context: context, 
                          builder: (context){
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),

                                  FadeIn(
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeIn,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.fromLTRB(30.0, 15.0, 0.0, 20.0)),
                                        Text('Clube de Vantagens \nSão Judas Tadeu',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w500
                                        ) ,
                                      ),
                                      ],
                                    ), 
                                  ),

                                  Divider(color: Colors.transparent,),
                                  Divider(color: Colors.transparent,),

                                  StreamBuilder<QuerySnapshot<Object?>>(
                                    stream: _clubesjStream,
                                    builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot>snapshot) {
                                        if (snapshot.hasError) {
                                          return const Text("Lista Vazia");
                                        }
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const Text("Loading");
                                        }
                                        return FadeIn(
                                          duration: Duration(seconds: 2),
                                          curve: Curves.easeIn,
                                          child: Column(
                                            children: <Widget>[

                                              Text('Veja as ofertas',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w500
                                                ) ,
                                              ),

                                              Divider(color: Colors.transparent,),
                                              Divider(color: Colors.transparent,),
                    
                                              ListView(
                                                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),  
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                children: 
                                                snapshot.data!.docs.map((DocumentSnapshot document) {
                                                Map<String, dynamic> data =
                                                document.data() as Map<String, dynamic>;
                                                return ListTile(
                                                  title: Text(data["ofertas"] ?? "",
                                                    style: GoogleFonts.poppins(
                                                    color: Colors.orange[700], fontSize: 15.0, fontWeight: FontWeight.w500
                                                  ) ,
                                                ),
                                                subtitle: Text(data["local"] ?? "",
                                                  style: GoogleFonts.poppins(
                                                  color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold
                                                ) ,
                                                ),
                                                trailing: IconButton(onPressed: (){
                                                  //Share.share(data['texto'], subject: data['local']);
                                                }, 
                                                icon: Icon(FeatherIcons.share,
                                                color: Colors.orangeAccent, size: 18.0,
                                                )               
                                                ), 
                                                );
                                                }).toList(),
                                              ),
                                            ],
                                          )
                                        );
                                      }
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      },
                      icon: Image.asset('images/compras-13.png', 
                        width: 100, height: 100,),
                        label: Text(""), 
                    ) ,
                  )

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
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
        scrollDirection: Axis.vertical,
        child: Column(  
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

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
                  Text('Olá! Seja bem-vindo(a)!',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500
                    ) ,
                  ),
              ],
              ), 
              ),

          Divider(color: Colors.transparent,),

          FadeIn(
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Divider(color: Colors.transparent),             
              FadeIn(
              duration: Duration(seconds: 2),
              curve: Curves.easeIn,
              child: Center(
                child: Container(
                  child: ListView(
                      padding: EdgeInsets.fromLTRB(00.0, 0.0, 0.0, 0.0),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      _opcoesList1,          
                    ],
                  ),
                  
                ),
              ), 
              ),                            
            ],
          ), 
          ),


          Divider(color: Colors.transparent),
          Divider(color: Colors.transparent),


          FadeIn(
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 20.0)),
                  Text('Ofertas de Clubes',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500
                    ) ,
                  ),
              ],
              ), 
              ),


          FadeIn(
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Divider(color: Colors.transparent),             
              FadeIn(
              duration: Duration(seconds: 2),
              curve: Curves.easeIn,
              child: Center(
                child: Container(
                  child: ListView(
                      padding: EdgeInsets.fromLTRB(00.0, 0.0, 0.0, 0.0),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      _clubeList1,          
                    ],
                  ),
                  
                ),
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