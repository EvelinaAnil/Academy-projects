package com.example.myapp8.ForSlider;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.viewpager2.adapter.FragmentStateAdapter;

import com.example.myapp8.R;

import java.util.List;

public class SlideAdapter extends FragmentStateAdapter {
    private List<Slide> slides;
    private FragmentManager fragmentManager;
    public SlideAdapter(@NonNull FragmentActivity fragmentActivity, List<Slide>slides, FragmentManager fragmentManager) {
        super(fragmentActivity);
        this.slides = slides;
        this.fragmentManager = fragmentManager;
    }

    @NonNull
    @Override
    public Fragment createFragment(int position) {
        int resource = position % 2 == 0
                ? R.layout.fragment_slide_top
                : R.layout.fragment_slide_bottom;
        return new SlideFragment(resource, slides.get(position), fragmentManager);
    }

    @Override
    public int getItemCount() {
        return slides.size();
    }
}
