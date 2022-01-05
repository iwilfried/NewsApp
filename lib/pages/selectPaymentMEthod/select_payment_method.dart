import 'package:news/pages/screens.dart';
import 'package:news/widget/column_builder.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({Key key}) : super(key: key);

  @override
  _SelectPaymentMethodState createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  int primary;
  String isSelected;

  final cardList = [
    {'image': 'assets/payment_method/visa.png'},
    {'image': 'assets/payment_method/credit_card.png'},
  ];

  final paymentMethodList = [
    {
      'image': 'assets/payment_method/paypal.png',
      'method': 'Paypal',
    },
    {
      'image': 'assets/payment_method/payU.png',
      'method': 'PayU Money',
    },
    {
      'image': 'assets/payment_method/netbanking.png',
      'method': 'Net Banking',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Select Payment Method',
          style: primaryColor20SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          title('Save Cards'),
          cardsList(),
          addButton(),
          title('Choose othe way to pay'),
          paymentMethods(),
        ],
      ),
    );
  }

  title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding),
      child: Text(
        title,
        style: greyColor16SemiBoldTextStyle,
      ),
    );
  }

  cardsList() {
    return ColumnBuilder(
      itemCount: cardList.length,
      itemBuilder: (context, index) {
        final item = cardList[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0, fixPadding, fixPadding * 2.0, fixPadding / 2),
          child: InkWell(
            onTap: () {
              setState(() {
                primary = index;
              });
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: primary == index
                            ? primaryColor
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryColor),
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    widthSpace,
                    Text(
                      'Set As Primary',
                      style: primaryColor14SemiBoldTextStyle,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.21,
                  margin: const EdgeInsets.only(top: fixPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 2),
                        color: primaryColor.withOpacity(0.1),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(item['image']),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  addButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.5,
        fixPadding * 2.0,
        fixPadding * 1.5,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddNewCard()),
        ),
        child: Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: primaryColor),
          ),
          child: Text(
            'Add New Card',
            style: whiteColor20BoldTextStyle,
          ),
        ),
      ),
    );
  }

  paymentMethods() {
    return ColumnBuilder(
      itemCount: paymentMethodList.length,
      itemBuilder: (context, index) {
        final item = paymentMethodList[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding,
            fixPadding * 2.0,
            fixPadding,
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = item['method'];
              });
            },
            child: Container(
              padding: const EdgeInsets.all(fixPadding),
              decoration: BoxDecoration(
                color: isSelected == item['method'] ? primaryColor : whiteColor,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    color: primaryColor.withOpacity(0.1),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    item['image'],
                    height: 22.0,
                    width: 22.0,
                    color: isSelected == item['method']
                        ? whiteColor
                        : primaryColor,
                  ),
                  widthSpace,
                  widthSpace,
                  Text(
                    item['method'],
                    style: TextStyle(
                      color: isSelected == item['method']
                          ? whiteColor
                          : primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
