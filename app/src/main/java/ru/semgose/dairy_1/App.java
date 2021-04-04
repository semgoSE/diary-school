package ru.semgose.dairy_1;

import android.app.Application;

import retrofit2.Retrofit;
import retrofit2.converter.moshi.MoshiConverterFactory;


public class App extends Application {

    private static Api api;
    private Retrofit retrofit;

    @Override
    public void onCreate() {
        super.onCreate();

        retrofit = new Retrofit.Builder()
                .baseUrl("https://api.vk.com/")
                .addConverterFactory(MoshiConverterFactory.create())
                .build();
        api = retrofit.create(Api.class);
    }

    public static Api getApi() {
        return api;
    }
}
