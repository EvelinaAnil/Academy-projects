using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FindRightmostSprite : MonoBehaviour
{
    public GameObject sprite1;
    public GameObject sprite2;
    public GameObject sprite3;

    void Start()
    {
        
        Vector3 pos1 = sprite1.transform.position;
        Vector3 pos2 = sprite2.transform.position;
        Vector3 pos3 = sprite3.transform.position;

        
        GameObject rightmostSprite = sprite1;

        // Порівняти по осі x
        if (pos2.x > rightmostSprite.transform.position.x)
        {
            rightmostSprite = sprite2;
        }

        if (pos3.x > rightmostSprite.transform.position.x)
        {
            rightmostSprite = sprite3;
        }

       
        Debug.Log("Найправіший спрайт: " + rightmostSprite.name);
    }
}
