import 'package:news/pages/screens.dart';
import 'package:news/widget/column_builder.dart';

class SubscriptionPlans extends StatefulWidget {
  const SubscriptionPlans({Key key}) : super(key: key);

  @override
  State<SubscriptionPlans> createState() => _SubscriptionPlansState();
}

class _SubscriptionPlansState extends State<SubscriptionPlans> {
  String isSelected = 'Weekly';

  final plansList = [
    {
      'plan': 'Weekly',
      'amount': '\$9.99',
      'detail1': 'Remove Ads',
      'detail2': 'Watch Live News',
      'detail3': 'Unlimited access to all the journalism we offer.',
    },
    {
      'plan': 'Monthly',
      'amount': '\$19.99',
      'detail1': 'Remove Ads',
      'detail2': 'Watch Live News',
      'detail3': 'Unlimited access to all the journalism we offer.',
    },
    {
      'plan': 'Annualy',
      'amount': '\$29.99',
      'detail1': 'Remove Ads',
      'detail2': 'Watch Live News',
      'detail3': 'Unlimited access to all the journalism we offer.',
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
          'Subscription Plans',
          style: primaryColor20SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          ColumnBuilder(
            itemCount: plansList.length,
            itemBuilder: (context, index) {
              final item = plansList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 2.0, vertical: fixPadding),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = item['plan'];
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(fixPadding),
                    decoration: isSelected == item['plan']
                        ? BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/cardBackground.png'),
                              fit: BoxFit.cover,
                            ),
                          )
                        : BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 2),
                                color: primaryColor.withOpacity(0.1),
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['plan'],
                              style: TextStyle(
                                color: isSelected == item['plan']
                                    ? whiteColor
                                    : primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              item['amount'],
                              style: TextStyle(
                                color: isSelected == item['plan']
                                    ? whiteColor
                                    : primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        heightSpace,
                        heightSpace,
                        details(detail: item['detail1'], plan: item['plan']),
                        heightSpace,
                        details(detail: item['detail2'], plan: item['plan']),
                        heightSpace,
                        details(detail: item['detail3'], plan: item['plan']),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          buyNowButton(),
        ],
      ),
    );
  }

  details({String detail, plan}) {
    return Row(
      children: [
        Container(
          height: 4.0,
          width: 4.0,
          decoration: BoxDecoration(
            color: isSelected == plan ? whiteColor : primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        widthSpace,
        widthSpace,
        Text(
          detail,
          style: TextStyle(
            color: isSelected == plan ? whiteColor : primaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  buyNowButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 3.0,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SelectPaymentMethod()),
        ),
        child: Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: primaryColor),
          ),
          child: Text(
            'Buy Now',
            style: primaryColor20BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
