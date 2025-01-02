using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReloadStartPosition : MonoBehaviour
{
    public float startX;
    public float startY;
    
    public float minHeight;
   
    // Update is called once per frame
    void Update()
    {
        Vector2 currentPosition = transform.position;
        if (currentPosition.y < minHeight)
        {
           transform.position = new Vector2(startX, startY);

        }
        
    }

   
    
}
