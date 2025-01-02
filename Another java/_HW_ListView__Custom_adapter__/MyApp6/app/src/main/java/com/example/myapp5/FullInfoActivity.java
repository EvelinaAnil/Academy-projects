package com.example.myapp5;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.myapp5.databinding.ActivityFullInfoBinding;

public class FullInfoActivity extends AppCompatActivity {
    public static final String KEY_UPDATED_CONTACT = "updatedContact";
    private ActivityFullInfoBinding binding;
    private Button btnApply;
    private Contact contact;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        EdgeToEdge.enable(this);
//        setContentView(R.layout.activity_full_info);
        binding = ActivityFullInfoBinding.inflate(getLayoutInflater());
        View view = binding.getRoot();
        setContentView(view);
//        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
//            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
//            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
//            return insets;
//        });

        btnApply = findViewById(R.id.btnApply);



        contact = (Contact) getIntent().getSerializableExtra("contact");

        binding.ivAvatar.setImageResource(contact.getAvatar());
        binding.etFirstName.setText(contact.getFirstName());
        binding.etLastName.setText(contact.getLastName());
        binding.etPhone.setText(contact.getPhone());
        binding.etEmail.setText(contact.getEmail());



        btnApply.setOnClickListener(this::ApplyClick);


    }

    private void ApplyClick(View view) {
        contact.setFirstName(binding.etFirstName.getText().toString());
        contact.setLastName(binding.etLastName.getText().toString());
        contact.setPhone(binding.etPhone.getText().toString());
        contact.setEmail(binding.etEmail.getText().toString());
        Toast.makeText(this, "Apply ", Toast.LENGTH_SHORT).show();
        Intent intent = new Intent();
        intent.putExtra(KEY_UPDATED_CONTACT, contact);
        setResult(RESULT_OK, intent);
        finish();

    }

}