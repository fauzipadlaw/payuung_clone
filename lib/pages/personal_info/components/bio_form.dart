import 'package:flutter/material.dart';
import 'package:payuung_clone/models/profile.dart';
import 'package:payuung_clone/pages/components/custom_button.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_field.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_select_field.dart';
import 'package:payuung_clone/services/database_service.dart';

class BioForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function onSubmit;
  const BioForm({
    super.key,
    required this.formKey,
    required this.onSubmit,
  });

  @override
  State<BioForm> createState() => _BioFormState();
}

class _BioFormState extends State<BioForm> {
  final _db = DatabaseService.instance;
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _jk = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _hp = TextEditingController();
  final TextEditingController _edu = TextEditingController();
  final TextEditingController _marital = TextEditingController();

  @override
  initState() {
    _db.getProfile().then((Profile profile) {
      setState(() {
        _fullname.text = profile.fullname ?? '';
        _dob.text = profile.dob ?? '';
        _jk.text = profile.sex ?? '';
        _email.text = profile.email ?? '';
        _hp.text = profile.hp ?? '';
        _edu.text = profile.education ?? '';
        _marital.text = profile.maritalStatus ?? '';
      });
    });
    super.initState();
  }

  Future _selectDate() async {
    await showDatePicker(
      context: context,
      locale: const Locale('id'),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().subtract(
        const Duration(days: 5475),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomField(
              label: 'nama lengkap',
              controller: _fullname,
            ),
            CustomField(
              label: 'tanggal lahir',
              suffix: Icons.calendar_month,
              controller: _dob,
              onTap: () {
                _selectDate();
              },
            ),
            CustomSelectField(
              controller: _jk,
              label: 'jenis kelamin',
              items: const [
                DropdownMenuItem(
                  value: 'Laki-laki',
                  child: Text('Laki-laki'),
                ),
                DropdownMenuItem(
                  value: 'Perempuan',
                  child: Text('Perempuan'),
                )
              ],
            ),
            CustomField(
              controller: _email,
              label: 'alamat email',
              disabled: true,
            ),
            CustomField(
              controller: _hp,
              label: 'no. hp',
            ),
            CustomSelectField(
              controller: _edu,
              isMandatory: false,
              label: 'pendidikan',
              items: const [
                DropdownMenuItem(
                  value: 'SD',
                  child: Text('SD'),
                ),
                DropdownMenuItem(
                  value: 'SMP',
                  child: Text('SMP'),
                ),
                DropdownMenuItem(
                  value: 'SMA',
                  child: Text('SMA'),
                ),
                DropdownMenuItem(
                  value: 'D1',
                  child: Text('D1'),
                ),
                DropdownMenuItem(
                  value: 'D2',
                  child: Text('D2'),
                ),
                DropdownMenuItem(
                  value: 'D3',
                  child: Text('D3'),
                ),
                DropdownMenuItem(
                  value: 'S1',
                  child: Text('S1'),
                ),
                DropdownMenuItem(
                  value: 'S2',
                  child: Text('S2'),
                ),
                DropdownMenuItem(
                  value: 'S3',
                  child: Text('S3'),
                )
              ],
            ),
            CustomSelectField(
              controller: _marital,
              isMandatory: false,
              label: 'status pernikahan',
              items: const [
                DropdownMenuItem(
                  value: 'Belum Kawin',
                  child: Text('Belum Kawin'),
                ),
                DropdownMenuItem(
                  value: 'Kawin',
                  child: Text('Kawin'),
                ),
                DropdownMenuItem(
                  value: 'Janda',
                  child: Text('Janda'),
                ),
                DropdownMenuItem(
                  value: 'Duda',
                  child: Text('Duda'),
                ),
              ],
            ),
            CustomButton(
              text: 'Selanjutnya',
              onTap: () {
                _db.update('profile', {
                  'fullname': _fullname.text != '' ? _fullname.text : null,
                  'dob': _dob.text != '' ? _dob.text : null,
                  'sex': _jk.text != '' ? _jk.text : null,
                  'email': _email.text != '' ? _email.text : null,
                  'hp': _hp.text != '' ? _hp.text : null,
                  'marital_status': _marital.text != '' ? _marital.text : null,
                  'education': _edu.text != '' ? _edu.text : null,
                });
                widget.onSubmit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
