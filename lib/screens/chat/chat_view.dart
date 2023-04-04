// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Vendiendo Sats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Por favor paga en tu wallet esta factura para comenzar tu venta',
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'lnbc1pjzsny2pp5ul53yuqhcymsdfyc8rcesghrumzu2znzl9hzexn8yl3zx7sxrr0sdqu2askcmr9wssx7e3q2dshgmmndp5scqzpgxqyz5vqsp5v6kw5y95n0hsplvc7fskkdhawphtgk9kg57z2gk2k5rqdrnyprhq9qyyssqech3724vewwvgkjpqgssu4gjc9fylnk996jutlner0n0anh5v2fsjrqlhtv3k6cjnus6gjlycpm20s58saeyuxc72uh5565xsvewevcpxx9wt7',
            ),
            SizedBox(
              height: 16,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Center(
                        child: Column(
                          children: [
                            Icon(Icons.check_circle_outline),
                            Text(
                              'Copiado al portapapeles',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      content: Text(
                        'Abre tu wallet, paga la factura que acabas de copiar y vuelve para confirmar el pago',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.content_copy),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Luego vuelve y confirma que haz hecho el pago',
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Ok'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
