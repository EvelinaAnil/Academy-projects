package com.example.myapp5;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import java.util.List;

public class MainActivity extends AppCompatActivity {
    private ListView lvContacts;
private List<Contact> contacts;
private ContactAdapter adapter;
private SharedPreferences sharedPreferences;
private Button btnAdd;

    private ActivityResultLauncher<Intent> fullInfoLauncher;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
//        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
//            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
//            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
//            return insets;
//        });

        sharedPreferences = getSharedPreferences("settings", Context.MODE_PRIVATE);

        fullInfoLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(),
                result -> {
                    if (result.getResultCode() == RESULT_OK) {
                        Intent data = result.getData();
                        if (data != null) {
                            Contact updatedContact = (Contact) data.getSerializableExtra(FullInfoActivity.KEY_UPDATED_CONTACT);
                            for (int i = 0; i < contacts.size(); i++) {
                                if (contacts.get(i).getId() == (updatedContact.getId())) {
                                    contacts.set(i, updatedContact);
                                    adapter.notifyDataSetChanged();
                                    break;
                                }
                            }
                        }
                    }
                    else if(result.getResultCode() == Activity.RESULT_CANCELED);
                });


        btnAdd = findViewById(R.id.btnAdd);
        lvContacts = findViewById(R.id.lvContacts);
        ContactApi.init();
        contacts = ContactApi.getContacts();

        adapter = new ContactAdapter(this, R.layout.contact_item, contacts);
        lvContacts.setAdapter(adapter);

        lvContacts.setOnItemClickListener((parent, view, position, id) -> {
            Contact contact = contacts.get(position);
            Toast.makeText(this, contact.getPhone() + "\n" + contact.getEmail(), Toast.LENGTH_SHORT).show();

            Intent intent = new Intent(this, FullInfoActivity.class);
            intent.putExtra("contact", contact);
//            startActivity(intent);
            fullInfoLauncher.launch(intent);
        });

        lvContacts.setOnItemLongClickListener((parent, view, position, id) -> {
            contacts.remove(position);
            Toast.makeText(this, "contact deleted", Toast.LENGTH_SHORT).show();
            adapter.notifyDataSetChanged();
            return true;
        });


        btnAdd.setOnClickListener(v -> {
            ContactDialog contactDialog = new ContactDialog(adapter);
            contactDialog.show(getSupportFragmentManager(), "dialog");
        });
    }


    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        String typeOfShow = sharedPreferences.getString("typeOfShowFnLn", "fnln");

        MenuItem fnLnItem = menu.findItem(R.id.fnln);


        if(typeOfShow.equals("lnfn")) {
            fnLnItem = menu.findItem(R.id.lnfn);
        }
        fnLnItem.setChecked(true);
        CheckActiveMenuButton(fnLnItem);

        return super.onPrepareOptionsMenu(menu);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.configuration, menu);

        return true;
    }

//    @Override
//    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
//        super.onActivityResult(requestCode, resultCode, data);
//        if (resultCode == RESULT_OK) {
//            Contact updatedContact = (Contact) data.getSerializableExtra("updatedContact");
//            for (int i = 0; i < contacts.size(); i++) {
//                if (contacts.get(i).getId() == (updatedContact.getId())) {
//                    contacts.set(i, updatedContact);
//                    adapter.notifyDataSetChanged();
//                    break;
//                }
//            }
//        }
//    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        CheckActiveMenuButton(item);
        return super.onOptionsItemSelected(item);
    }

    private void CheckActiveMenuButton(MenuItem item) {
        SharedPreferences.Editor editor = sharedPreferences.edit();


        int itemId = item.getItemId();

        if (itemId == R.id.fnln) {
            ContactAdapter.isFnLn = true;
            editor.putString("typeOfShowFnLn", "fnln");
            adapter.notifyDataSetChanged();
        } else if (itemId == R.id.lnfn) {
            ContactAdapter.isFnLn = false;
            editor.putString("typeOfShowFnLn", "lnfn");
            adapter.notifyDataSetChanged();
        }
        editor.apply();
    }


}