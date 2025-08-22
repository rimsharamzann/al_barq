import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/constants/network_images.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: myPadding * 18,
      floating: true,

      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,

      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
          child: Stack(
            children: [
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
                    padding: const EdgeInsets.fromLTRB(
                      myPadding * 1.6,
                      myPadding * 3,
                      myPadding * 1.6,
                      myPadding * 1.2,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: myPadding * 2.2,
                              backgroundImage: NetworkImage(
                                NetworkImages.profile,
                              ),
                            ),
                            const SizedBox(width: myPadding),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  LoginScreen.routeName,
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hey, Ayesha Umair 👋",
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: myPadding * 1.6,
                                        color: Colors.white70,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "Multan",
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: myPadding * 1.6),

                        Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(
                            horizontal: myPadding,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "search here....",
                              hintStyle: context.textTheme.bodySmall?.copyWith(
                                color: Colors.grey.shade800,
                                height: 1.7,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: myPadding * 2.5,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: myPadding / 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white12,
                  radius: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(bottom: 16, left: 10),
                        child: Icon(
                          Icons.circle,
                          size: 20,
                          color: Colors.yellow.shade700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(right: 20, bottom: 35),
                        child: Icon(
                          Icons.circle,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ),
                    ],
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
