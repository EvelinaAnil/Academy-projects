package com.example.myappclient.service;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class NetworkService {
    private static NetworkService networkService;
    private Retrofit retrofit;
    private Api api;

    private NetworkService() {
        retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.56.1:8080/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        api = retrofit.create(Api.class);
    }

    public static NetworkService getInstance() {
        if (networkService == null) {
            networkService = new NetworkService();
        }
        return networkService;
    }

    public Api getApi() {
        return api;
    }
}