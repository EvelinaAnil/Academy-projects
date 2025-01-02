package com.example.myappclient.activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.myappclient.R;
import com.example.myappclient.classes.Record;
import com.example.myappclient.service.NetworkService;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;

import java.io.IOException;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class OneRecordActivity extends AppCompatActivity {

    public static final String KEY_RECORD_NAME = "recordName";
    public static final String KEY_RECORD_DESCRIPTION = "recordDescription";
    public static final String KEY_RECORD_ID = "recordID";
    public static final int KEY_ID_DEFVALUE = -1;

    private TextInputEditText etRecordName;
    private TextInputEditText etDescription;
    private Button btnSave;

    private int id;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_one_record);

        initViews();

        btnSave.setOnClickListener(this::SaveClicked);

        setIntentValues();

    }

    private void setIntentValues() {
        etRecordName.setText(getIntent().getStringExtra(KEY_RECORD_NAME));

        etDescription.setText(getIntent().getStringExtra(KEY_RECORD_DESCRIPTION));

        id = getIntent().getIntExtra(KEY_RECORD_ID, KEY_ID_DEFVALUE);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.one_record_activity_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();

        if(id == R.id.back){
            Intent intent = new Intent(this, MainActivity.class);
            startActivity(intent);
        }

        return super.onOptionsItemSelected(item);
    }

    private void SaveClicked(View view) {
        Record recordForUpdate = new Record(etRecordName.getText().toString(), etDescription.getText().toString());
        Call<ResponseBody> updateRecord = NetworkService.getInstance().getApi().updateRecord(id, recordForUpdate);

        updateRecord.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                    if(response.isSuccessful()){
                    new MaterialAlertDialogBuilder(OneRecordActivity.this)
                            .setTitle(getString(R.string.updated_resultAPI))
                            .setPositiveButton(MainActivity.KEY_OK, (dialog, which) -> {
                            })
                            .show();
                    }
                    else {
                        new MaterialAlertDialogBuilder(OneRecordActivity.this)
                                .setTitle(getString(R.string.nothing_to_update_resultAPI))
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

    private void initViews() {
        etRecordName = findViewById(R.id.etRecordNameOneRecordA);
        etDescription = findViewById(R.id.etDescriptionOneRecordA);
        btnSave = findViewById(R.id.btnSaveOneRecordA);
    }
}