import '../widgets/widgets.dart';

class BuyOrderForm extends StatelessWidget {
  const BuyOrderForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Estás comprando SATs por:',
          ),
          gapH16,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FiatSelector(),
              gapW16,
              Expanded(
                child: AmountField(),
              ),
            ],
          ),
          gapH16,
          PaymentMethodSelector(),
          gapH64,
          RateSelector(),
          gapH16,
          SubmitButton(),
        ],
      ),
    );
  }
}

class FiatSelector extends StatelessWidget {
  const FiatSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: DropdownButtonFormField<String>(
        focusColor: Colors.transparent,
        decoration: InputDecoration(
          labelText: 'Currency',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        value: 'USD',
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        onChanged: (newValue) {},
        items: <String>['USD', 'ARS', 'MXN'].map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              alignment: Alignment.center,
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }
}

class AmountField extends StatelessWidget {
  const AmountField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.attach_money),
        labelText: 'Amount',
        helperText: 'Only numbers',
        errorText: null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class PaymentMethodSelector extends StatelessWidget {
  const PaymentMethodSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      focusColor: Colors.transparent,
      decoration: InputDecoration(
        labelText: 'Payment method',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      value: 'Cash',
      icon: const Icon(Icons.arrow_drop_down_circle_outlined),
      onChanged: (newValue) {},
      items: <String>['Cash', 'Bank transfer'].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }
}

class RateSelector extends StatelessWidget {
  const RateSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Select the rate to apply:',
        ),
        gapH4,
        Row(
          children: [
            const Text('-5%'),
            Expanded(
              child: Slider(
                value: 0.0,
                onChanged: (newValue) {},
                min: -5,
                max: 5,
                divisions: 10,
                label: '0.0',
              ),
            ),
            const Text('5%'),
          ],
        ),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add),
      label: const Text('Order'),
    );
  }
}
