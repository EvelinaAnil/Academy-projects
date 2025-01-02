package com.example.myapp8.ForDialog;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.myapp8.ForSlider.SlideAdapter;
import com.example.myapp8.R;

import java.util.List;

public class OwnPostAdapter {
    private int resource;
    private UtilUserShow sender;
    private LayoutInflater inflater;


    public OwnPostAdapter(Context context, int resource, UtilUserShow senders) {
        this.resource = resource;
        this.sender = senders;
        inflater = LayoutInflater.from(context);
    }

    @NonNull
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View item = inflater.inflate(resource, parent, false);

        TextView tvUserName = item.findViewById(R.id.tvUserName);
        TextView tvPhone = item.findViewById(R.id.tvPhone);
        TextView tvCity = item.findViewById(R.id.tvCity);


        tvUserName.setText(sender.getUsername());
        tvPhone.setText(sender.getPhone());
        tvCity.setText(sender.getCity());

        return item;
    }
}
