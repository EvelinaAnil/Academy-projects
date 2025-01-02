using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Menu : MonoBehaviour
{
    public void OnLevelsDoButtonClick()
    {
        SceneManager.LoadScene("levels");
    }

    public void OnPlayButtonClick()
    {
        SceneManager.LoadScene("lvl1");
    }

    public void OnLevel2ButtonClick()
    {
        SceneManager.LoadScene("lvl2");
    }

    public void OnLevel3ButtonClick()
    {
        SceneManager.LoadScene("lvl3");
    }

    public void OnExitLevelsButtonClick()
    {
        SceneManager.LoadScene("menu");
    }

    public void OnExitButtonClick()
    {
        Application.Quit();
    }
}
