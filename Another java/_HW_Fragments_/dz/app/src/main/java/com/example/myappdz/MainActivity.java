package com.example.myappdz;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.EditText;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private EditText etLogin;
    private RegistrationFragment registrationFragment;
    private LoginFragment loginFragment;
    public static MainFragment mainFragment;

    private SharedPreferences sharedPreferences;
    public static boolean isShowExit = false;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
//        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
//            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
//            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
//            return insets;
//        });

        sharedPreferences = getSharedPreferences("settings", Context.MODE_PRIVATE);


//        registrationFragment = new RegistrationFragment(getSupportFragmentManager());
        registrationFragment = new RegistrationFragment();
        loginFragment = new LoginFragment();
        mainFragment = new MainFragment();


        CheckActiveUser();




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
            MakeActiveRegistration();
        }
        else if (id == R.id.login){
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.container, loginFragment)
                    .commit();
        }
        else if(id == R.id.exit){
            isShowExit = false;
            invalidateMenu();
            SharedPreferences.Editor editor = sharedPreferences.edit();
            editor.remove("lastSigned");
            editor.apply();
            MakeActiveRegistration();


        }

        return super.onOptionsItemSelected(item);
    }



    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        MenuItem exitItem = menu.findItem(R.id.exit);
        if (exitItem != null) {
            exitItem.setVisible(isShowExit);
        }
        return super.onPrepareOptionsMenu(menu);
    }


    private void CheckActiveUser() {
        if (sharedPreferences.contains("lastSigned")) {
            mainFragment.setUserLogin(sharedPreferences.getString("lastSigned", ""));
            if (!mainFragment.getUserLogin().equals("")) {
                isShowExit = true;
                invalidateMenu();
                MakeCurrentFragmentMenuFragment();
            }
            else {
                isShowExit = false;
                invalidateMenu();
                MakeActiveRegistration();
            }
        }
        else {
            isShowExit = false;
            invalidateMenu();
            MakeActiveRegistration();
        }
    }

    public void MakeCurrentFragmentMenuFragment(){
        getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.container, mainFragment)
                .commit();
    }

    private void MakeActiveRegistration() {
        getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.container, registrationFragment)
                .commit();
    }



}