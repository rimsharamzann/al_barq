import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/custom_container.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/components/text_feild_with_title.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});
    static const routeName = '/contact-us';


  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController _nameCOntroller = TextEditingController();
  final TextEditingController _emailCOntroller = TextEditingController();
  final TextEditingController _msgCOntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBarWidget(title: 'Contact us'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            textAlign: TextAlign.center,
            'We can get in touch with us through below details. Our Team will reach out to you as soon as possible. ',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
          SizedBox(height: 8),
          CustomContainer(
            child: Column(
              children: [
                ContactUsComponents(
                  data: 'info@albarg.com',
                  date: '24/7 Support (Mon - Sun)',
                  icon: Icons.email_outlined,
                  title: 'Email Us',
                ),
                Divider(
                  color: Colors.grey.shade400,
                  height: 10,
                  thickness: 1.5,
                ),
                ContactUsComponents(
                  data: '09876543876',
                  date: '24/7 Support (Mon - Sun)',
                  icon: Icons.phone_outlined,
                  title: 'Call Us',
                ),
              ],
            ),
          ),
          CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Contact',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextFeildWithTitle(
                  title: 'Name',
                  label: 'Ali HAider',
                  controller: _nameCOntroller,
                ),
                TextFeildWithTitle(
                  title: 'Email',
                  label: 'ali@gmail.com',
                  controller: _emailCOntroller,
                ),
                TextFeildWithTitle(
                  maxlines: 3,
                  height: 100,
                  title: 'Message',
                  label: 'Type message here...',
                  controller: _msgCOntroller,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 16),
          CustomElevatedButton(text: 'Submit', onPress: () {}),
          SizedBox(height: 160),
        ],
      ),
    );
  }
}

class ContactUsComponents extends StatelessWidget {
  const ContactUsComponents({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.data,
  });
  final IconData icon;
  final String title;
  final String date;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: MyColors.primaryColor,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                data,
                style: TextStyle(
                  fontSize: 14,
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
