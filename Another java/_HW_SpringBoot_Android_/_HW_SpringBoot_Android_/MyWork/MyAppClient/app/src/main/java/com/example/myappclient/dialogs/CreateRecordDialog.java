package com.example.myappclient.dialogs;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

import com.example.myappclient.R;
import com.example.myappclient.activity.MainActivity;
import com.example.myappclient.activity.OneRecordActivity;
import com.example.myappclient.classes.Record;
import com.example.myappclient.classes.User;
import com.example.myappclient.service.NetworkService;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.textfield.TextInputEditText;

import java.io.IOException;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CreateRecordDialog extends DialogFragment {
    public static final String KEY_USER_LOGIN = "userLogin";

    private String userLogin;
    private TextInputEditText etRecordName;
    private Button btnAddRecordDialog;

    public CreateRecordDialog() {
    }

    public CreateRecordDialog(String userLogin) {
        this.userLogin = userLogin;
    }

    //It was done to stabilize phone rotation
    public static CreateRecordDialog newInstance(String userLogin) {
        CreateRecordDialog dialog = new CreateRecordDialog();
        Bundle args = new Bundle();
        args.putString(KEY_USER_LOGIN, userLogin);
        dialog.setArguments(args);
        return dialog;
    }

    @NonNull
    @Override
    public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {

        if(getArguments() != null){
            userLogin = getArguments().getString(KEY_USER_LOGIN);
        }
        View view = getLayoutInflater().inflate(R.layout.dialog_add_record, null);

        etRecordName = view.findViewById(R.id.etRecordNameAddDialog);
        btnAddRecordDialog = view.findViewById(R.id.btnAddRecordDialog);

        btnAddRecordDialog.setOnClickListener(this::ClickAddRecord);

        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setView(view);
        return builder.create();

    }

    private void ClickAddRecord(View view) {
        Record record = new Record(etRecordName.getText().toString(), "", new User(userLogin));
        Call<ResponseBody> addRecordRequest = NetworkService.getInstance().getApi().createRecord(record);
        Activity activity = getActivity();
        addRecordRequest.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {

                if(response.isSuccessful()){
                    dismiss();
                    Intent intent = new Intent(activity, OneRecordActivity.class);
                    intent.putExtra(OneRecordActivity.KEY_RECORD_NAME, etRecordName.getText().toString());
                    try {
                        intent.putExtra(OneRecordActivity.KEY_RECORD_ID, Integer.parseInt(response.body().string()));
                    } catch (IOException e) {

                    }
                    startActivity(intent);
                }
                else {
                        new MaterialAlertDialogBuilder(getActivity())
                                .setTitle(getString(R.string.some_problems_with_adding_resultAPI))
                                .setPositiveButton(MainActivity.KEY_OK, (dialog, which) -> {
                                })
                                .show();
                }


            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
            }
        });


    }
}
