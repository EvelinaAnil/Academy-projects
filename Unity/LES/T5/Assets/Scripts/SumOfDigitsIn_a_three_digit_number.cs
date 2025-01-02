using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SumOfDigitsIn_a_three_digit_number : MonoBehaviour
{
    int three_digit_number =123;

    int firstDigit;
    int remainingNumber;
    int result;

    // Start is called before the first frame update
    void Start()
    {
        if (three_digit_number <100 || three_digit_number > 999)
        {
            Debug.Log("Это не трехзначное число!");
        }
        else
        {
            firstDigit = three_digit_number / 100;
            remainingNumber = three_digit_number % 100;
            result = remainingNumber * 10 + firstDigit;

            Debug.Log(three_digit_number);
            Debug.Log("Result :"+result);
        }

    }

    
}
