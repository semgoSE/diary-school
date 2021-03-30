package ru.semgose.dairy_1;

import android.content.Context;
import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import ru.semgose.dairy_1.componets.SpinnerFragment;

public class SignActivity extends AppCompatActivity {

    Context context;
    private static FragmentManager fm;


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        context = this;
        fm = getSupportFragmentManager();
        setContentView(R.layout.sign_activity);
    }

}
