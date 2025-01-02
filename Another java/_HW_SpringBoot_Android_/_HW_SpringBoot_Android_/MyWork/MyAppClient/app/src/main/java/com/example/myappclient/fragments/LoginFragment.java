package com.example.myappclient.fragments;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.Fragment;

import android.telecom.InCallService;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.myappclient.R;
import com.example.myappclient.activity.MainActivity;
import com.example.myappclient.classes.User;
import com.example.myappclient.classes.UserHelp;
import com.example.myappclient.service.NetworkService;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.textfield.TextInputEditText;

import java.io.IOException;
import java.util.Map;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class LoginFragment extends Fragment {

    public TextInputEditText etLoginL;
    public TextInputEditText etPasswordL;
    private Button btnOkL;

    public LoginFragment() {
        super(R.layout.fragment_login);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        init(view);
    }




    private void init(View view) {
        etLoginL = view.findViewById(R.id.etLoginL);
        etPasswordL = view.findViewById(R.id.etPasswordL);
        btnOkL = view.findViewById(R.id.btnOkL);

        btnOkL.setOnClickListener(this::Sign);

    }

    private void Sign(View view) {
        if(etLoginL.getText().length() >= 3 && etPasswordL.getText().toString().length() >= 3){

            UserHelp userh = new UserHelp(etLoginL.getText().toString(), etPasswordL.getText().toString());

            Call<String> makeSign = NetworkService.getInstance().getApi().signUser(userh);
            makeSign.enqueue(new Callback<String>() {
                @Override
                public void onResponse(Call<String> call, Response<String> response) {
                    if(response.isSuccessful()){
                        Intent intent = new Intent(getActivity(), MainActivity.class);
                        intent.putExtra(MainActivity.KEY_LOGIN, etLoginL.getText().toString());
                        startActivity(intent);
                        etLoginL.setText("");
                        etPasswordL.setText("");
                    }
                    else {
                            new MaterialAlertDialogBuilder(getActivity())
                                    .setPositiveButton(MainActivity.KEY_OK, (dialog, which) -> {
                                    })
                                    .setTitle(getString(R.string.incorrect_data)).show();

                    }
                }

                @Override
                public void onFailure(Call<String> call, Throwable t) {
                }
            });
        }
        else {
            new MaterialAlertDialogBuilder(getActivity())
                    .setTitle(getString(R.string.incorrect_data))
                    .setPositiveButton(MainActivity.KEY_OK, (dialog, which) -> {
                    })
                    .setMessage(getString(R.string.login_and_password_must_be_longer_that_3_symbols)).show();
        }

    }
}