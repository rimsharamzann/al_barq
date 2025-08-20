// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SolarSolutionsWidget extends StatelessWidget {
//   const SolarSolutionsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Title
//           const Text(
//             "Solar Solutions",
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 8),

//           // Subtitle
//           const Text(
//             "Explore our comprehensive range of solar products designed for Pakistan's energy needs",
//             style: TextStyle(fontSize: 18, color: Colors.black54),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),

//           // Grid Section
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 200),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: const [
//                 SolarCard(
//                   icon: Icons.grid_on,
//                   title: "Solar Panels",
//                   description:
//                       "High-efficiency panels for maximum energy generation",
//                 ),
//                 SolarCard(
//                   icon: FontAwesomeIcons.fan,
//                   title: "Inverters",
//                   description:
//                       "Reliable Power conversion for continuous supply",
//                 ),
//                 SolarCard(
//                   icon: Icons.solar_power_sharp,
//                   title: "Solar Fans",
//                   description:
//                       "Energy Efficient cooling solutions for your home",
//                 ),
//                 SolarCard(
//                   icon: Icons.battery_2_bar_sharp,
//                   title: "Batteries",
//                   description: "Long-Lasting storage for uninterrupted power",
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SolarCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;

//   const SolarCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           FaIcon(icon, size: 30, color: Colors.deepOrange),
//           const SizedBox(height: 12),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 6),
//           Expanded(
//             child: Text(
//               description,
//               style: const TextStyle(fontSize: 13, color: Colors.black54),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Row(
//             children: const [
//               Text(
//                 "Explore",
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepOrange,
//                 ),
//               ),
//               SizedBox(width: 4),
//               Icon(Icons.arrow_forward, size: 16, color: Colors.deepOrange),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
