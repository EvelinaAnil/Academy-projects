package com.example.myappdz;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

public class MainFragment extends Fragment {

    private TextView tvWelcome;


    private String userLogin = "";

    public MainFragment() {
        super(R.layout.fragment_main);
    }

    public void setUserLogin(String login){
        userLogin = login;
    }

    public String getUserLogin(){
        return userLogin;
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        tvWelcome = view.findViewById(R.id.tvWelcome);

        tvWelcome.setText("Hello, " + userLogin);

    }
}
