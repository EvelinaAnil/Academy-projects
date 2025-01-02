package com.example.myappdz;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class UserAdapter extends RecyclerView.Adapter<UserAdapter.UserViewHolder> {
    public final static String KEY_NAME = "name";
    public final static String KEY_USERNAME = "username";
    public final static String KEY_EMAIL = "email";
    public final static String KEY_PHONE = "phone";
    public final static String KEY_CITY = "city";
    public final static String KEY_COMPANY_NAME = "companyName";
    private Context context;
    private int resource;
    private List<UtilUserShow> users;
    private LayoutInflater inflater;
    public UserAdapter(Context context, int resource, List<UtilUserShow> data) {
        this.context = context;
        this.resource = resource;
        this.users = data;
        inflater = LayoutInflater.from(context);
    }

    @NonNull
    @Override
    public UserViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View item = inflater.inflate(resource, parent, false);
        UserViewHolder userViewHolder = new UserViewHolder(item);
        return userViewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull UserViewHolder holder, int position) {
        String[] partsOfName = ClearUserName(users.get(position).getName()).split(" ");
        holder.tvHolder.setText(partsOfName[0]);
        holder.tvData.setText(partsOfName[1]);
        holder.tvData.setOnClickListener(v -> {
            SetDataToIntent(position);
        });
        holder.tvHolder.setOnClickListener(v -> {
            SetDataToIntent(position);
        });
    }

    private void SetDataToIntent(int position) {
        Intent intent = new Intent(context, AdvancedShowActivity.class);
        intent.putExtra(KEY_NAME, users.get(position).getName());
        intent.putExtra(KEY_USERNAME, users.get(position).getUsername());
        intent.putExtra(KEY_EMAIL, users.get(position).getEmail());
        intent.putExtra(KEY_PHONE, users.get(position).getPhone());
        intent.putExtra(KEY_CITY, users.get(position).getCity());
        intent.putExtra(KEY_COMPANY_NAME, users.get(position).getCompanyName());
        context.startActivity(intent);
    }

    @Override
    public int getItemCount() {
        return users.size();
    }

    public static class UserViewHolder extends RecyclerView.ViewHolder{
        TextView tvHolder;
        TextView tvData;
        public UserViewHolder(@NonNull View itemView) {
            super(itemView);
            tvHolder = itemView.findViewById(R.id.tvHolder);
            tvData = itemView.findViewById(R.id.tvData);
        }

    }


    private String ClearUserName(String name){
        if(name.contains("Mrs. ")){
            return name.substring(5);
        }
        else if(name.endsWith("V")){
            return name.substring(0, name.indexOf("V") - 1);
        }
        return name;
    }
}
