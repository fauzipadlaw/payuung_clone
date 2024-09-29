import 'package:flutter/material.dart';
import 'package:payuung_clone/models/profile.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_field.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_select_field.dart';

import '../../../services/database_service.dart';
import '../../components/custom_button.dart';

class CompanyForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function onBack;
  const CompanyForm({
    super.key,
    required this.formKey,
    required this.onBack,
  });

  @override
  State<CompanyForm> createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  final _db = DatabaseService.instance;
  final TextEditingController _company = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _position = TextEditingController();
  final TextEditingController _duration = TextEditingController();
  final TextEditingController _source = TextEditingController();
  final TextEditingController _income = TextEditingController();
  final TextEditingController _bank = TextEditingController();
  final TextEditingController _branch = TextEditingController();
  final TextEditingController _norek = TextEditingController();
  final TextEditingController _holder = TextEditingController();

  @override
  initState() {
    _db.getProfile().then((Profile profile) {
      setState(() {
        _company.text = profile.company ?? '';
        _address.text = profile.companyAddress ?? '';
        _position.text = profile.position ?? '';
        _duration.text = profile.workDuration ?? '';
        _source.text = profile.sourceIncome ?? '';
        _income.text = profile.income ?? '';
        _bank.text = profile.bankName ?? '';
        _branch.text = profile.bankBranch ?? '';
        _norek.text = profile.accountNumber ?? '';
        _holder.text = profile.accountHolder ?? '';
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomField(
              controller: _company,
              label: 'nama usaha / perusahaan',
              isMandatory: false,
            ),
            CustomField(
              controller: _address,
              label: 'alamat usaha / perusahaan',
              isMandatory: false,
            ),
            CustomSelectField(
              controller: _position,
              label: 'jabatan',
              items: const [
                DropdownMenuItem(
                  value: 'A',
                  child: Text('A'),
                ),
                DropdownMenuItem(
                  value: 'B',
                  child: Text('B'),
                ),
                DropdownMenuItem(
                  value: 'C',
                  child: Text('C'),
                ),
                DropdownMenuItem(
                  value: 'D',
                  child: Text('D'),
                ),
                DropdownMenuItem(
                  value: 'E',
                  child: Text('E'),
                ),
              ],
              isMandatory: false,
            ),
            CustomSelectField(
              controller: _duration,
              label: 'lama bekerja',
              items: const [
                DropdownMenuItem(
                  value: 'A',
                  child: Text('A'),
                ),
                DropdownMenuItem(
                  value: 'B',
                  child: Text('B'),
                ),
                DropdownMenuItem(
                  value: 'C',
                  child: Text('C'),
                ),
                DropdownMenuItem(
                  value: 'D',
                  child: Text('D'),
                ),
                DropdownMenuItem(
                  value: 'E',
                  child: Text('E'),
                ),
              ],
              isMandatory: false,
            ),
            CustomSelectField(
              controller: _source,
              label: 'sumber pendapatan',
              items: const [
                DropdownMenuItem(
                  value: 'A',
                  child: Text('A'),
                ),
                DropdownMenuItem(
                  value: 'B',
                  child: Text('B'),
                ),
                DropdownMenuItem(
                  value: 'C',
                  child: Text('C'),
                ),
                DropdownMenuItem(
                  value: 'D',
                  child: Text('D'),
                ),
                DropdownMenuItem(
                  value: 'E',
                  child: Text('E'),
                ),
              ],
              isMandatory: false,
            ),
            CustomSelectField(
              controller: _income,
              label: 'pendapatan kotor pertahun',
              items: const [
                DropdownMenuItem(
                  value: 'A',
                  child: Text('A'),
                ),
                DropdownMenuItem(
                  value: 'B',
                  child: Text('B'),
                ),
                DropdownMenuItem(
                  value: 'C',
                  child: Text('C'),
                ),
                DropdownMenuItem(
                  value: 'D',
                  child: Text('D'),
                ),
                DropdownMenuItem(
                  value: 'E',
                  child: Text('E'),
                ),
              ],
              isMandatory: false,
            ),
            CustomSelectField(
              controller: _bank,
              label: 'nama bank',
              items: const [
                DropdownMenuItem(
                  value: 'A',
                  child: Text('A'),
                ),
                DropdownMenuItem(
                  value: 'B',
                  child: Text('B'),
                ),
                DropdownMenuItem(
                  value: 'C',
                  child: Text('C'),
                ),
                DropdownMenuItem(
                  value: 'D',
                  child: Text('D'),
                ),
                DropdownMenuItem(
                  value: 'E',
                  child: Text('E'),
                ),
              ],
              isMandatory: false,
            ),
            CustomField(
              controller: _branch,
              label: 'cabang bank',
              isMandatory: false,
            ),
            CustomField(
              controller: _norek,
              label: 'nomor rekening',
              isMandatory: false,
            ),
            CustomField(
              controller: _holder,
              label: 'nama pemilik rekening',
              isMandatory: false,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Sebelumnya',
                    type: ButtonType.seconday,
                    onTap: () => widget.onBack(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    text: 'Simpan',
                    onTap: () {
                      _db.update('profile', {
                        'company': _company.text != '' ? _company.text : null,
                        'company_address':
                            _address.text != '' ? _address.text : null,
                        'position':
                            _position.text != '' ? _position.text : null,
                        'work_duration':
                            _duration.text != '' ? _duration.text : null,
                        'source_income':
                            _source.text != '' ? _source.text : null,
                        'bank_name': _bank.text != '' ? _bank.text : null,
                        'bank_branch': _branch.text != '' ? _branch.text : null,
                        'account_number':
                            _norek.text != '' ? _norek.text : null,
                        'account_holder':
                            _holder.text != '' ? _holder.text : null,
                        'gross_income':
                            _income.text != '' ? _income.text : null,
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
