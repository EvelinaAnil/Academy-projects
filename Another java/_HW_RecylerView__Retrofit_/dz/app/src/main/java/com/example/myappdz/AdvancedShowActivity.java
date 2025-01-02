package com.example.myappdz;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class AdvancedShowActivity extends AppCompatActivity {

    private TextView tvName;
    private TextView tvUserName;
    private TextView tvEmail;
    private TextView tvPhone;
    private TextView tvCity;
    private TextView tvCompanyName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_advanced_show);
//        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
//            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
//            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
//            return insets;
//        });

        init();

        setData(getIntent());





    }

    private void setData(Intent intent) {
        tvName.setText(intent.getStringExtra(UserAdapter.KEY_NAME));
        tvUserName.setText(intent.getStringExtra(UserAdapter.KEY_USERNAME));
        tvEmail.setText(intent.getStringExtra(UserAdapter.KEY_EMAIL));
        tvPhone.setText(intent.getStringExtra(UserAdapter.KEY_PHONE));
        tvCity.setText(intent.getStringExtra(UserAdapter.KEY_CITY));
        tvCompanyName.setText(intent.getStringExtra(UserAdapter.KEY_COMPANY_NAME));
    }

    private void init(){
        tvName = findViewById(R.id.tvName);
        tvUserName = findViewById(R.id.tvUserName);
        tvEmail = findViewById(R.id.tvEmail);
        tvPhone = findViewById(R.id.tvPhone);
        tvCity = findViewById(R.id.tvCity);
        tvCompanyName = findViewById(R.id.tvCompanyName);
    }
}