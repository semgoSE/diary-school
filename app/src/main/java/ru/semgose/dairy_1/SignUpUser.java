package ru.semgose.dairy_1;

public class SignUpUser {
    private static String cookie = "";

    public static String getCookie() {
        return cookie;
    }

    public static void setCookie(String cookie) {
        SignUpUser.cookie = cookie.split(";")[0];
    }
}
