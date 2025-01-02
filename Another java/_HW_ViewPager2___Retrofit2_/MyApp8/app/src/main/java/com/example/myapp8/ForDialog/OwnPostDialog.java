package com.example.myapp8.ForDialog;

import android.app.Dialog;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.DialogFragment;

import com.example.myapp8.R;

public class OwnPostDialog extends DialogFragment {
    private UtilUserShow user;
    private TextView tvUserName;
    private TextView tvPhone;
    private TextView tvCity;


    public OwnPostDialog(UtilUserShow user){
        this.user = user;
    }

    @NonNull
    @Override
    public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {
        View view = getLayoutInflater().inflate(R.layout.dialog_own_post, null);

        tvUserName = view.findViewById(R.id.tvUserName);
        tvPhone = view.findViewById(R.id.tvPhone);
        tvCity = view.findViewById(R.id.tvCity);

        tvUserName.setText(user.getUsername());
        tvPhone.setText(user.getPhone());
        tvCity.setText(user.getCity());

        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setView(view);

        return builder.create();


    }
}
