import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/signup_provider.dart';
import 'package:intl/intl.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  bool _isObscure = true;
  DateTime? _selectedDate;
  
  // Form fields
  String userName = '';
  String email = '';
  String phoneNumber = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String citizenId = '';
  String birthPlace = '';
  String fullAddress = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    final primaryColor = Colors.green.shade700;
    final signupProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/signup.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Center(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? MediaQuery.of(context).size.width * 0.3 : 24,
                  vertical: 48,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Kayıt Ol",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Yeni bir hesap oluşturun",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        if (signupProvider.error != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              signupProvider.error!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        const SizedBox(height: 32),
                        
                        // Username field
                        _buildTextField(
                          label: "Kullanıcı Adı",
                          icon: CupertinoIcons.person,
                          onSaved: (value) => userName = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen kullanıcı adı giriniz";
                            }
                            return null;
                          },
                          primaryColor: primaryColor,
                        ),
                        const SizedBox(height: 16),

                        // Email field
                        _buildTextField(
                          label: "Email",
                          icon: CupertinoIcons.mail,
                          onSaved: (value) => email = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen email giriniz";
                            }
                            if (!value.contains('@')) {
                              return "Geçerli bir email adresi giriniz";
                            }
                            return null;
                          },
                          primaryColor: primaryColor,
                        ),
                        const SizedBox(height: 16),

                        // Phone number field
                        _buildTextField(
                          label: "Telefon Numarası",
                          icon: CupertinoIcons.phone,
                          onSaved: (value) => phoneNumber = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen telefon numarası giriniz";
                            }
                            return null;
                          },
                          primaryColor: primaryColor,
                        ),
                        const SizedBox(height: 16),

                        // Password field
                        _buildTextField(
                          label: "Şifre",
                          icon: CupertinoIcons.lock,
                          isPassword: true,
                          onSaved: (value) => password = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen şifre giriniz";
                            }
                            if (value.length < 6) {
                              return "Şifre en az 6 karakter olmalıdır";
                            }
                            return null;
                          },
                          primaryColor: primaryColor,
                        ),
                        const SizedBox(height: 16),

                        // First name field
                        _buildTextField(
                          label: "Ad",
                          icon: CupertinoIcons.person_alt,
                          onSaved: (value) => firstName = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen adınızı giriniz";
                            }
                            return null;
                          },
                          primaryColor: primaryColor,
                        ),
                        const SizedBox(height: 16),

                        // Last name field
                        _buildTextField(
                          label: "Soyad",
                          icon: CupertinoIcons.person_2,
                          onSaved: (value) => lastName = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen soyadınızı giriniz";
                            }
                            return null;
                          },
                          primaryColor: primaryColor,
                        ),
                        const SizedBox(height: 16),

                        // Citizen ID field
                        _buildTextField(
                          label: "TC Kimlik No",
                          icon: CupertinoIcons.number,
                          onSaved: (value) => citizenId = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen TC kimlik numaranızı giriniz";
                            }
                            if (value.length != 11) {
                              return "TC kimlik numarası 11 haneli olmalıdır";
                            }
                            return null;
                          },
                          primaryColor: primaryColor,
                        ),
                        const SizedBox(height: 16),

                        // Birth date field
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Doğum Tarihi",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                                child: Icon(
                                  CupertinoIcons.calendar,
                                  color: primaryColor,
                                  size: 20,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              _selectedDate != null
                                  ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                                  : 'Doğum tarihi seçiniz',
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Birth place field
                        _buildTextField(
                          label: "Doğum Yeri",
                          icon: CupertinoIcons.location,
                          onSaved: (value) => birthPlace = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen doğum yerinizi giriniz";
                            }
                            return null;
                          },
                          primaryColor: primaryColor,
                        ),
                        const SizedBox(height: 16),

                        // Address field
                        _buildTextField(
                          label: "Adres",
                          icon: CupertinoIcons.home,
                          onSaved: (value) => fullAddress = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Lütfen adresinizi giriniz";
                            }
                            return null;
                          },
                          primaryColor: primaryColor,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 32),

                        // Submit button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                          ),
                          onPressed: signupProvider.isLoading
                              ? null
                              : () async {
                                  if (_selectedDate == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Lütfen doğum tarihi seçiniz'),
                                      ),
                                    );
                                    return;
                                  }
                                  
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    final success = await signupProvider.signup(
                                      userName: userName,
                                      email: email,
                                      phoneNumber: phoneNumber,
                                      password: password,
                                      firstName: firstName,
                                      lastName: lastName,
                                      citizenId: citizenId,
                                      birthDate: _selectedDate!,
                                      birthPlace: birthPlace,
                                      fullAddress: fullAddress,
                                    );
                                    
                                    if (success && mounted) {
                                      Navigator.pushReplacementNamed(context, '/login');
                                    }
                                  }
                                },
                          child: signupProvider.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  "Kayıt Ol",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Text(
                            "Zaten hesabınız var mı? Giriş yapın",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
    required Color primaryColor,
    bool isPassword = false,
    int maxLines = 1,
  }) {
    return TextFormField(
      style: const TextStyle(fontSize: 16),
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 8.0),
          child: Icon(
            icon,
            color: primaryColor,
            size: 20,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      obscureText: isPassword && _isObscure,
      validator: validator,
      onSaved: onSaved,
    );
  }
}