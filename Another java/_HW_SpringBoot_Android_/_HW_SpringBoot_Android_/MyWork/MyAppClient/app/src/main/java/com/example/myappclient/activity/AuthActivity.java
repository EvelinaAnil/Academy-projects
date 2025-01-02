package com.example.myappclient.activity;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.example.myappclient.fragments.LoginFragment;
import com.example.myappclient.R;
import com.example.myappclient.fragments.RegistrationFragment;

public class AuthActivity extends AppCompatActivity {
    private LoginFragment loginFragment;
    private RegistrationFragment registrationFragment;
    public static final String KEY_LOGIN_FRAGMENT = "LOGIN_FRAGMENT";
    public static final String KEY_REGISTRATION_FRAGMENT = "REGISTRATION_FRAGMENT";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_auth);



        loginFragment = (LoginFragment) getSupportFragmentManager().findFragmentByTag(KEY_LOGIN_FRAGMENT);
        registrationFragment = (RegistrationFragment) getSupportFragmentManager().findFragmentByTag(KEY_REGISTRATION_FRAGMENT);

        if(loginFragment == null){
            loginFragment = new LoginFragment();
        }
        if(registrationFragment == null){
            registrationFragment = new RegistrationFragment();
        }
        if(savedInstanceState == null){
            MakeActiveRegistrationFragment();
        }



    }

    private void MakeActiveRegistrationFragment() {
        getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.container, registrationFragment, KEY_REGISTRATION_FRAGMENT)
                .commit();
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.settings_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();

        if(id == R.id.registration){
            MakeActiveRegistrationFragment();
        }
        else if (id == R.id.login){
            MakeActiveLoginFragment();
        }

        return super.onOptionsItemSelected(item);
    }

    private void MakeActiveLoginFragment() {
        getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.container, loginFragment, KEY_LOGIN_FRAGMENT)
                .commit();
    }


}