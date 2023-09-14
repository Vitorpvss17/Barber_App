import 'package:flutter/material.dart';
import 'package:murilobarberapp/location/location.dart';
import 'package:murilobarberapp/screens/add_feed_screen.dart';
import 'package:murilobarberapp/screens/settings_page.dart';
import 'package:murilobarberapp/widgets/bottom_custom.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


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
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Text(
            'PERFIL E LOCALIZAÇÃO',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
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
          children: [
             Text(
              'Quem somos:',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
            const CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage("assets/images/muriloperfil.png"),
            ),
             Text(
              '"Seja bem-vindo ao universo da verdadeira elegância masculina, onde cada traço de barba é esculpido com maestria e cada corte de cabelo'
              'é uma expressão única de estilo. É com imenso orgulho que apresentamos a você o talento incomparável do nosso mestre barbeiro, Murilo,'
              'um artista que há 15 anos vem transformando o ato de cortar cabelo e aparar barba em uma jornada apaixonante e excepcional.'
              'A história de Murilo é uma trilha repleta de dedicação, aprendizado e um amor incondicional pela arte da barbearia.'
              'Desde os cortes clássicos que exalam sofisticação até as tendências contemporâneas que refletem ousadia,'
              'Murilo domina o espectro da estilização masculina como nenhum outro. Seu olhar treinado capta não apenas o estilo de cada indivíduo,'
              ' mas também sua personalidade e essência, resultando em transformações que vão muito além da estética.'
              'Cada cliente sai de sua cadeira não apenas com uma aparência renovada, mas também com uma dose extra de autoconfiança."',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
            ),
             Text(
              "Onde estamos:",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
            TextButton(
              onPressed: () {
                late double latitude = -11.0068294;
                late double longitude = -37.089269;
                launchMaps(latitude, longitude);
              },
              child: const Text(
                'Loteamento Costa Verde Rua A N150 Loja 03',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AddFeedScreen()),
      );
    },
    child: const Icon(Icons.add),
    ),
      bottomNavigationBar: const CustomBottom(),
    );
  }
}
