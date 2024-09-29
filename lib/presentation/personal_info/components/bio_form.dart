import 'package:flutter/material.dart';
import 'package:payuung_clone/presentation/components/custom_button.dart';
import 'package:payuung_clone/presentation/personal_info/components/custom_field.dart';
import 'package:payuung_clone/presentation/personal_info/components/custom_select_field.dart';

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
            const CustomField(
              label: 'nama lengkap',
            ),
            CustomField(
              label: 'tanggal lahir',
              suffix: Icons.calendar_month,
              onTap: () {
                _selectDate();
              },
            ),
            const CustomSelectField(
              label: 'jenis kelamin',
              items: [
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
            const CustomField(
              label: 'alamat email',
              disabled: true,
            ),
            const CustomField(
              label: 'no. hp',
            ),
            const CustomSelectField(
              isMandatory: false,
              label: 'pendidikan',
              items: [
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
            const CustomSelectField(
              isMandatory: false,
              label: 'status pernikahan',
              items: [
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
              onTap: () => widget.onSubmit(),
            ),
          ],
        ),
      ),
    );
  }
}
