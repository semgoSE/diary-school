package ru.semgose.dairy_1.ui.sign.up;

import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.loader.content.AsyncTaskLoader;


import ru.semgose.dairy_1.R;
import ru.semgose.dairy_1.SignActivity;
import ru.semgose.dairy_1.componets.SpinnerFragment;
import ru.semgose.dairy_1.componets.WebClient;

public class WebViewSignUpFragment extends Fragment {

    WebView webView;



    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.sign_up_webview_fragment, container, false);
        webView = (WebView) view.findViewById(R.id.webview_sign_up);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.setWebViewClient(new WebClient());
        webView.loadUrl(getArguments().getString("url"));
        return view;
    }




}


