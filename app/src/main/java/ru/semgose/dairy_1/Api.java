package ru.semgose.dairy_1;

import retrofit2.http.GET;
import retrofit2.http.Query;

public interface Api {
    @GET("auth")
    User auth(@Query("login") String login, @Query("password") String password);
}
