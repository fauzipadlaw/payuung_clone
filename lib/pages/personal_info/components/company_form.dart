import 'package:flutter/material.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_field.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_select_field.dart';

import '../../components/custom_button.dart';

class CompanyForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function onSubmit;
  final Function onBack;
  const CompanyForm({
    super.key,
    required this.formKey,
    required this.onSubmit,
    required this.onBack,
  });

  @override
  State<CompanyForm> createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomField(
              label: 'nama usaha / perusahaan',
              isMandatory: false,
            ),
            const CustomField(
              label: 'alamat usaha / perusahaan',
              isMandatory: false,
            ),
            const CustomSelectField(
              label: 'jabatan',
              items: [],
              isMandatory: false,
            ),
            const CustomSelectField(
              label: 'lama bekerja',
              items: [],
              isMandatory: false,
            ),
            const CustomSelectField(
              label: 'sumber pendapatan',
              items: [],
              isMandatory: false,
            ),
            const CustomSelectField(
              label: 'pendapatan kotor pertahun',
              items: [],
              isMandatory: false,
            ),
            const CustomSelectField(
              label: 'nama bank',
              items: [],
              isMandatory: false,
            ),
            const CustomField(
              label: 'cabang bank',
              isMandatory: false,
            ),
            const CustomField(
              label: 'nomor rekening',
              isMandatory: false,
            ),
            const CustomField(
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
                    onTap: () => widget.onSubmit(),
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
