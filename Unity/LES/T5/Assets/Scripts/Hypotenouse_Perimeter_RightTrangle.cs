//using System.Collections;
//using System.Collections.Generic;
//using UnityEngine;

//public class Hypotenouse_Perimeter_RightTrangle : MonoBehaviour
//{
//    float cathetus_A = 3f;
//    float cathetus_B = 4f;

//    float hypotenuse;
//    float perimeter;

//    // Start is called before the first frame update
//    void Start()
//    {
//        hypotenuse = (cathetus_A * cathetus_A) * (cathetus_B * cathetus_B);
//        perimeter = cathetus_A + cathetus_B + hypotenuse;

//        Debug.Log("Гипотенуза прямоугольного треугольника: " + hypotenuse);
//        Debug.Log("Периметр прямоугольного треугольника: " + perimeter);
//    }


//}


using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Hypotenouse_Perimeter_RightTrangle : MonoBehaviour
{
    float x1 =3.2f;
    float y1 = 7.8f;
    float x2 = 52f;
    float y2 = 7.21f;

    float distance_between_two_points;
    

    // Start is called before the first frame update
    void Start()
    {
        distance_between_two_points = ((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1));

        Debug.Log("Pасстояние между двумя точками: " + distance_between_two_points);
    }


}