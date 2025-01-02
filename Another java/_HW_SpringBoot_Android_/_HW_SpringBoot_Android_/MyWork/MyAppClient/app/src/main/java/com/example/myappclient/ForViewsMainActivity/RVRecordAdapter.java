package com.example.myappclient.ForViewsMainActivity;

import android.app.Activity;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.myappclient.R;
import com.example.myappclient.activity.OneRecordActivity;
import com.example.myappclient.classes.Record;

import java.io.IOException;
import java.util.List;

public class RVRecordAdapter extends RecyclerView.Adapter<RVRecordAdapter.ViewHolder> {

    private List<Record> records;
    private Activity activity;

    public RVRecordAdapter(List<Record> records, Activity activity) {
        this.activity = activity;
        this.records = records;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_list_record, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        holder.tvTitle.setText(records.get(position).getRecordName());
        holder.tvTitle.setOnClickListener(v -> {
            Intent intent = new Intent(activity, OneRecordActivity.class);
            intent.putExtra(OneRecordActivity.KEY_RECORD_NAME, records.get(position).getRecordName().toString());
            intent.putExtra(OneRecordActivity.KEY_RECORD_DESCRIPTION, records.get(position).getDescription().toString());
            intent.putExtra(OneRecordActivity.KEY_RECORD_ID, records.get(position).getId());
            activity.startActivity(intent);
        });
    }

    @Override
    public int getItemCount() {
        return records.size();
    }

    public void RemoveRecord(int position){
        records.remove(position);
    }

    public static class ViewHolder extends RecyclerView.ViewHolder{
        public TextView tvTitle;
        public ViewHolder(View view){
            super(view);
            tvTitle = view.findViewById(R.id.tvTitle);
        }


    }
}
