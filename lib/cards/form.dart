import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';

class VisitingCardForm extends StatefulWidget {
  @override
  _VisitingCardFormState createState() => _VisitingCardFormState();
}

class _VisitingCardFormState extends State<VisitingCardForm> {
  // Controllers for form fields
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String  name = "";
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;


  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  getdata()async{
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['Name'];
    });

  }


  // Function to add card details to Firebase Firestore
  Future<void> _addVisitingCard() async {
    if (!_formKey.currentState!.validate()) {
      return; // If form is not valid, don't submit
    }

    setState(() {
      _isLoading = true;
    });

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Get user details
        String uid = user.uid;
        String scannerName = user.displayName ?? "Anonymous"; // Name from Firebase Auth




        // Add card details to Firestore
        await FirebaseFirestore.instance.collection('visiting_cards').add({
          'company_name': _companyNameController.text,
          'email': _emailController.text,
          'mobile': _mobileController.text,
          'address': _addressController.text,
          'scanner_name': name,
          'uid': uid,
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Visiting card added successfully!")));

        // Clear form after submission
        _companyNameController.clear();
        _emailController.clear();
        _mobileController.clear();
        _addressController.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error adding card: $e")));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _companyNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Visiting Card"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _companyNameController,
                decoration: InputDecoration(labelText: "Company Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter company name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "This field is required"),
                    EmailValidator(errorText: "Invalid")
                  ])
              ),
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(labelText: "Mobile"),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a mobile number";
                  } else if (value.length != 10) {
                    return "Mobile number must be exactly 10 digits";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: "Address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: _addVisitingCard,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
