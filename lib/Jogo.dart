import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import  'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _img = AssetImage("img/padrao.png");

  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ['papel','pedra','tesoura'];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

     switch(escolhaApp){
       case "pedra":
         setState(() {
           this._img = AssetImage("img/pedra.png");
         });
         break;
       case 'papel':
        setState(() {
        this._img = AssetImage("img/papel.png");
        });
        break;
        case 'tesoura':
         setState(() {
         this._img = AssetImage("img/tesoura.png");
         });
         break;
     }

     if(escolhaUsuario == "pedra" && escolhaApp == "tesoura" ||
         escolhaUsuario == "papel" && escolhaApp == "pedra" ||
         escolhaUsuario == "tesoura" && escolhaApp == "papel"){
       _mensagem = "Parabéns, você ganhou";
     }
     else if(escolhaUsuario == escolhaApp){
       _mensagem = "empate, tente outra vez";
     }else{
       _mensagem = "Que pena, você perdeu";
     }


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('JokenPo', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text('Esolha do App', textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          ),
          Image(image: this._img),
          Padding(padding: EdgeInsets.only(top: 32,bottom: 16),
            child: Text(_mensagem, textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
              onTap: (){
                _opcaoSelecionada("pedra") ;
               },
                child: Image.asset("img/pedra.png",height: 100,) ,
            ),
              GestureDetector(
                onTap: (){
                  _opcaoSelecionada("papel");
                },
                child: Image.asset("img/papel.png",height: 100,) ,
              ),

              GestureDetector(
                onTap: () {_opcaoSelecionada ("tesoura");},
                child: Image.asset("img/tesoura.png",height: 100,),
              )


            ],
          )
        ],
      ),
    );
  }
}
