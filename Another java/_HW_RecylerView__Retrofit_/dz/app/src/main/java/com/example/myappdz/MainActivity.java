package com.example.myappdz;

import android.os.Bundle;
import android.view.MotionEvent;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {
    private Api api;
    private UserAdapter userAdapter;
    private RecyclerView rvUser;
    private List<UtilUserShow> data = new ArrayList<>();

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

        init();

        LinearLayoutManager manager = new LinearLayoutManager(
                this,
                RecyclerView.VERTICAL,
                false
        );
        rvUser.setLayoutManager(manager);

        initUserAdapterFromResponse();


    }

    private void initUserAdapterFromResponse() {
        Call<List<User>> call = api.getAllUsers();

        call.enqueue(new Callback<List<User>>() {
            @Override
            public void onResponse(Call<List<User>> call, Response<List<User>> response) {
                List<User> users = response.body();
                System.out.println(users);
                users.forEach(user -> {
                    data.add(new UtilUserShow(user.getName(), user.getUsername(), user.getEmail(),
                            user.getPhone(), user.getAddress().getCity(), user.getCompany().getName()));});
                userAdapter = new UserAdapter(MainActivity.this, R.layout.item_list, data);
                rvUser.setAdapter(userAdapter);
            }

            @Override
            public void onFailure(Call<List<User>> call, Throwable t) {

            }
        });
    }



    private void init(){
        api = NetworkService.getInstance().getApi();
        rvUser = findViewById(R.id.recyclerView);
    }
}