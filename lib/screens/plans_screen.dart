import 'package:flutter/material.dart';
import 'package:murilobarberapp/data/plans.dart';
import 'package:murilobarberapp/repositories/plans_repository.dart';
import 'package:murilobarberapp/screens/add_feed_screen.dart';
import 'package:murilobarberapp/screens/purchase_plans_screen.dart';
import 'package:murilobarberapp/screens/settings_page.dart';
import 'package:murilobarberapp/widgets/bottom_custom.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  final List<GlobalKey> categorias = [GlobalKey(), GlobalKey(), GlobalKey()];
  late ScrollController scrollCont;
  BuildContext? tabContext;

  @override
  void initState() {
    scrollCont = ScrollController();
    scrollCont.addListener(changeTabs);
    super.initState();
  }

  changeTabs() {
    late RenderBox box;

    for (var i = 0; i < categorias.length; i++) {
      box = categorias[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (scrollCont.offset >= position.dy) {
        DefaultTabController.of(tabContext!).animateTo(
          i,
          duration: const Duration(milliseconds: 100),
        );
      }
    }
  }

  scrollTo(int index) async {
    scrollCont.removeListener(changeTabs);
    final categoria = categorias[index].currentContext!;
    await Scrollable.ensureVisible(
      categoria,
      duration: const Duration(milliseconds: 600),
    );
    scrollCont.addListener(changeTabs);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Builder(builder: (BuildContext context) {
          tabContext = context;
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
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'NOSSOS PLANOS',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              bottom: TabBar(
                labelColor: Theme.of(context).colorScheme.onPrimaryContainer,
                tabs: const [
                  Tab(child: Text('Corte')),
                  Tab(child: Text('Barba')),
                  Tab(child: Text('Combos')),
                ],
                onTap: (int index) => scrollTo(index),
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
              child: SingleChildScrollView(
                controller: scrollCont,
                child: Column(
                  children: [
                    categoriaPlan('Corte', categorias[0]),
                    gerarListaPlans(PlansRepository.cortes, context),
                    categoriaPlan('Barba', categorias[1]),
                    gerarListaPlans(PlansRepository.barbas, context),
                    categoriaPlan('Combos', categorias[2]),
                    gerarListaPlans(PlansRepository.combos, context),
                  ],
                ),
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
        }));
  }
}

gerarListaPlans(List<Plan> plans, BuildContext context) {
  return Column(
    children: plans.map((Plan) => PlanItem(Plan, context)).toList(),
  );
}

Widget PlanItem(Plan plan, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PurchasePage(plan: plan),
        ),
      );
    },
    child: Column(
      children: [
        ListTile(
          title: Text(plan.name),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.description,
                  style: const TextStyle(fontSize: 13),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    plan.price,
                    style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onPrimaryContainer,),
                  ),
                ),
              ],
            ),
          ),
          trailing: Image.asset(plan.image),
          contentPadding: const EdgeInsets.all(15),
        ),
        const Divider(),
      ],
    ),
  );
}

Widget categoriaPlan(String titulo, GlobalKey key) {
  return Padding(
    key: key,
    padding: const EdgeInsets.only(top: 24),
    child: Column(
      children: [
        ListTile(
          title: Text(
            titulo,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Divider(),
      ],
    ),
  );
}
