package ru.semgose.dairy_1.classes;

import android.net.Uri;

public class BindingAccount {
    public int user_id;
    public String token;
    public Uri avatar;
    //public String domain;
    public String name;

    public BindingAccount(int user_id, String token, String name, Uri avatar) {
        this.user_id = user_id;
        this.token = token;
        this.name = name;
        this.avatar = avatar;
    }
}
