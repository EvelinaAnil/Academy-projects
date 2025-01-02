package com.example.myapp8.ForSlider;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import com.example.myapp8.Classes.User;
import com.example.myapp8.ForApi.NetworkService;
import com.example.myapp8.ForApi.UserHelpApi;
import com.example.myapp8.ForDialog.OwnPostAdapter;
import com.example.myapp8.ForDialog.OwnPostDialog;
import com.example.myapp8.ForDialog.UtilUserShow;
import com.example.myapp8.MainActivity;
import com.example.myapp8.R;

import java.util.ArrayList;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SlideFragment extends Fragment {
    private TextView tvHeader;
    private TextView tvParagraph;
    private Slide slide;
    private FragmentManager fragmentManager;
    private OwnPostAdapter adapter;

    private static com.example.myapp6.Api api;

    public SlideFragment(int resource, Slide slide, FragmentManager fragmentManager) {
        super(resource);
        this.slide = slide;
        this.fragmentManager = fragmentManager;
        api = NetworkService.getInstance().getApi();
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        tvHeader = view.findViewById(R.id.tvHeader);
        tvParagraph = view.findViewById(R.id.tvParagraph);

        tvHeader.setText(slide.getHeader());
        tvParagraph.setText(slide.getParagraph());
        view.setBackgroundColor(slide.getColor());

        tvHeader.setOnClickListener(v -> {
            CreateDialog();
        });
        tvParagraph.setOnClickListener(v -> {
            CreateDialog();
        });
    }

    private void CreateDialog() {

        MainActivity.getUserById(slide.getUserId(), new UserHelpApi() {
            @Override
            public void onSuccess(UtilUserShow userShow) {
                OwnPostDialog dialog = new OwnPostDialog(userShow);
                dialog.show(fragmentManager, "dialog");
                Toast.makeText(getContext(), slide.getHeader(), Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onFailure(Throwable t) {
                Toast.makeText(getContext(), "Some problems...", Toast.LENGTH_SHORT).show();
            }
        });


    }
}
