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

    masterDataJSON.value = mDataList!
        .map((cJson) => MasterJSONData.fromJson(cJson))
        .toList();

    setUser(masterDataJSON.value);
    print('>>>>>>>Data lenght: ${masterDataJSON.length}');
  }


  Future<MasterJSONData?> checkUserlogin(String mobileNo, String password) async {
    /*var mDataList = await JsonBinService.readBin("sss");
    masterDataJSON.value = mDataList!
        .map((cJson) => MasterJSONData.fromJson(cJson))
        .toList();*/
    if(masterDataJSON.value == null){
      print('>>>>>>>Return null1:');
      return null;
    }else{
      MasterJSONData? userData = null;
      for (var user in masterDataJSON.value) {

        if (user.data!.mobileNo == mobileNo && user.data!.password == password) {
          userData = user;
          loginUserData.value = user;
          print('>>>>>>>Return data:${user.data}');
          break;

          break; // stops the loop
        }

      }
      return userData;
    }


  }

   createMasterDataToSave(MasterJSONData user){

     MasterJSONData mm = MasterJSONData();
     mm.data?.id = 1;
     mm.data?.fname = 'Samit';
     mm.data?.lname = 'Dawane';
     mm.data?.mobileNo = '1111111111';
     mm.data?.password = '123456';
     mm.data?.email = 'sami@gmail.com';
     mm.data?.dob = '25-Jul-1992';
     mm.data?.isActive = false;
     mm.data?.isProfileComplete = false;


     Personaldetails pd = Personaldetails();
     pd.occupation = '';
    /* pd. = '';
     pd. = '';
     pd. = '';
     pd. = '';
     pd. = '';
     pd. = '';


     "occupation": "Legal & Law",
     "skillowned": "Contract Drafting,Corporate Law,Arbitration",
     "experience": "12-15",
     "worlink": "http://www.jones-cook.com/",
     "description": "Man reach official fly deep individual different girl.",
     "achievements": "Never those believe."*/


  }



}