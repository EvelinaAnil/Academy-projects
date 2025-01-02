using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class Menu : MonoBehaviour
{
    public void OnPlayButtonClick()
    {
        SceneManager.LoadScene("Play");
    }

    public void OnExit_PlayButtonClick()
    {
        SceneManager.LoadScene("Menu");
    }

    public void OnExitButtonClick()
    {
        Application.Quit();
    }
}
