import 'package:get/get.dart';
import 'package:swapgo/data/models/master_json_data.dart';
import 'package:swapgo/utils/json_bin_service.dart';

class UserController extends GetxController {
  RxList<MasterJSONData> user = RxList<MasterJSONData>();
  var masterDataJSON = <MasterJSONData>[].obs;
  var loginUserData = MasterJSONData().obs;


  void setUser(List<MasterJSONData> masterJSONData) {
    user.value = masterJSONData;
  }

  getInterest(){
    String allInterest = masterDataJSON.value.fold('', (previousValue, user) {
      return previousValue + (previousValue.isEmpty ? '' : ', ') + user.data!.avatarwithinterest![0].interest!;
    });

    print('Allll allInterest'+allInterest);
  }

  Future<void> getUserFromBin() async {
    var mDataList = await JsonBinService.readBin("sss");

    masterDataJSON.value =
        mDataList!.map((cJson) => MasterJSONData.fromJson(cJson)).toList();

    setUser(masterDataJSON.value);
    print('>>>>>>>Data lenght: ${masterDataJSON.length}');
  }

  // getInterest() {
  //   String interest = '';
  //   String name = '';
  //   String rating = '';
  //   String description = '';
  //   String imageLink = '';
  //   for (var user in masterDataJSON.value) {
  //     interest = user.data!.avatarwithinterest?[0].interest ?? '';
  //     name = user.data!.fname ?? '';
  //     rating = user.data!.reviewandrating?[0].rating ?? '';
  //     description = user.data!.personaldetails?[0].description ?? '';
  //     imageLink = user.data!.avatarwithinterest?[0].imgLink ?? '';
  //   }
  // }

  Future<MasterJSONData?> checkUserlogin(
    String mobileNo,
    String password,
  ) async {
    /*var mDataList = await JsonBinService.readBin("sss");
    masterDataJSON.value = mDataList!
        .map((cJson) => MasterJSONData.fromJson(cJson))
        .toList();*/
    if (masterDataJSON.value == null) {
      print('>>>>>>>Return null1:');
      return null;
    } else {
      MasterJSONData? userData = null;
      for (var user in masterDataJSON.value) {
        if (user.data!.mobileNo == mobileNo &&
            user.data!.password == password) {
          userData = user;
          loginUserData.value = user;
          print('>>>>>>>Return data:${user.data}');
          break;

          // break; // stops the loop
        }
      }
      return userData;
    }
  }


  uploadListOnServer(List<Transferdetails> transferDetailList, int id) async {
    MasterJSONData updatedUser = createMasterDataToSave(transferDetailList,id);
    for (var user in masterDataJSON.value) {
      if (user.data!.id == id) {
       user = updatedUser;
        print('>>>>>>>Return data:${user.data}');
        break;
      }
    }
    List<Map<String, dynamic>> userListJson = masterDataJSON.map((user) => user.toJson()).toList();
    await JsonBinService.updateBin("sss", userListJson );
    print('>>>>>>>Changed list:${masterDataJSON.length}');
  }

  MasterJSONData? getUserToUpdate(int id) {
    MasterJSONData? userData = null;
    for (var user in masterDataJSON.value) {
      if (user.data!.id == id) {
        userData = user;
        print('>>>>>>>Return data:${user.data}');
        break;
      }

    }
    return userData;
  }


   createMasterDataToSave(List<Transferdetails> transferDetailList, int id){

     MasterJSONData? masterDataToSave = MasterJSONData();
     masterDataToSave = getUserToUpdate(id);
     List<Transferdetails> tdList = [];

     transferDetailList.forEach((trData) {
       Transferdetails td = Transferdetails();
       td.usertype = trData.usertype;
       td.swaptype = trData.swaptype;
       td.swapbuddyid = trData.swapbuddyid;
       td.schaduledate = trData.schaduledate;
       td.requestaccaptance = trData.requestaccaptance;
       td.isuser1xfer = trData.isuser1xfer;
       td.isuser2xfer = trData.isuser2xfer;
       td.coinsspent = trData.coinsspent;
       tdList.add(td);

     });

     masterDataToSave!.data!.transferdetails = tdList;
     return masterDataToSave;

  }



}