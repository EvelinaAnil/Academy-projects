using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CirclesSquare : MonoBehaviour
{
    //Переменные

    float smollerCircleRadius = 5.5f;  //меньшый радиус
    float biggerCircleRadius = 7.2f;   //больший радиус

    float smollerCircleSquare;  //площадь меншого радиусу
    float biggerCircleSquare;   //площадь большого радиусу


    void Start()
    {
        smollerCircleSquare = Mathf.PI * Mathf.Pow(smollerCircleRadius, 2.0f);
        biggerCircleSquare = Mathf.PI * Mathf.Pow(biggerCircleRadius, 2.0f);

        Debug.Log("Площадь меньшей окружности: " + smollerCircleSquare);
        Debug.Log("Площадь большей окружности: " + biggerCircleSquare);
    }


}

    
