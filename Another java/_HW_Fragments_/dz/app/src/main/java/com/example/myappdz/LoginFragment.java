package com.example.myappdz;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

public class LoginFragment extends Fragment {
    private SharedPreferences sharedPreferences;
    private EditText etLoginL;
    private EditText etPasswordL;
    private Button btnOkL;


    public LoginFragment() {
        super(R.layout.fragment_login);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        init(view);

        sharedPreferences = getActivity().getSharedPreferences("settings", Context.MODE_PRIVATE);

    }

    private void init(@NonNull View view) {
        etLoginL = view.findViewById(R.id.etLoginL);
        etPasswordL = view.findViewById(R.id.etPasswordL);
        btnOkL = view.findViewById(R.id.btnOkL);

        btnOkL.setOnClickListener(this::OkClicked);

    }

    private void OkClicked(View view) {
        if(etLoginL.getText().length() >= 3 && etPasswordL.getText().length() >= 3){
            if(sharedPreferences.contains(etLoginL.getText().toString())){

                if(sharedPreferences.getString(etLoginL.getText().toString(), "").equals(etPasswordL.getText().toString())){
                    Toast.makeText(getActivity(),  "Welcome!", Toast.LENGTH_SHORT).show();
                    SharedPreferences.Editor editor = sharedPreferences.edit();
                    editor.putString(etLoginL.getText().toString(), etPasswordL.getText().toString());
                    editor.apply();

                    //TODO
                    editor.remove("lastSigned");
                    editor.putString("lastSigned", etLoginL.getText().toString());
                    editor.apply();

                    MainActivity.mainFragment.setUserLogin(etLoginL.getText().toString());
                    MainActivity.isShowExit = true;
                    getActivity().invalidateMenu();

                    getActivity().getSupportFragmentManager().beginTransaction()
                            .replace(R.id.container, MainActivity.mainFragment)
                            .commit();
                }
                else{
                    Toast.makeText(getActivity(), "Incorrect data", Toast.LENGTH_SHORT).show();
                }
            }
            else {
                Toast.makeText(getActivity(), "Incorrect data", Toast.LENGTH_SHORT).show();
            }
        }
        else {
            Toast.makeText(getActivity(), "Incorrect data", Toast.LENGTH_SHORT).show();
        }
    }
}
