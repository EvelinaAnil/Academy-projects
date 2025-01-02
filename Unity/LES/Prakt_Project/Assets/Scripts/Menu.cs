using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Menu : MonoBehaviour
{
    public void OnCovertButtonClick()
    {
        SceneManager.LoadScene("converter");
    }

    public void OnCalcButtonClick()
    {
        SceneManager.LoadScene("claculartor");
    }

    public void OnExitButtonClick()
    {
        Application.Quit();
    }

}
