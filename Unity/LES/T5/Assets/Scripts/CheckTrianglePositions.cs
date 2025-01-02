using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckTrianglePositions : MonoBehaviour
{
   
    public GameObject triangle1;
    public GameObject triangle2;
    public GameObject triangle3;

    void Start()
    {
        
        Vector3 pos1 = triangle1.transform.position;
        Vector3 pos2 = triangle2.transform.position;
        Vector3 pos3 = triangle3.transform.position;

        
        bool isSamePosition = false;

        if (pos1 == pos2)
        {
            Debug.Log("Triangle 1 і Triangle 2 мають однакове положення.");
            isSamePosition = true;
        }

        if (pos1 == pos3)
        {
            Debug.Log("Triangle 1 і Triangle 3 мають однакове положення.");
            isSamePosition = true;
        }

        if (pos2 == pos3)
        {
            Debug.Log("Triangle 2 і Triangle 3 мають однакове положення.");
            isSamePosition = true;
        }

        
        if (!isSamePosition)
        {
            Debug.Log("Жодна пара спрайтів не має однакового положення.");
        }
    }
}
