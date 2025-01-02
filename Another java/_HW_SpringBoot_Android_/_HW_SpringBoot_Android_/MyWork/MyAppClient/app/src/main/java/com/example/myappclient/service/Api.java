package com.example.myappclient.service;


import com.example.myappclient.classes.Record;
import com.example.myappclient.classes.User;
import com.example.myappclient.classes.UserHelp;

import java.util.List;
import java.util.Map;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.DELETE;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.PUT;
import retrofit2.http.Path;

public interface Api {
    @POST("/registerUser")
    Call<String> registerUser(@Body User user);

    @POST("/signUser")
    Call<String> signUser(@Body UserHelp userh);

    @GET("/recordsByLogin/{login}")
    Call<List<Record>> getRecordsByUserLogin(@Path("login") String login);

    @POST("/addRecord")
    Call<ResponseBody> createRecord(@Body Record record);

    @PUT("/updateRecord/{id}")
    Call<ResponseBody> updateRecord(@Path("id") int id, @Body Record updateRecord);

    @DELETE("/deleteRecord/{id}")
    Call<ResponseBody> deleteRecord(@Path("id") int id);


}
