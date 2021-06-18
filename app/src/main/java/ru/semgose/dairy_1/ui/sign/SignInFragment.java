package ru.semgose.dairy_1.ui.sign;

import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import com.google.android.material.drawable.DrawableUtils;
import com.google.android.material.snackbar.Snackbar;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import ru.semgose.dairy_1.MainActivity;
import ru.semgose.dairy_1.R;
import ru.semgose.dairy_1.SignActivity;
import ru.semgose.dairy_1.User;
import ru.semgose.dairy_1.componets.SpinnerFragment;
import ru.semgose.dairy_1.router.RouterSign;
import ru.semgose.dairy_1.ui.sign.up.MenuSignUpFragment;
import timber.log.Timber;

public class SignInFragment extends Fragment {


    Button sign_in_btn;
    Button sign_up_btn;
    EditText login;
    EditText password;
    FragmentManager fm;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.sign_in_fragment, container, false );
        sign_in_btn = (Button) view.findViewById(R.id.sign_in_btn);
        sign_up_btn = (Button) view.findViewById(R.id.sign_up_btn);
        login = (EditText) view.findViewById(R.id.login);
        password = (EditText) view.findViewById(R.id.password);
        sign_in_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Log.d("dd", "click");
                if(!(login.getText().toString().equals("") || password.getText().toString().equals(""))) {
                    Log.d("click", "click");
                    RouterSign.add(new SpinnerFragment(), "SPINNER", false);
                } else {
                    Snackbar.make(v, "Заполните все поля!", 3000).show();
                }
            }
        });

        sign_up_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RouterSign.replace(new MenuSignUpFragment(), "MENU_SIGN_UP");
            }
        });
        return view;
    }


}
