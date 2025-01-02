package com.example.myapp6;

import com.example.myapp8.Classes.Post;
import com.example.myapp8.Classes.User;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface Api {
    @GET("/posts")
    Call<List<Post>> getAllPosts();

    @GET("/posts/{id}")
    Call<Post> getPostById(@Path("id") int postId);

    @GET("/users/{id}")
    Call<User> getUserById(@Path("id") int userId);
}
