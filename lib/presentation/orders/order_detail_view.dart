import '../widgets/widgets.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Order Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User: John Doe'),
            Text('Esta comprando Sats por xxxx ARS'),
            Text('Tasa: yadio.io + 3%'),
            Text('Medio de pago: Transferencia Banco'),
            Text('x operaciones exitosas'),
            Text('Reputación: 4.5'),
            Spacer(),
            Row(
              children: [
                // Cancel and ok buttons
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
