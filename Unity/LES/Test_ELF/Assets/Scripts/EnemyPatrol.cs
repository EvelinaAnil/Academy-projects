using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyPatrol : MonoBehaviour
{
    [SerializeField] private GameObject leftBorder;
    [SerializeField] private GameObject rightBorder;
    [SerializeField] private bool isRightDirection;
    [SerializeField] private float speed;
    [SerializeField] Rigidbody2D rb2d;
    [SerializeField] GroundDetection groundDetection;

    void Update()
    {
        if (isRightDirection && groundDetection.isGrounded)
        {            
            rb2d.velocity = Vector2.right * speed;
            if (transform.position.x > rightBorder.transform.position.x)
            {
                isRightDirection = !isRightDirection;
            }
        }
        else if (!isRightDirection && groundDetection.isGrounded)
        {
            rb2d.velocity = Vector2.left * speed;
            if (transform.position.x < leftBorder.transform.position.x)
            {
                isRightDirection = !isRightDirection;

            }
        }
    }
}
