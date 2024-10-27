import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'form.dart';

class VisitingCardsPage extends StatefulWidget {
  @override
  _VisitingCardsPageState createState() => _VisitingCardsPageState();
}

class _VisitingCardsPageState extends State<VisitingCardsPage> {
  late Stream<QuerySnapshot> _cardStream;
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    _checkIfAdmin();
  }

  // Function to check if the logged-in user is admin
  void _checkIfAdmin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email == 'maheshshriram9090@gmail.com') {
      // User with this email is an admin
      setState(() {
        isAdmin = true;
      });
      _fetchAllCards(); // Fetch all cards for admin
    } else {
      _fetchUserCards(); // Fetch only user cards
    }
  }

  // Fetch all cards (Admin view)
  void _fetchAllCards() {
    _cardStream = FirebaseFirestore.instance.collection('visiting_cards').snapshots();
  }

  // Fetch only user-scanned cards (Regular user view)
  void _fetchUserCards() {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    _cardStream = FirebaseFirestore.instance
        .collection('visiting_cards')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }

  // Function to handle FAB click
  void _addNewCard() {
    // Add your logic for adding a new card here
    print("FAB clicked: Add a new visiting card");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isAdmin ? 'All Visiting Cards' : 'My Visiting Cards'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _cardStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching cards'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No visiting cards found'));
          }

          // Display cards in a list
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(data['company_name'] ?? 'No Company Name'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ${data['email'] ?? 'No Email'}"),
                      Text("Mobile: ${data['mobile'] ?? 'No Mobile'}"),
                      Text("Address: ${data['address'] ?? 'No Address'}"),
                      Text("Scanned by: ${data['scanner_name'] ?? 'No Scanner Name'}"),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => VisitingCardForm()));
        },
        child: Icon(Icons.add), // Icon for the FAB
        tooltip: 'Add Visiting Card', // Tooltip message
      ),
    );
  }
}
