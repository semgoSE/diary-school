package ru.semgose.dairy_1;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.widget.FrameLayout;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import ru.semgose.dairy_1.componets.SpinnerFragment;
import ru.semgose.dairy_1.router.RouterSign;
import ru.semgose.dairy_1.ui.sign.SignInFragment;
import ru.semgose.dairy_1.ui.sign.up.MenuSignUpFragment;
import ru.semgose.dairy_1.ui.sign.up.WebViewSignUpFragment;

public class SignActivity extends AppCompatActivity {

    public RouterSign router;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sign_activity);
        router = new RouterSign(getSupportFragmentManager(), R.id.container_sign, new SignInFragment(), "SIGN_IN");
    }


    public static void openWebView(String url, String tag) {
        Bundle bundle = new Bundle();
        bundle.putString("url", url);
//        fm.beginTransaction()
//                .replace(R.id.container_sign, WebViewSignUpFragment.class, bundle, tag)
//                .addToBackStack(tag)
//                .commit();
    }



}
