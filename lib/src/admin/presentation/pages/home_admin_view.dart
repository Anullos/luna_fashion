import 'package:flutter/material.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';

class HomeAdminView extends StatelessWidget {
  const HomeAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24.0),
        ListTile(
          title: const Text(
            'Luna Fashion',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('La mejor tienda de ropa'),
              Text('Dirección: Calle San Rafael 14'),
              Text('Tlf: 666666666'),
            ],
          ),
          leading: Image.asset('assets/logo.png'),
        ),
        const SizedBox(height: 24.0),
        Image.asset('assets/images/tienda.jpg'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).serviceTecnic,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Daniel Aranda Maestro',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '655555555',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
