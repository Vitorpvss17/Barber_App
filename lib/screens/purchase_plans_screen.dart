import 'package:flutter/material.dart';
import 'package:murilobarberapp/data/plans.dart';

class PurchasePage extends StatelessWidget {
  final Plan plan;

  PurchasePage({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comprar Plano'),
        backgroundColor: Theme.of(context).primaryColor,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(plan.image),
                const Text(
                  'Você está prestes a comprar o plano:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  '${plan.name} : ${plan.description} por R\$ ${plan.price}',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Confirmar Compra'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
