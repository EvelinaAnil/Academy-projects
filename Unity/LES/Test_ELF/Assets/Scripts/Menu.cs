using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class Menu : MonoBehaviour
{
    [SerializeField] private InputField nameInputField;

    private void Start()
    {
        if (PlayerPrefs.HasKey("PlayerName"))
        {
            nameInputField.text = PlayerPrefs.GetString("PlayerName");
        }
    }


    public void onClickPlay()
    {
        SceneManager.LoadScene("lvl1");
    }

    public void onClickExit()
    {
        Application.Quit();
    }

    public void OnEndEditName()
    {
        PlayerPrefs.SetString("PlayerName", nameInputField.text);
    }
}
