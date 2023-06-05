import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  // Will assign route
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();



    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout',),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white ),
                  onPressed: () {},
                  child: Text(
                    'ORDER NOW',
                    style: Theme.of(context).textTheme.headlineMedium!,
                  )
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CUSTOMER INFORMATION',
            style: Theme.of(context).textTheme.headlineMedium,
            ),
            _buildTextFormField(emailController, context, 'Email'),
            _buildTextFormField(nameController, context, 'Name'),
            _buildTextFormField(phoneController, context, 'Phone'),
            Text('Delivery Information',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            _buildTextFormField(addressController, context, 'Address'),
            _buildTextFormField(cityController, context, 'City'),
            _buildTextFormField(countryController, context, 'Country'),
            Text('Order Summary',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OrderSummary(),
          ],
        ),
      ),
    );
  }
  Padding _buildTextFormField(
      TextEditingController controller,
      BuildContext context,
      String labelText,
      )
  {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        SizedBox(width: 75, child: Text(labelText, style: Theme.of(context).textTheme.bodyLarge,)
        ),
        Expanded(
            child: TextFormField(controller: controller,
              decoration: InputDecoration(
                  isDense: true,
                contentPadding: const EdgeInsets.only(left:10),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
                  color: Colors.black,
                ))
              ),
            )
        )
      ],
      ),

    );
  }
}


