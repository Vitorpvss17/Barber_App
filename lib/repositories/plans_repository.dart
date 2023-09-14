import 'package:murilobarberapp/data/plans.dart';

class PlansRepository {
  static List<Plan> cortes = [
    Plan(
        name: 'Corte único',
        price: 'R\$29.99',
        description: 'Valor de 1 corte em nossa barbearia',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano mensal',
        price: 'R\$56.99',
        description: 'Esse plano dá direito a 2 cortes no periodo de 1 mês',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano Trimestral',
        price: 'R\$166.99',
        description: 'Esse plano dá direito a 6 cortes no periodo de 3 meses',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano Semestral',
        price: 'R\$329.99',
        description: 'Esse plano dá direito a 12 cortes no periodo de 6 meses',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano Anual',
        price: 'R\$639.99',
        description: 'Esse plano dá direito a 24 cortes no periodo de 12 meses',
        image: 'assets/images/logobarbearia.jpg'),
  ];
  static List<Plan> barbas = [
    Plan(
        name: 'Barba única',
        price: 'R\$17.99',
        description:
        'Valor de 1 corte de barba em nossa barbearia',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano mensal',
        price: 'R\$59.99',
        description:
        'Esse plano dá direito a 4 cortes de barba no periodo de 1 mês',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano Trimestral',
        price: 'R\$169.99',
        description:
            'Esse plano dá direito a 12 cortes de barba no periodo de 3 meses',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano Semestral',
        price: 'R\$324.99',
        description:
            'Esse plano dá direito a 24 cortes de barba no periodo de 6 meses',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano Anual',
        price: 'R\$619.99',
        description:
            'Esse plano dá direito a 48 cortes de barba no periodo de 12 meses',
        image: 'assets/images/logobarbearia.jpg'),
  ];
  static List<Plan> combos = [
    Plan(
        name: 'Corte e Barba únicos',
        price: 'R\$47.99',
        description:
        'Esse plano dá direito a 2 cortes de cabelo e 4 cortes de barba no periodo de 1 mês',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano mensal',
        price: 'R\$119.99',
        description:
            'Esse plano dá direito a 2 cortes de cabelo e 4 cortes de barba no periodo de 1 mês',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano Trimestral',
        price: 'R\$339.99',
        description:
            'Esse plano dá direito a 6 cortes de cabelo e 12 cortes de barba no periodo de 3 meses',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano Semestral',
        price: 'R\$669.99',
        description:
            'Esse plano dá direito a 12 cortes de cabelo e 24 cortes de barba no periodo de 6 meses',
        image: 'assets/images/logobarbearia.jpg'),
    Plan(
        name: 'Plano Semestral',
        price: 'R\$1299.99',
        description:
            'Esse plano dá direito a 24 cortes de cabelo e 48 cortes de barba no periodo de 12 meses',
        image: 'assets/images/logobarbearia.jpg'),
  ];
}
