using System.Collections;
using System.Collections.Generic;
using UnityEngine;

 public  class  ReloadPosition : MonoBehaviour
{
    public float startX;
    public float startY;

    public float minHeight;
    
    void Update()
    {
        

        if (Input.GetKeyDown(KeyCode.F9))
        {
            Vector2 currentPosition = transform.position;
            
                transform.position = new Vector2(startX, startY);


        }
        

    }
}
