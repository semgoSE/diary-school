package ru.semgose.dairy_1.ui.sign.up;

import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.fragment.app.Fragment;

import ru.semgose.dairy_1.R;
import ru.semgose.dairy_1.router.RouterSign;

public class ModalSignInBindingFragment extends Fragment {
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.modal_sign_in_binding_fragment, container, false);
        ConstraintLayout modalClose = (ConstraintLayout) view.findViewById(R.id.modal_close);
        modalClose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RouterSign.remove();
            }
        });
        return view;
    }
}
