import 'package:com/telas/detalhes/detalhes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import "../../modelos/receita.dart";

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(body: _construirListaCard(), appBar: _construirAppBar());
  }

  Widget _construirListaCard() {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString("assets/receitas.json"),
        builder: (context, snapshot) {
          List<dynamic> receitas = json.decode(snapshot.data.toString());

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Receita receita = Receita.fromJson(receitas[index]);
              return _construirCard(receita);
            },
            itemCount: receitas == null ? 0 : receitas.length,
          );
        });
  }

  Widget _construirCard(receita) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Detalhes(receita: receita)));
        },
        child: SizedBox(
            height: 280,
            child: Card(
                margin: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        _construirImagemCard(receita.foto),
                        _construirGradientCard(),
                        _contruirTextoCard(receita.titulo)
                      ],
                    )
                  ],
                )
            )
        )
    );
  }

  Widget _contruirTextoCard(titulo) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        titulo,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _construirGradientCard() {
    return Container(
      height: 248,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7)
          ])),
    );
  }

  Widget _construirImagemCard(foto) {
    return Image.asset(foto, fit: BoxFit.fill, height: 248);
  }

  Widget _construirAppBar() {
    return AppBar(title: Text("Cozinhando em Casa"));
  }
}
