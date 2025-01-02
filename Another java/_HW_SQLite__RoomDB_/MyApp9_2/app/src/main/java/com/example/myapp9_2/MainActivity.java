package com.example.myapp9_2;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.ItemTouchHelper;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    private static RecyclerView rvContacts;
    private Button btnStartAdding;
    private RecycleViewAdapter recycleViewAdapter;

    private ContactDAO contactDAO;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnStartAdding = findViewById(R.id.btnStartAdding);

        rvContacts = findViewById(R.id.recyclerView);

        contactDAO = App.getInstance().getContactDAO();

        btnStartAdding.setOnClickListener(this::startAdding);

        rvContacts.setLayoutManager(new LinearLayoutManager(this));

        //insert
//        contactDAO.insert(new Contact("Ivan Ivanov", "777"));
//        contactDAO.insert(new Contact("Petr Petrov", "888"));

        //select
        List<Contact> contacts = contactDAO.getAll();
        for (Contact contact : contacts) {
            Log.d("CheckValue", contact.toString());
        }

        SetRVContacts(App.getInstance().SetDataToAdapter());


        ItemTouchHelper itemTH = new ItemTouchHelper(new ItemTouchHelper.SimpleCallback(0, ItemTouchHelper.LEFT | ItemTouchHelper.RIGHT) {
            @Override
            public boolean onMove(@NonNull RecyclerView recyclerView, @NonNull RecyclerView.ViewHolder viewHolder, @NonNull RecyclerView.ViewHolder target) {
                return false;
            }

            @Override
            public void onSwiped(@NonNull RecyclerView.ViewHolder viewHolder, int direction) {
                int position = viewHolder.getAdapterPosition();
                Contact deletedContact = App.getInstance().getContactDAO().getAll().get(position);

                recycleViewAdapter = App.getInstance().SetDataToAdapter();
                SetRVContacts(recycleViewAdapter);

                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this)
                        .setTitle("Do you really want to delete this contact")
                        .setMessage("It will be deleted forever")
                        .setPositiveButton("yes", (dialog, which) -> {



                            App.getInstance().getContactDAO().delete(deletedContact);
                            SetRVContacts(App.getInstance().SetDataToAdapter());

                            recycleViewAdapter.removeContact(position);
                            recycleViewAdapter.notifyItemRemoved(position);

                            Toast.makeText(MainActivity.this, "deleted", Toast.LENGTH_SHORT).show();
                        })
                        .setNegativeButton("no", (dialog, which) -> {
                            recycleViewAdapter.notifyItemChanged(position);
                        })
                        .setOnCancelListener(dialog -> {
                            recycleViewAdapter.notifyItemChanged(position);
                        });
                builder.show();

            }
        });

        itemTH.attachToRecyclerView(rvContacts);


    }

    public static void SetRVContacts(RecycleViewAdapter rcAdapter) {
        rvContacts.setAdapter(rcAdapter);
    }

    private void startAdding(View view) {
        AddNewContactDialog dialog = new AddNewContactDialog();
        dialog.show(getSupportFragmentManager(), "dialog");
    }


}