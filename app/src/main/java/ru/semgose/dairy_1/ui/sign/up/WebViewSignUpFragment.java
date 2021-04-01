package ru.semgose.dairy_1.ui.sign.up;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;


import ru.semgose.dairy_1.R;
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
        webView.loadUrl(savedInstanceState.getString("url"));
        webView.loadUrl("https://esia.gosuslugi.ru/?cc=bp");
        return view;
    }
}


