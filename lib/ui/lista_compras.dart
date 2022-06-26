import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';


class ListaCompraPage extends StatefulWidget {
  const ListaCompraPage({ Key? key }) : super(key: key);

  @override
  _ListaCompraPageState createState() => _ListaCompraPageState();
}

class _ListaCompraPageState extends State<ListaCompraPage> {

  final _itemController = TextEditingController(); 
  final _precoController = TextEditingController();

  List _itemList = [];
  late Map<String, dynamic> _lastRemoved;
  late int _lastRemovedPos;

  get index => _itemList[index]['itemtitle']['itempreco'];

  final BannerAd myBanner = BannerAd(
  adUnitId: Platform.isAndroid ? 'ca-app-pub-4975130382486636/5338679982':
   'ca-app-pub-3940256099942544/2934735716',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
);

void initState() {
    super.initState();
    _readDataTarefa().then((data) {
    setState(() {
      _itemList = json.decode(data!);
    });
   }
  );
    myBanner.load();
}

void _addItem() {
  setState(() {
    Map<String, dynamic> newItem = Map();
    newItem['itemtitle'] = _itemController.text;
    newItem['itempreco'] = _precoController.text;
    _itemController.text = "";
    _precoController.text = "";
    newItem["ok"] = false;
    _itemList.add(newItem);

    _saveDataItem();

  });

}

Widget _addItemButton (BuildContext context){
  return Container(
    child: FadeIn(
      duration: Duration(seconds: 3),
      curve: Curves.elasticIn,
      child: TextButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange[700]),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)) ))
        ),
        icon: FaIcon(FontAwesomeIcons.plus,
          color: Colors.white, size: 24.0
        ), 
        label: Text('Novo Item', textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Colors.white, 
            fontSize: 20.0, fontWeight: FontWeight.bold)),
        onPressed: (){
          showModalBottomSheet(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),
            )),
            context: context, 
            builder: (context){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(color: Colors.transparent),
                    Divider(color: Colors.transparent),
                    FadeIn(
                      duration: Duration(seconds: 3),
                      curve: Curves.elasticIn,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
            
                          Divider(color: Colors.transparent),
                          Divider(color: Colors.transparent),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(0.0)),
                              Container(
                                width: 300.0,  
                                child: TextField(
                                  cursorColor: Colors.black,    
                                  controller: _itemController,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black, 
                                    fontSize: 25.0, fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(    
                                    enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent) 
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                  ),
                                  labelText: "Novo item da lista",
                                  labelStyle: GoogleFonts.montserrat(
                                    color: Colors.black, 
                                    fontSize: 25.0, fontWeight: FontWeight.bold)
                                  ),
                                ), 
                              ),
                            ]
                          ),

                          Divider(color: Colors.transparent),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(0.0)),
                              Container(
                                width: 300.0,  
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.black,    
                                  controller: _precoController,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black, 
                                    fontSize: 25.0, fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(    
                                    enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent) 
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                  ),
                                  labelText: "Preço do item",
                                  labelStyle: GoogleFonts.montserrat(
                                    color: Colors.black, 
                                    fontSize: 25.0, fontWeight: FontWeight.bold)
                                  ),
                                ), 
                              ),
                            ]
                          ),


                          Divider(color: Colors.transparent),
                          Divider(color: Colors.transparent),

                          TextButton.icon(
                            label: Text('Incluir', textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.black, 
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                            icon: FaIcon(FontAwesomeIcons.plusCircle,
                            color: Colors.black, size: 20.0
                            ), 
                          onPressed: (){                               
                      
                            _addItem();

                            showTopSnackBar(
                              context, 
                              CustomSnackBar.success(message: 'O item está na sua lista de compra!',
                                textStyle: GoogleFonts.montserrat(color: Colors.white, fontSize: 12.0,
                                fontWeight: FontWeight.normal),
                              ),
                              displayDuration: Duration(seconds: 2),          
                            );   
                          } 
                        ),

                        Divider(color: Colors.transparent),
                        Divider(color: Colors.transparent),

                        FadeIn(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn,
                          child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Image.asset('images/addcompras.png',),
                          Text('Adicione um item na sua lista de compra',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold
                          ) ,
                          ),
                        ]
                        ) 
                        ),
                      ),

                        Divider(color: Colors.transparent),
                        Divider(color: Colors.transparent),

                      ],
                    ), 
                  ),
                ],
              ),
            );
            }
          );
        }, 
      ),  
    ),
  );
}

