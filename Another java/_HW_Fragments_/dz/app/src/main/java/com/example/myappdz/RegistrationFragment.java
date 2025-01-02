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
import androidx.fragment.app.FragmentManager;

public class RegistrationFragment extends Fragment {
    private SharedPreferences sharedPreferences;
    private EditText etLoginR;
    private EditText etPasswordR;
    private EditText etConfirmPasswordR;
    private Button btnOkR;

//    private FragmentManager fragmentManager;


    public RegistrationFragment() {//FragmentManager fragmentManager
        super(R.layout.fragment_registration);
//        this.fragmentManager = fragmentManager;
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        init(view);

        sharedPreferences = getActivity().getSharedPreferences("settings", Context.MODE_PRIVATE);

    }

    private void init(@NonNull View view) {
        etLoginR = view.findViewById(R.id.etLoginR);
        etPasswordR = view.findViewById(R.id.etPasswordR);
        etConfirmPasswordR = view.findViewById(R.id.etConfirmPasswordR);
        btnOkR = view.findViewById(R.id.btnOkR);

        btnOkR.setOnClickListener(this::OkClicked);

    }

    private void OkClicked(View view) {
        String login = etLoginR.getText().toString();
        if(etLoginR.getText().length() >= 3 && etPasswordR.getText().length() >= 3){
            if(etPasswordR.getText().toString().equals(etConfirmPasswordR.getText().toString())){
                if(sharedPreferences.contains(login)){
                    Toast.makeText(getActivity(),  "this login has already signed", Toast.LENGTH_SHORT).show();
                }
                else {
                    SharedPreferences.Editor editor = sharedPreferences.edit();
                    editor.putString(login, etPasswordR.getText().toString());
                    editor.apply();

                    //TODO
                    editor.remove("lastSigned");
                    editor.putString("lastSigned", login);
                    editor.apply();

                    MainActivity.mainFragment.setUserLogin(login);
                    MainActivity.isShowExit = true;
                    getActivity().invalidateMenu();

                    getActivity().getSupportFragmentManager().beginTransaction()
                            .replace(R.id.container, MainActivity.mainFragment)
                            .commit();



                    Toast.makeText(getActivity(), "registered!", Toast.LENGTH_SHORT).show();
                }
            }
            else{
                Toast.makeText(getActivity(), "Passwords aren`t equal", Toast.LENGTH_SHORT).show();
            }
        }
        else {
            Toast.makeText(getActivity(), "Incorrect data", Toast.LENGTH_SHORT).show();
        }
    }
}
