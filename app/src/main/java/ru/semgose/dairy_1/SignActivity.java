package ru.semgose.dairy_1;

import android.content.Context;
import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import ru.semgose.dairy_1.ui.sign.SignInFragment;
import ru.semgose.dairy_1.ui.sign.up.MenuSignUpFragment;
import ru.semgose.dairy_1.ui.sign.up.WebViewSignUpFragment;

public class SignActivity extends AppCompatActivity {

    Context context;
    private static FragmentManager fm;



    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        fm = getSupportFragmentManager();
        fm.beginTransaction().add(R.id.container_sign, new SignInFragment(), "SIGN_IN").commit();
        setContentView(R.layout.sign_activity);
        context = this;
    }

    public static void goSignUp() {
        //SignInFragment fr = (SignInFragment) fm.findFragmentByTag("SIGN_IN");
        fm.beginTransaction()
                .replace(R.id.container_sign, new MenuSignUpFragment(), "SIGN_UP")
                .addToBackStack("SIGN_UP")
                .commit();
    }

    public static void nextSignUp(Fragment fr, String tag) {
        //SignInFragment fr = (SignInFragment) fm.findFragmentByTag("SIGN_IN");
        fm.beginTransaction()
                .replace(R.id.container_sign, fr, tag)
                .addToBackStack(tag)
                .commit();
    }

    public static void openWebView(String url, String tag) {
        Bundle bundle = new Bundle();
        bundle.putString("url", url);
        fm.beginTransaction()
                .replace(R.id.container_sign, WebViewSignUpFragment.class, bundle, tag)
                .addToBackStack(tag)
                .commit();
    }

    public static void goSignIn() {
        fm.beginTransaction().replace(R.id.container_sign, new SignInFragment()).commit();
    }

}
