package com.example.myapp8.ForApi;

import com.example.myapp8.ForDialog.UtilUserShow;

public interface UserHelpApi {
    void onSuccess(UtilUserShow userShow);
    void onFailure(Throwable t);
}
