import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


sendChat(data){
  Firestore.instance.collection("chats").add(data).then((f){
    print("data stored");
  });
}