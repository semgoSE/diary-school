package ru.semgose.dairy_1.router;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import ru.semgose.dairy_1.R;

public class RouterSign {
    private static FragmentManager fm;
    private static int container;
    private static String last_tag;

    public RouterSign(FragmentManager fm, int container, Fragment first, String tag) {
        this.container = container;
        this.fm = fm;
        last_tag = tag;
        fm.beginTransaction().replace(container, first, tag).commit();
    }

    public static void add(Fragment fr, String tag) {
        last_tag = tag;
        fm.beginTransaction()
                .add(container, fr, tag)
                .addToBackStack(tag)
                .commit();
    }

    public static void add(Fragment fr, String tag, boolean is_back) {
        if(!is_back) {
            last_tag = tag;
            fm.beginTransaction()
                    .add(container, fr, tag)
                    .commit();
        } else add(fr, tag);
    }

    public static void replace(Fragment fr, String tag) {
        fm.beginTransaction()
                .replace(container, fr, tag)
                .addToBackStack(tag)
                .commit();
    }

    public static void replace(Fragment fr, String tag, boolean is_back) {
        if(!is_back) {
            fm.beginTransaction()
                    .replace(container, fr, tag)
                    .commit();
        } else replace(fr, tag);
    }

    public static void remove() {
        Fragment fr = getFragmentByTag(last_tag);
        if(fr != null) {
            fm.beginTransaction()
                    .remove(fr)
                    .commit();
        }
    }

    public static void remove(String tag) {
        Fragment fr = getFragmentByTag(tag);
        if(fr != null) {
            fm.beginTransaction()
                    .remove(fr)
                    .commit();
        }

    }

    public static void openModal(Fragment fr, String tag) {
        last_tag = tag;
        fm.beginTransaction()
                .setCustomAnimations(R.animator.open_modal, R.animator.close_modal)
                .add(container, fr, tag)
                .addToBackStack(tag)
                .commit();
    }

    public static void openModal(Fragment fr, String tag, boolean is_back) {
        if(!is_back) {
            last_tag = tag;
            fm.beginTransaction()
                    .setCustomAnimations(R.animator.open_modal, R.animator.close_modal)
                    .add(container, fr, tag)
                    .commit();
        } else add(fr, tag);
    }


    public static Fragment getFragmentByTag(String tag) {
        return (Fragment)  fm.findFragmentByTag(tag);
    }
}
