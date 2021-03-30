package ru.semgose.dairy_1.componets;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import ru.semgose.dairy_1.R;

public class SpinnerFragment extends Fragment {

    ImageView spinner;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.spinner, container, false);
        Animation anim = AnimationUtils.loadAnimation(getContext(), R.anim.spinner_anim);
        spinner = (ImageView) v.findViewById(R.id.spinner);
        spinner.startAnimation(anim);
        return v;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        //spinner.setAnimation(null);
    }
}
