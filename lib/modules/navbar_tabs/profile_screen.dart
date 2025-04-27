import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/controllers/user_controller.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/core/common/app_images.dart';
import 'package:swapgo/core/common/custom_appbar.dart';
import 'package:swapgo/core/controllers/personal_details_controller.dart';
import 'package:swapgo/core/routes/app_routes.dart';
import 'package:swapgo/data/models/master_json_data.dart';
import 'package:swapgo/modules/profession/profession_search.dart';


class ProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // Access the controller
    final ProfileDetailsController controller = Get.put(ProfileDetailsController());
    final UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
        onSearchTap: () {
          Get.to(() => const ProfessionSearchScreen());
        },
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(47),  // Top-left rounded corner
              topRight: Radius.circular(47), // Top-right rounded corner
            ), // Rounded corners

          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Image
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          AppImages.avatar1,
                          width: 105,
                          height: 105,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Container(
                            width: 105,
                            height: 105,
                            color: Colors.grey[300],
                            child: const Icon(Icons.person, size: 40),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Samit Dawane', style: AppTextStyle.font24Medium()),
                          Row(

                            children: [
                              _buildStat(Icons.favorite, "3k+"),
                              const SizedBox(width: 12),
                              Container(
                                width: 5,  // size of the dot
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFC700),  // yellow color
                                  shape: BoxShape.circle, // makes it a circle
                                ),
                              ),
                              const SizedBox(width: 12),
                              _buildStat(Icons.flash_on,"60+"),

                            ],
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(

                                backgroundColor:AppColors.primaryColor, // Button background
                                foregroundColor:Colors.white, // Text/Icon color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              //onPressed: () => controller.login(),
                              onPressed: () async {
                                List<Transferdetails> tdList = [];
                                Transferdetails td = Transferdetails();
                                td.usertype = "Sender";
                                td.swaptype = "1";
                                td.swapbuddyid = "2";
                                td.schaduledate = "";
                                td.requestaccaptance = "1";
                                td.isuser1xfer = "1";
                                td.isuser2xfer = "1";
                                td.coinsspent = "1";
                                tdList.add(td);
                                td = Transferdetails();
                                td.usertype = "Receiver";
                                td.swaptype = "1";
                                td.swapbuddyid = "2";
                                td.schaduledate = "";
                                td.requestaccaptance = "2";
                                td.isuser1xfer = "2";
                                td.isuser2xfer = "2";
                                td.coinsspent = "2";
                                tdList.add(td);


                                userController.uploadListOnServer(tdList,12);
                              },

                              child:  Text('SWAP',
                                style: AppTextStyle.font12Medium(color: Colors.white),
                              ),
                            ),
                          ).paddingOnly(right: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(

                                backgroundColor: Color(0xFFDCDCDC), // Button background
                                foregroundColor:Colors.white, // Text/Icon color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              //onPressed: () => controller.login(),
                              onPressed: () async {

                              },

                              child: const Text('Message',
                                style: TextStyle(color:AppColors.primaryColor,),
                              ),
                            ),
                          ).paddingOnly(right: 20)

                        ],
                      ).marginOnly(top: 20, left: 30),
                    )

                    // Musician Info

                  ],
                ).marginOnly(left: 30, top: 30),
                Text('About',style: AppTextStyle.font20Medium())

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStat(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black54),
        const SizedBox(width: 10),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}