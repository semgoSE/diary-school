package ru.semgose.dairy_1;

import java.util.ArrayList;

import ru.semgose.dairy_1.statics.BindingAccount;

public class SignUpUser {
    private static String cookie = "";
    private static ArrayList<BindingAccount> BindingAccounts;

    public static String getCookie() {
        return cookie;
    }
    public static ArrayList<BindingAccount> getBindingAccounts() {
        return BindingAccounts;
    }


    public static void addBindingAccount(BindingAccount b) {
        BindingAccounts.add(b);
    }

    public static void setCookie(String cookie) {
        SignUpUser.cookie = cookie.split(";")[0];
    }
}
