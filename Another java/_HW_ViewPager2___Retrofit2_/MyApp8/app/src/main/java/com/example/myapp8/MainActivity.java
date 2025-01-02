package com.example.myapp8;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager2.widget.ViewPager2;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.widget.Toast;

import com.example.myapp8.Classes.Post;
import com.example.myapp8.Classes.User;
import com.example.myapp8.ForApi.NetworkService;
import com.example.myapp8.ForApi.UserHelpApi;
import com.example.myapp8.ForDialog.UtilUserShow;
import com.example.myapp8.ForSlider.Slide;
import com.example.myapp8.ForSlider.SlideAdapter;
import com.example.myapp8.ForSlider.ZoomOutPageTransformer;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {
    public final static String KEY_POSITION_SLIDE = "positionSlide";
    private ViewPager2 viewPager;
    private SlideAdapter adapter;
    private List<Slide> slides = new ArrayList<>();

    private SharedPreferences sharedPreferences;

    private static com.example.myapp6.Api api;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        sharedPreferences = getSharedPreferences("settings", Context.MODE_PRIVATE);

        api = NetworkService.getInstance().getApi();

        viewPager = findViewById(R.id.viewPager);
        //slides = Db.getAllSlides();


        getPosts();



        viewPager.registerOnPageChangeCallback(new ViewPager2.OnPageChangeCallback() {
            @Override
            public void onPageSelected(int position) {
                SharedPreferences.Editor editor = sharedPreferences.edit();
                editor.putInt(KEY_POSITION_SLIDE, position);
                editor.apply();
                super.onPageSelected(position);
            }
        });




    }

    private void getPosts() {
        Call<List<Post>> allPostsCall = api.getAllPosts();

        allPostsCall.enqueue(new Callback<List<Post>>() {
            @Override
            public void onResponse(Call<List<Post>> call, Response<List<Post>> response) {
                List<Post> posts = response.body();
                Random random = new Random();
                for (Post post : posts) {

                    slides.add(new Slide(post.getUserId(), post.getTitle(), post.getBody(), Color.rgb(
                            random.nextInt(256),
                            random.nextInt(256),
                            random.nextInt(256)
                    )));
                }


                adapter = new SlideAdapter(MainActivity.this, slides, getSupportFragmentManager());
                viewPager.setAdapter(adapter);
                viewPager.setPageTransformer(new ZoomOutPageTransformer());


                adapter.notifyDataSetChanged();

                if(sharedPreferences.contains(KEY_POSITION_SLIDE)){
                    viewPager.setCurrentItem(sharedPreferences.getInt(KEY_POSITION_SLIDE, 0), true);
                }

            }

            @Override
            public void onFailure(Call<List<Post>> call, Throwable t) {

            }
        });


    }

    @Override
    public void onBackPressed() {
        if (viewPager.getCurrentItem() == 0) {
            super.onBackPressed();
        } else {
            viewPager.setCurrentItem(viewPager.getCurrentItem() - 1);
        }
    }


    public static void getUserById(int id, final UserHelpApi callback) {
        Call<User> call = api.getUserById(id);

        call.enqueue(new Callback<User>() {
            @Override
            public void onResponse(Call<User> call, Response<User> response) {
                User user = response.body();
                UtilUserShow userShow = new UtilUserShow(user.getId(), user.getUsername(), user.getPhone(),
                        user.getAddress().getCity());
                callback.onSuccess(userShow);

            }

            @Override
            public void onFailure(Call<User> call, Throwable t) {
                callback.onFailure(new Exception("Bad request"));

            }


        });
    }
}