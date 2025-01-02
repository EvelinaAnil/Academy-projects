//using System.Collections;
//using System.Collections.Generic;
//using UnityEngine;

//public class Number_EvenOrOdd : MonoBehaviour
//{
//    int number = 2;

//    int firstDAyOfWeek = 3;
//    int dayOfWeek;
//    string dayName;

//    // Start is called before the first frame update
//    void Start()
//    {
//        if (number < 1 || number >31)
//        {
//            Debug.Log("Error! Not right number!");
//        }
//        else
//        {
//            dayOfWeek = (firstDAyOfWeek + number - 1) % 7;
//            if(number == 0)
//            {
//                number = 7;
//            }
//            switch (number)
//            {
//                case 1:
//                    dayName = "Monday ";
//                break;
//                case 2:
//                    dayName = "Tuesday";
//                    break;
//                case 3:
//                    dayName = "Wednesday";
//                    break;
//                case 4:
//                    dayName = "Thursday";
//                    break;
//                case 5:
//                    dayName = "Friday";
//                    break;
//                case 6:
//                    dayName = "Saturday";
//                    break;
//                case 7:
//                    dayName = "Sunday";
//                    break;
//                default:
//                    Debug.Log("Error!Number is not right!");
//                    break;

//            }
//            Debug.Log("Day of month: "+number);
//            Debug.Log("Day name: "+dayName);
//        }
//    }


//}


using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Number_EvenOrOdd : MonoBehaviour
{
    int A;
    int B;
    int C;

    int min;
    int max;


    // Start is called before the first frame update
    void Start()
    {
        min = Mathf.Min(A, C);
        max = Mathf.Max(A, C);

        if(B >= min && B <= max)
        {
            Debug.Log("Result : " + "B("+B+") is between A("+A+") and C("+C+")");
        }
        else
        {
            Debug.Log("Result : " + "B(" + B + ") isn't between A(" + A + ") and C(" + C + ")");
        }
    }


}
