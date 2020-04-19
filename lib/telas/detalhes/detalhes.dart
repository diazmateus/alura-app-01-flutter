import 'package:flutter/material.dart';
import "../../modelos/receita.dart";

class Detalhes extends StatelessWidget {
  final Receita receita;

  Detalhes({Key key, @required this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _contruirImagemDetalhes(receita.foto),
          _contruirTituloDetalhes(receita.titulo),
          _contruirLinhaIconesDetalhes('${receita.porcoes} porções', receita.tempoPreparo),
          _contruirSubtituloDetalhes("Ingredientes"),
          _contruirTextoDetalhes(receita.ingredientes),
          _contruirSubtituloDetalhes("Modo de preparo"),
          _contruirTextoDetalhes(receita.modoPreparo)
        ],
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _contruirImagemDetalhes(foto) {
    return Image.asset(foto);
  }

  Widget _contruirTituloDetalhes(titulo) {
    return Center(
      child: Text(
        titulo,
        style: TextStyle(color: Colors.deepOrange, fontSize: 30),
      ),
    );
  }

  Widget _contruirLinhaIconesDetalhes(rendimento, tempo_preparo) {
    return Row(
      children: <Widget>[
        _contruirColunaIconeDetalhes(Icons.restaurant, rendimento),
        _contruirColunaIconeDetalhes(Icons.timer, tempo_preparo)
      ],
    );
  }

  Widget _contruirColunaIconeDetalhes(icon, text) {
    return Expanded(
        child: Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.deepOrange,
        ),
        Text(
          text,
          style:
              TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }

  Widget _contruirSubtituloDetalhes(subtitulo) {
    return Center(
      child: Text(subtitulo, style: TextStyle(fontSize: 20)),
    );
  }

  Widget _contruirTextoDetalhes(texto) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(texto),
    );
  }

  Widget _construirAppBar() {
    return AppBar(title: Text("Cozinhando em Casa"));
  }
}
