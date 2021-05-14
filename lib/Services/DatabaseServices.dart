
import '../Constants/Constants.dart';

import '../Models/UserModel.dart';


class DatabaseServices {
  

  static void updateUserData(UserModel user) {
    usersRef.doc(user.id).update({
      'profilePicture': user.profilePicture,
      'coverImage': user.coverImage,
    });
  }

  

  
}