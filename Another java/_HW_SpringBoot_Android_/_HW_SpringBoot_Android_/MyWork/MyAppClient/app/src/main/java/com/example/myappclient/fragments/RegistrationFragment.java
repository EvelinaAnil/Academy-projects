package com.example.myappclient.fragments;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.Fragment;

import android.util.JsonReader;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.myappclient.R;
import com.example.myappclient.activity.MainActivity;
import com.example.myappclient.classes.User;
import com.example.myappclient.service.NetworkService;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.textfield.TextInputEditText;

import java.io.IOException;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class RegistrationFragment extends Fragment {

    public TextInputEditText etLoginR;
    public TextInputEditText etPasswordR;
    public TextInputEditText etEmailR;
    private Button btnRegister;


    public RegistrationFragment() {
        super(R.layout.fragment_registration);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        init(view);

    }

    private void init(View view) {
        etLoginR = view.findViewById(R.id.etLoginR);
        etPasswordR = view.findViewById(R.id.etPasswordR);
        etEmailR = view.findViewById(R.id.etEmailR);
        btnRegister = view.findViewById(R.id.btnRegister);

        btnRegister.setOnClickListener(this::Register);
    }

    private void Register(View view) {
        if(etLoginR.getText().toString().length() >= 3 && etPasswordR.getText().toString().length() >= 3
                && isValidEmail(etEmailR.getText().toString())){
            User user = new User(etLoginR.getText().toString(), etEmailR.getText().toString(), etPasswordR.getText().toString());

            Call<String> makeRegistration = NetworkService.getInstance().getApi().registerUser(user);

            makeRegistration.enqueue(new Callback<String>() {
                @Override
                public void onResponse(Call<String> call, Response<String> response) {
                    if(response.isSuccessful()){
                        Intent intent = new Intent(getActivity(), MainActivity.class);
                        intent.putExtra(MainActivity.KEY_LOGIN, etLoginR.getText().toString());
                        startActivity(intent);
                        etLoginR.setText("");
                        etEmailR.setText("");
                        etPasswordR.setText("");
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
                    .setMessage(R.string.login_and_password_must_be_longer_that_3_symbols_check_email).show();
        }


    }

    private boolean isValidEmail(String email){
        Matcher matcher = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
                "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$").matcher(email);
        return matcher.matches();
    }
}