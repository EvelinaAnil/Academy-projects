using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CoinRotate : MonoBehaviour
{
    public float rotateSpeed = 1.0f;


    void Update()
    {
        transform.Rotate(new Vector3(0, 1, 0) * rotateSpeed);
    }
}
