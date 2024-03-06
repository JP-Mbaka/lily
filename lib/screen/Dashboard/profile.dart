import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/constants/variables.dart';
import 'package:lily/screen/Dashboard/faqs.dart';
import 'package:lily/screen/Dashboard/getHelp.dart';
import 'package:lily/screen/auth/forgottenPassScreen.dart';
import 'package:lily/widgets/buildProfile.dart';
import 'package:lily/widgets/loadingScreen.dart';
import 'package:lily/widgets/popUpAlert.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  SizedBox(height: height(context) * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                children: [
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          //  EditProfileModal(context)
                          //     .showEditProfileModal(), //Not working
                          child: Image.asset(
                            logo,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fit: BoxFit.cover,
                            height: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //     ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Lucas Madenig',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Text(
                                            '@lmate1',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontStyle: FontStyle.italic,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ))
                                        ],
                                      )
                                    ],
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    // => EditProfileModal(context)
                                    //     .showEditProfileModal(),
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              width: 1),
                                          color: Colors.white),
                                      child: Icon(
                                        Icons.edit,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => LoadingScreen(
                                            screen: const ForgotPassScreen(),
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(20),
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text(
                                      "Change Password",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.03,
                  ),
                  buildProfileMenu(context,
                      icon: Icon(
                        Icons.question_answer,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      title: 'FAQs', onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const FAQs(),
                      ),
                    );
                  }),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  buildProfileMenu(
                    context,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const GetHelp(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.help,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    title: 'Get Help',
                    iconBorderColor: Colors.orange,
                    iconContainerColor: const Color.fromARGB(172, 251, 138, 0),
                  ),
                  SizedBox(
                    height: height(context) * 0.05,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 40.0,
                    endIndent: 40.0,
                  ),
                  SizedBox(
                    height: height(context) * 0.05,
                  ),
                  buildProfileMenu(context, onClick: () {
                    PopDialogs.popDialogs(
                        context: context,
                        title: "Delete Account",
                        message:
                            "Are you sure you want to delete your account?",
                        yes: "Yes",
                        no: "No",
                        onPressYes: () {
                          //We delete the account from database asynchronously
                          PopDialogs.alertMessage(
                            icon: failedIcon,
                            context: context,
                            message: "Acount deleted successfully",
                          );
                          Timer(const Duration(seconds: 5), () {
                            Platform.isIOS
                                ? SystemChannels.platform
                                    .invokeMethod('SystemNavigator.pop')
                                : exit(0);
                          });
                        });
                  },
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      title: 'Logout',
                      iconBorderColor: Colors.red,
                      iconContainerColor:
                          const Color.fromARGB(144, 255, 23, 69)),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                ],
              ),
            ),
            // buildProfileMenu(onClick: (){
            //   DeleteAccountModal(
            //     context,
            //     title: 'Are you sure you want to delete your account?',
            //     message: 'Deleting your account will make you lose your data and details with Digcey. Your eNaira wallet and balance would however remain secured with CBN',
            //     page: DeleteAccountForm(),
            //     btnText: 'Yes, delete my account',
            //   ).showDeleteAccountModal();
            // },
            //     icon: deleteIcon,
            //     title: 'Delete Account',
            //     iconColor: RED1,
            //     iconBorderColor: RED2,
            //     iconContainerColor: RED3),)
          ],
        ),
      ),
    );
  }
}
