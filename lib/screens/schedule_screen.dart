import 'package:flutter/material.dart';
import 'package:murilobarberapp/screens/add_feed_screen.dart';
import 'package:murilobarberapp/screens/settings_page.dart';
import 'package:murilobarberapp/widgets/bottom_custom.dart';

class Schedule_screen extends StatelessWidget {
  const Schedule_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SettingsPage()),
            );
          },
          icon: const Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text(
            'CORTES',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Background 6.jpg"),
              fit: BoxFit.cover),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: const [
            Text(
              'Conheça nossos cortes:',
              style: TextStyle(color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 50,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage(
                        "assets/images/corte-americano-masculino.jpg"),
                  ),
                ),
                Flexible(
                  flex: 50,
                  child: Column(
                    children: [
                      Text(
                        '"Corte americano:A tendência do momento é o corte americano, que nada mais é do que a variação'
                        ' de um corte baixo masculino clássico, o militar. A diferença está nas possibilidades: alto, '
                        'médio, baixo ou disfarçado, as opções são as mais diversas para quem quer estar hype sem perder '
                        'a versatilidade."',
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 50,
                  child: Column(
                    children: [
                      Text(
                        '"Degradê: Nos últimos tempos, o corte degradê, que também é conhecido como fade, '
                        'ganhou a atenção dos homens que buscam um visual moderno. '
                        'Para chegar nesse estilo de cabelo curto masculino, as laterais devem ser raspadas'
                        ' ou mais baixas que o topo da cabeça, formando justamente o efeito de degradê."',
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 50,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage("assets/images/degradê.jpg"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 50,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage("assets/images/jaca.jpg"),
                  ),
                ),
                Flexible(
                  flex: 50,
                  child: Column(
                    children: [
                      Text(
                        '"Corte do Jaca: Cabelo na régua e sombreado perfeito são as melhores características para '
                        'descrever o corte do jaca. Democrático, ele combina com todos os tipos de cabelo e ainda pode'
                        ' receber estilizações, como riscos, desenhos e reflexos alinhados."',
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 50,
                  child: Column(
                    children: [
                      Text(
                        '"Undercut: O undercut é aquele corte com volume no topo da cabeça e completamente raspado na nuca e laterais.'
                        ' É perfeito para quem quer ficar na moda, mas com um corte simples. Para manter o estilo sempre em dia,'
                        ' o ideal é fazer a manutenção a cada 10 dias, para deixar a parte de baixo bem raspada."',
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 50,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage("assets/images/undercut.jpg"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddFeedScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const CustomBottom(),
    );
  }
}
