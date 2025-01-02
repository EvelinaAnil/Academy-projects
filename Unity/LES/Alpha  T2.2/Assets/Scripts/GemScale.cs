using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GemScale : MonoBehaviour
{
    // Минимальный и максимальный размеры кристалла
    public float minScale = 0.5f;
    public float maxScale = 1.5f;
    
    public float speed = 1.0f;
    
    private float time;

    void Update()
    {
        time += Time.deltaTime * speed;
        
        float scale = (Mathf.Sin(time) + 1) / 2 * (maxScale - minScale) + minScale;
        
        transform.localScale = new Vector3(scale, scale, scale);
    }
}
