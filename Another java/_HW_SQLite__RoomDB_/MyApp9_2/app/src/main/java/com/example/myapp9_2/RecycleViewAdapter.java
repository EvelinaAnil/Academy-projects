package com.example.myapp9_2;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class RecycleViewAdapter extends RecyclerView.Adapter<RecycleViewAdapter.ViewHolder> {

    private List<Contact> contacts;

    public RecycleViewAdapter(List<Contact> contacts) {
        this.contacts = contacts;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(android.R.layout.simple_list_item_2, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Contact item = contacts.get(position);
        holder.textView1.setText(item.getFullName());
        holder.textView2.setText(item.getPhone());
    }

    @Override
    public int getItemCount() {
        return contacts.size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        public TextView textView1;
        public TextView textView2;

        public ViewHolder(View view) {
            super(view);
            textView1 = view.findViewById(android.R.id.text1);
            textView2 = view.findViewById(android.R.id.text2);
        }
    }

    public void removeContact(int position){
        contacts.remove(position);
        notifyDataSetChanged();
    }

    public void restoreItem(Contact contact, int position){
        contacts.add(position, contact);
        notifyDataSetChanged();
    }
}