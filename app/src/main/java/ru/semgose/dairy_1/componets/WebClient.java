package ru.semgose.dairy_1.componets;

import android.annotation.TargetApi;
import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.net.http.SslError;
import android.os.Build;
import android.util.Log;
import android.webkit.CookieManager;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import ru.semgose.dairy_1.SignActivity;
import ru.semgose.dairy_1.SignUpUser;
import ru.semgose.dairy_1.ui.sign.up.BindingSignUpFragment;
import ru.semgose.dairy_1.ui.sign.up.WebViewSignUpFragment;

public class WebClient extends WebViewClient {


    @TargetApi(Build.VERSION_CODES.N)
    @Override
    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
        view.loadUrl(request.getUrl().toString());
        Log.d("req", request.getUrl().toString());
        if(request.getUrl().toString().equals("https://e-school.ryazangov.ru/")) {
            String myCookies = CookieManager.getInstance().getCookie(request.getUrl().toString());
            SignUpUser.setCookie(myCookies);
            SignActivity.nextSignUp(new BindingSignUpFragment(), "BINDING");
        }
        return true;
    }

    @Override
    public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
        handler.proceed(); // Ignore SSL certificate errors
    }

    @Override
    public void onPageStarted(WebView view, String url, Bitmap favicon) {
        super.onPageStarted(view, url, favicon);
    }

    @Override
    public void onPageFinished(WebView view, String url) {
        super.onPageFinished(view, url);
    }
}

