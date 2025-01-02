package com.example.myappclient.activity;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.ItemTouchHelper;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.myappclient.ForViewsMainActivity.RVRecordAdapter;
import com.example.myappclient.R;
import com.example.myappclient.classes.Record;
import com.example.myappclient.dialogs.CreateRecordDialog;
import com.example.myappclient.service.NetworkService;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;

import java.util.List;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {

    public static final String KEY_SHARED_PREFERENCES_SETTINGS = "settings";
    public static final String KEY_LOGIN = "login";
    public static final String KEY_UNKNOWN = "unknown";
    public static final String KEY_SHARED_PREFERENCES_DEFVALUE = "";
    public static final String KEY_DIALOG_FOR_DIALOG = "dialog";
    public static final String KEY_OK = "ok";

    private SharedPreferences sharedPreferences;
    private Button btnAddNote;
    private static RecyclerView rvRecords;
    private TextView tvLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        sharedPreferences = getSharedPreferences(KEY_SHARED_PREFERENCES_SETTINGS, Context.MODE_PRIVATE);

        initViews();

        initListeners();

        CheckActiveUser();

        rvRecords.setLayoutManager(new LinearLayoutManager(this));

        initTVRecords(sharedPreferences.getString(KEY_LOGIN, KEY_SHARED_PREFERENCES_DEFVALUE));
    }

    private void CheckActiveUser() {
        if (sharedPreferences.getString(KEY_LOGIN, KEY_SHARED_PREFERENCES_DEFVALUE).isEmpty()) {
            if (getIntent().getStringExtra(KEY_LOGIN) == null) {
                tvLogin.setText(KEY_UNKNOWN);
            } else {
                tvLogin.setText(getIntent().getStringExtra(KEY_LOGIN));
                SharedPreferences.Editor editor = sharedPreferences.edit();
                editor.putString(KEY_LOGIN, getIntent().getStringExtra(KEY_LOGIN));
                editor.apply();
            }
        }
        else {
            tvLogin.setText(sharedPreferences.getString(KEY_LOGIN, KEY_UNKNOWN));
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main_activity_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();

        if(id == R.id.exit){
            new MaterialAlertDialogBuilder(this)
                    .setTitle(getString(R.string.you_will_sign_out_from_application))
                    .setMessage(getString(R.string.do_you_really_want_to_exit))
                    .setPositiveButton(getString(R.string.yes), (dialog, which) -> {

                        SharedPreferences.Editor editor = sharedPreferences.edit();
                        editor.remove(KEY_LOGIN);
                        editor.apply();

                        StartAuthActivity();
                    })
                    .setNegativeButton(getString(R.string.no), (dialog, which) -> {

                    }).show();


        }

        return super.onOptionsItemSelected(item);
    }

    private void AddNoteClick(View view) {
        if(!sharedPreferences.contains(KEY_LOGIN)){
            ShowDialogAboutPermissionUserForAuthorization(getString(R.string.for_adding_notes_you_need_to_sign_in_or_sing_up));
        }
        else {
            CreateRecordDialog dialog = CreateRecordDialog.newInstance(sharedPreferences.getString(KEY_LOGIN, KEY_SHARED_PREFERENCES_DEFVALUE));
            dialog.show(getSupportFragmentManager(), KEY_DIALOG_FOR_DIALOG);
        }
    }

    public void initTVRecords(String login){
        if(!login.isEmpty()){
            Call<List<Record>> records = NetworkService.getInstance().getApi().getRecordsByUserLogin(login);
            records.enqueue(new Callback<List<Record>>() {
                @Override
                public void onResponse(Call<List<Record>> call, Response<List<Record>> response) {
                    List<Record> records = response.body();
                    RVRecordAdapter adapter = new RVRecordAdapter(records, MainActivity.this);
                    rvRecords.setAdapter(adapter);

                    ItemTouchHelper itemTH = new ItemTouchHelper(new ItemTouchHelper.SimpleCallback(0, ItemTouchHelper.LEFT | ItemTouchHelper.RIGHT) {
                        @Override
                        public boolean onMove(@NonNull RecyclerView recyclerView, @NonNull RecyclerView.ViewHolder viewHolder, @NonNull RecyclerView.ViewHolder target) {
                            return false;
                        }

                        @Override
                        public void onSwiped(@NonNull RecyclerView.ViewHolder viewHolder, int direction) {
                            int position = viewHolder.getAdapterPosition();
                            new MaterialAlertDialogBuilder(MainActivity.this)
                                    .setTitle(getString(R.string.do_you_really_want_to_delete_this_record))
                                    .setMessage(getString(R.string.it_will_be_deleted_forever))
                                    .setPositiveButton(getString(R.string.yes), (dialog, which) -> {
                                        Call<ResponseBody> deleteRecord = NetworkService.getInstance()
                                                .getApi().deleteRecord(records.get(position).getId());

                                        deleteRecord.enqueue(new Callback<ResponseBody>() {
                                            @Override
                                            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                                                if(response.body() != null){
                                                    try {
                                                        new MaterialAlertDialogBuilder(MainActivity.this)
                                                                .setTitle(getString(R.string.deleted_resultAPI))
                                                                .setPositiveButton(KEY_OK, (dialog, which) -> {
                                                                })
                                                                .show();
                                                        adapter.RemoveRecord(position);
                                                        adapter.notifyItemRemoved(position);



                                                    } catch (Exception e) {
                                                    }
                                                }
                                                else{
                                                    new MaterialAlertDialogBuilder(MainActivity.this)
                                                            .setTitle(getString(R.string.nothing_to_delete_resultAPI))
                                                            .setPositiveButton(KEY_OK, (dialog, which) -> {
                                                            });
                                                }
                                            }

                                            @Override
                                            public void onFailure(Call<ResponseBody> call, Throwable t) {
                                            }
                                        });

                                    })
                                    .setNegativeButton(getString(R.string.no), (dialog, which) -> {
                                        adapter.notifyItemChanged(position);
                                    })
                                    .setOnCancelListener(dialog -> {
                                        adapter.notifyItemChanged(position);
                                    })
                                    .show();
                        }
                    });

                    itemTH.attachToRecyclerView(rvRecords);

                }

                @Override
                public void onFailure(Call<List<Record>> call, Throwable t) {
                }
            });


        }
    }

    private void initListeners() {
        btnAddNote.setOnClickListener(this::AddNoteClick);
        rvRecords.setOnClickListener(this::RVRecordsClick);
    }

    private void RVRecordsClick(View view) {
        if(!sharedPreferences.contains(KEY_LOGIN)){
            ShowDialogAboutPermissionUserForAuthorization(getString(R.string.for_viewing_you_need_to_sign_in_or_sign_up));
        }
        else {
        }
    }

    private void ShowDialogAboutPermissionUserForAuthorization(String title) {
        new MaterialAlertDialogBuilder(this)
                .setTitle(title)
                .setMessage(R.string.do_you_agree_to_go_for_authorization)
                .setPositiveButton(getString(R.string.yes), (dialog, which) -> {
                    StartAuthActivity();
                })
                .setNegativeButton(getString(R.string.no), (dialog, which) -> {

                }).show();
    }

    private void initViews() {
        btnAddNote = findViewById(R.id.btnAddNote);
        rvRecords = findViewById(R.id.rvRecords);
        tvLogin = findViewById(R.id.tvMainLogin);
    }

    private void StartAuthActivity(){
        Intent intent = new Intent(this, AuthActivity.class);
        startActivity(intent);
    }

}
