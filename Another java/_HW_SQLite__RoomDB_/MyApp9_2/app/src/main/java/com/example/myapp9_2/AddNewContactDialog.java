package com.example.myapp9_2;

import android.app.AlertDialog;
import android.app.Dialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

public class AddNewContactDialog extends DialogFragment {

private EditText etFullName;
private EditText etPhone;
private Button btnAdd;
private ContactDAO contactDAO;

    public AddNewContactDialog() {
        contactDAO = App.getInstance().getContactDAO();
    }

    @NonNull
    @Override
    public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {
        View view = getLayoutInflater().inflate(R.layout.dialog_add_contact, null);
        etFullName = view.findViewById(R.id.etFullName);
        etPhone = view.findViewById(R.id.etPhone);

        btnAdd = view.findViewById(R.id.btnAdd);
        btnAdd.setOnClickListener(this::AddClick);

        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setView(view);
        return builder.create();


    }

    private void AddClick(View view) {
        if (etFullName.getText().length() >= 2 && etPhone.getText().length() >= 2) {
            contactDAO.insert(new Contact(etFullName.getText().toString(), etPhone.getText().toString()));
            dismiss();
            MainActivity.SetRVContacts(App.getInstance().SetDataToAdapter());
        }
        else {
            Toast.makeText(getContext(), "Incorrect data", Toast.LENGTH_SHORT).show();
        }
    }
}
