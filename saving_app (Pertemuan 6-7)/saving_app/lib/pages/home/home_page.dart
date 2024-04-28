import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:saving_app/styles/colors.dart';
import 'package:saving_app/styles/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kBgColor.withOpacity(0.5),
        child: Stack(
          children: [
            _buildMainContent(context),
            _buildDraggableSheet(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 28),
          _buildSavingsContainer(),
          SizedBox(height: 30),
          _buildTransactionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildWelcomeText(),
        _buildProfileImage(),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome', style: kBody1.copyWith(color: kMatterhornBlack)),
        Text('Maulana Rafi - 21102094', style: kHeading6.copyWith(color: kMatterhornBlack)),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/user-img.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [BoxShadow(color: kGrey, blurRadius: 5, offset: Offset.fromDirection(2))],
      ),
    );
  }

  Widget _buildSavingsContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage('assets/images/bg-container.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [BoxShadow(color: kGrey, blurRadius: 5, offset: Offset.fromDirection(2))],
      ),
      child: _buildSavingsDetails(),
    );
  }

  Widget _buildSavingsDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('My savings', style: kSubtitle2.copyWith(color: kWhite)),
        SizedBox(height: 12),
        Text('Rp 10.430.000', style: kHeading5.copyWith(color: kWhite)),
        SizedBox(height: 10),
        LinearPercentIndicator(
          lineHeight: 4,
          padding: EdgeInsets.symmetric(horizontal: 0),
          progressColor: kEgyptianBlue,
          percent: 0.3,
          backgroundColor: kWhite,
        ),
        SizedBox(height: 16),
        Text('Rp. 10.430.000 / Rp. 40.000.000', style: kCaption.copyWith(color: kWhite)),
      ],
    );
  }

  Widget _buildTransactionButtons() {
    return Row(
      children: [
        _transactionButton('assets/icons/save.png', 'Save Money'),
        SizedBox(width: 25),
        _transactionButton('assets/icons/pay.png', 'Pay'),
      ],
    );
  }

  Widget _transactionButton(String icon, String text) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: kNightBlack,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 24),
            SizedBox(width: 5),
            Text(text, style: kBody1.copyWith(color: kWhite)),
          ],
        ),
      ),
    );
  }

  Widget _buildDraggableSheet() {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: DraggableScrollableSheet(
        controller: DraggableScrollableController(),
        builder: (context, scrollController) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              key: ValueKey<int>(DateTime.now().millisecondsSinceEpoch),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 21),
                    child: Center(
                      child: Text('Transactions History', style: kHeading6.copyWith(color: kLuckyBlue, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        _transactionList(kTreeGreen.withOpacity(0.2), 'assets/icons/triangle-up.png', 'Success!', 'February 19, 03:25 PM', '+ 100.000'),
                        _transactionList(kTreeGreen.withOpacity(0.2), 'assets/icons/triangle-up.png', 'Success!', 'February 16, 01:25 PM', '+ 150.000'),
                        _transactionList(kOrange.withOpacity(0.2), 'assets/icons/triangle-down.png', 'Starbucks Drinks', 'February 10, 12:25 PM', '- 110.000'),
                        _transactionList(kOrange.withOpacity(0.2), 'assets/icons/triangle-down.png', 'Payment #Invest', 'February 5, 11:05 PM', '- 130.000'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _transactionList(Color bgColor, String icon, String title, String sub, String amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            child: Image.asset(icon, width: 14),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: kBody1.copyWith(color: kLuckyBlue)),
              Text(sub, style: kCaption.copyWith(color: kLightGray)),
            ],
          ),
          Spacer(),
          Text(amount, style: kBody1.copyWith(color: kLuckyBlue)), // Perbaikan dilakukan di sini
        ],
      ),
    );
  }
}

