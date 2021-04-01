package ru.semgose.dairy_1.ui.sign.up;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import ru.semgose.dairy_1.R;
import ru.semgose.dairy_1.SignActivity;

public class MenuSignUpFragment extends Fragment {
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.sign_up_1_fragment, container, false);
        Button btn_sign_up_gos = (Button) view.findViewById(R.id.sign_up_gos_btn);

        btn_sign_up_gos.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SignActivity.openWebView("https://e-school.ryazangov.ru/auth/esia/send-authn-request", "WEBVIEW_SIGN_UP_GOS");
            }
        });
        return view;
    }
}
