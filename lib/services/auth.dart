import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:octave/models/user.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user)
  {
    return user!=null?MyUser(uid: user.uid):null;
  }

  Stream<MyUser> get user{
    return _auth.authStateChanges()
        .map((User? user)=>_userFromFirebaseUser(user!)!);
  }

  Future signinAnon() async{
    try{
      UserCredential result=await _auth.signInAnonymously();
      User? user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }
  final CollectionReference userCollection=FirebaseFirestore.instance.collection('users');

  Future loginwithEmail(String email,String password) async{
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      return _userFromFirebaseUser(user);

    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  Future signwithEmail(String email,String password,String conpass) async{
    try{
      if(conpass==password){
        UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
        User? user=result.user;
        userCollection.doc(user?.uid).set({
          'email':email,
          'password':password,
        });
        return user;
      }

    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  Future signout() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}