// Widget lista de compras

Widget listaItem(context, index){
  return SingleChildScrollView( 
  child: Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0))
  ), 
  elevation: 0.0,  
  shadowColor: Colors.grey[200],  
  child: ListTile(
    tileColor: Colors.white,
    title: Text("${_itemList [index]["itemtitle"]}",
    style: GoogleFonts.montserrat(
      color: Colors.orange[700], fontSize: 24.0, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(" R\$ ${_itemList [index]["itempreco"]}",
    style: GoogleFonts.montserrat(
      color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold),
    ), 
    trailing: IconButton(
      onPressed: (){
        setState(() {

            _lastRemoved = Map.from(_itemList[index]);
            _lastRemovedPos = index;
            _itemList.removeAt(index);

            _saveDataItem();

            });


          showTopSnackBar(
          context, 
          CustomSnackBar.success(message: 'Item comprado!',
          textStyle: GoogleFonts.montserrat(color: Colors.white, fontSize: 17.0,
          fontWeight: FontWeight.normal),
          ),
          onTap: (){
            setState(() {
              _itemList.insert(_lastRemovedPos, _lastRemoved);
              _saveDataItem();
             });
          },
          displayDuration: Duration(seconds: 2),
          
          ); 

      },
      icon: FaIcon(FontAwesomeIcons.solidCheckCircle,
      color: Colors.green, size: 24.0,
      ),
    ), 
    
    leading: IconButton(
      onPressed: (){
        setState(() {

            _lastRemoved = Map.from(_itemList[index]);
            _lastRemovedPos = index;
            _itemList.removeAt(index);

            _saveDataItem();

        });


          showTopSnackBar(
          context, 
          CustomSnackBar.error(message: 'Item excluido!',
          textStyle: GoogleFonts.montserrat(color: Colors.white, fontSize: 17.0,
          fontWeight: FontWeight.normal),
          ),
          onTap: (){
            setState(() {
              _itemList.insert(_lastRemovedPos, _lastRemoved);
              _saveDataItem();
             });
          },
          displayDuration: Duration(seconds: 2),
          
          ); 

      },
      icon: FaIcon(FontAwesomeIcons.trash,
      color: Colors.red, size: 24.0,
      ),
    ), 
  ))
  );
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
          children:<Widget>[

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
                  Text('Faça sua \nlista de \ncompras',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold
                    ) ,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(55.0, 5.0, 0.0, 0.0),
                    child: _addItemButton(context) 
                  ),
              ],
            ), 
          ),

          Divider(color: Colors.transparent),
          Divider(color: Colors.transparent),
          
          _itemList.isEmpty == true ?
          FadeIn(
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
            child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/listacompras.png',),
                Text('Crie sua lista de compras aqui!',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold
                    ) ,
                ),

              ]
            ) 
          ),
          ):

          FadeIn(
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child: Column(
            children:<Widget>[  
              ListView.builder(  
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,  
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                itemCount: _itemList.length,
                itemBuilder: listaItem,
              ),
              ]
            ),
          ),

          Container(
            height: 300.0,
            width: 200.0,
            color: Colors.transparent,
          ),

          Divider(color: Colors.transparent),
          Divider(color: Colors.transparent),

          Container(
            width: 468.0,
            height: 60.0,
            child: AdWidget(ad: myBanner),
          ) 

          ],
        ) ,
      )   
    );



    
}


  Future<File> _getFileItem() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveDataItem() async{
    String data = json.encode(_itemList);

    final file = await _getFileItem();
    return file.writeAsString(data);
  }

  Future<String?> _readDataTarefa() async{
    try {
      final file = await _getFileItem();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

}