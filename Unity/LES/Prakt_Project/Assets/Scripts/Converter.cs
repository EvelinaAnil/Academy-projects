using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class Converter : MonoBehaviour
{
    public InputField inputField;
    public Text resultText;

    public void OnExitButtonClick()
    {
        SceneManager.LoadScene("menu");
    }

    public void OnSmButtonClick()
    {
        ConvertAndDisplayResult(1);
    }

    public void OnMButtonClick()
    {
        ConvertAndDisplayResult(100);
    }

    public void OnKmButtonClick()
    {
        ConvertAndDisplayResult(100000);
    }

    private void ConvertAndDisplayResult(float conversionFactor)
    {
        string inputValue = inputField.text;
        if (string.IsNullOrEmpty(inputValue))
        {
            resultText.text = "Please enter a value.";
            return;
        }

        if (float.TryParse(inputValue, out float inputNumber))
        {
            float result = inputNumber * conversionFactor;
            resultText.text = result.ToString();
        }
        else
        {
            resultText.text = "Invalid input. Please enter a numeric value.";
        }
    }
}
