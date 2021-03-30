package ru.semgose.dairy_1.ui.sign;

import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.google.android.material.drawable.DrawableUtils;

import ru.semgose.dairy_1.MainActivity;
import ru.semgose.dairy_1.R;
import ru.semgose.dairy_1.SignActivity;
import ru.semgose.dairy_1.componets.SpinnerFragment;

public class SignInFragment extends Fragment {


    Button sign_in_btn;
    Button sign_up_btn;
    EditText login;
    EditText password;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.sign_in_fragment, container);
        sign_in_btn = (Button) v.findViewById(R.id.sign_in_btn);
        sign_up_btn = (Button) v.findViewById(R.id.sign_up_btn);
        login = (EditText) v.findViewById(R.id.login);
        password = (EditText) v.findViewById(R.id.password);
        sign_in_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sign_in_btn.setEnabled(false);
                sign_up_btn.setEnabled(false);
                password.setEnabled(false);
                login.setEnabled(false);
                getChildFragmentManager().beginTransaction().add(R.id.container_spinner, new SpinnerFragment()).commit();

            }
        });
        return v;
    }


}
