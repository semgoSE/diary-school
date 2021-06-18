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
import ru.semgose.dairy_1.router.RouterSign;

public class BindingSignUpFragment extends Fragment {
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.sign_up_2_fragment, container, false);
        Button add = (Button) view.findViewById(R.id.add);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RouterSign.openModal(new ModalSignInBindingFragment(), "MODAL_BINDING");
            }
        });
        return view;
    }
}
