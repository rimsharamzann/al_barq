// import 'package:albarq/config/route_names.dart';
// import 'package:flutter/material.dart';

// class CustomSearchAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   const CustomSearchAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(0),
//       height: preferredSize.height,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(16),
//           bottomRight: Radius.circular(16),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//             spreadRadius: 2,
//             offset: Offset(0, 2),
//           ),
//         ],
//         gradient: LinearGradient(
//           colors: [Color(0xfff46b45), Color(0xffeea849)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               const SizedBox(height: 16),

//               // Profile
//               Row(
//                 children: [
//                   const CircleAvatar(
//                     radius: 22,
//                     backgroundImage: NetworkImage(
//                       "https://media.istockphoto.com/id/987652760/photo/lady-girl-facing-and-watching-a-beautiful-sunrise.jpg?s=612x612&w=0&k=20&c=xkQe-vDUum_5u-s5qTsufl9APD3auGU8mhkxITsuzPY=",
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushNamed(context, RouteNames.login);
//                         },
//                         child: Text(
//                           "Hey, Ayesha Umair 👋",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.location_on,
//                             size: 16,
//                             color: Colors.white70,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             "Multan",
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 10),

//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Positioned(
//                     top: -80,
//                     right: -20,
//                     child: Container(
//                       height: 80,
//                       width: 80,
//                       decoration: BoxDecoration(
//                         color: Colors.white.withValues(alpha: 0.15),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),

//                   Positioned(
//                     top: -40,
//                     right: -17,
//                     child: Container(
//                       height: 10,
//                       width: 10,
//                       decoration: const BoxDecoration(
//                         color: Colors.yellow,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),

//                   Positioned(
//                     top: -25,
//                     right: 40,
//                     child: Container(
//                       height: 10,
//                       width: 10,
//                       decoration: const BoxDecoration(
//                         color: Colors.yellow,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),

//                   Positioned(
//                     bottom: -13,
//                     left: 50,
//                     child: Container(
//                       height: 10,
//                       width: 10,
//                       decoration: const BoxDecoration(
//                         color: Colors.yellow,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),

//                   Container(
//                     height: 40,
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: const TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "search here....",
//                         hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: Colors.grey,
//                           size: 20,
//                         ),
//                         isDense: true,
//                         contentPadding: EdgeInsets.symmetric(vertical: 12),
//                         prefixIconConstraints: BoxConstraints(
//                           minWidth: 25,
//                           minHeight: 35,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(140);
// }

import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180,
      // pinned: true,
      floating: true,

      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,

      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Stack(
            children: [
              Image.asset(
                AssetString.appbarbg,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [MyColors.primaryColor, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 12),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // 👈 prevents overflow
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 22,
                              backgroundImage: NetworkImage(
                                "https://media.istockphoto.com/id/987652760/photo/lady-girl-facing-and-watching-a-beautiful-sunrise.jpg?s=612x612&w=0&k=20&c=xkQe-vDUum_5u-s5qTsufl9APD3auGU8mhkxITsuzPY=",
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Hey, Ayesha Umair 👋",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: Colors.white70,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "Multan",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Search box
                        Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "search here....",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 20,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
