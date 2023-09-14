import 'package:flutter/material.dart';
import 'package:murilobarberapp/screens/feed_screen.dart';
import 'package:murilobarberapp/screens/home_screen.dart';
import 'package:murilobarberapp/screens/plans_screen.dart';
import 'package:murilobarberapp/screens/schedule_screen.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: IconTheme(
        data: const IconThemeData(color: Colors.black26),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FeedScreen()),
                  );
                },
                icon: const Icon(Icons.home_max_sharp),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Home()),
                    );
                  },
                  icon: const Icon(Icons.account_circle)),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Schedule_screen()),
                  );
                },
                icon: const Icon(Icons.add_business_sharp),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PlansScreen()),
                  );
                },
                icon: const Icon(Icons.shopping_cart_checkout_sharp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}