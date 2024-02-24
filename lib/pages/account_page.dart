import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mrbeanhackathon/services/auth.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEDACA),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildAvatar(),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildBasicInformation(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildSubscription(),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildContributed(),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildEarned(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildBoughtList(),
                SizedBox(height: 16),
                _buildFormManagement(),
              ],
            ),
            Positioned(
              top: 10,
              left: 301,
              child: RichText(
                text: TextSpan(
                  text: 'Sign Out',
                  style: const TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await AuthService().signOut();
                    },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAvatar() {
  return SizedBox(
    height: 136,
    width: 136,
    child: CircleAvatar(
      backgroundColor: Color(0xffFFFFFF),
      radius: 68,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/avatars/dog.png'),
        radius: 61,
      ),
    ),
  );
}

Widget _buildBasicInformation() {
  return SizedBox(
    height: 93,
    width: 185,
    child: Text(
      'Lê Thành Danh\nexample@gmail.com\n012-345-6789',
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 2,
      ),
    ),
  );
}

Widget _buildSettingIcon() {
  return IconButton(
    icon: const Icon(Icons.settings),
    color: Colors.black,
    iconSize: 30,
    onPressed: () async {
      await AuthService().signOut();
    },
  );
}

Widget _buildSubscription() {
  return Container(
    height: 107,
    width: 354,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: const Color(0xffF4DDCB),
        border: Border.all(
          width: 1,
          color: const Color(0xffDE9D45),
        )),
    child: const Padding(
      padding: EdgeInsets.only(left: 25, top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subscription',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 19,
            ),
          ),
          Text(
            'Premium (30d)',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 38,
              color: Color(0xffEAA800),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildContributed() {
  return Container(
    height: 97,
    width: 172,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: const Color(0xffF4DDCB),
        border: Border.all(
          width: 1,
          color: const Color(0xffDE9D45),
        )),
    child: const Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contributed',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 19,
            ),
          ),
          Text(
            '100g',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 29,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildEarned() {
  // Your earned container widget
  return Container(
    height: 97,
    width: 172,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: const Color(0xffF4DDCB),
        border: Border.all(
          width: 1,
          color: const Color(0xffDE9D45),
        )),
    child: const Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Earned',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 19,
            ),
          ),
          Text(
            '0.25\$',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 29,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildBoughtList() {
  return Container(
    height: 184,
    width: 354,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: const Color(0xffF4DDCB),
        border: Border.all(
          width: 1,
          color: const Color(0xffDE9D45),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 25,
            top: 10,
          ),
          child: Text(
            'Bought list',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 19,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 13),
              child: Container(
                width: 144,
                height: 103,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  image: const DecorationImage(
                    image: ExactAssetImage('assets/items/bought_item.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 13),
              child: Container(
                width: 144,
                height: 103,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  image: const DecorationImage(
                    image: ExactAssetImage('assets/items/bought_item.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildFormManagement() {
  return Container(
    height: 109,
    width: 354,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: const Color(0xffF4DDCB),
        border: Border.all(
          width: 1,
          color: const Color(0xffDE9D45),
        )),
    child: Padding(
      padding: const EdgeInsets.only(left: 15, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Form management',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 55,
                width: 88,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/form.png',
                      height: 38,
                      width: 38,
                    ),
                    Text(
                      'Recent form',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 55,
                width: 20,
              ),
              Container(
                height: 55,
                width: 88,
                child: Column(
                  children: [
                    Icon(
                      Icons.local_shipping,
                      size: 34,
                    ),
                    const Text(
                      'Recent form',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
