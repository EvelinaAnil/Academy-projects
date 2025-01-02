using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyMover : MonoBehaviour
{
    
    public float speed = 1.0f;
    public bool isRightDirection = true;
    [SerializeField] Rigidbody2D rb2d;
    [SerializeField] GroundDetection groundDetection;

    private void Start()
    {
        rb2d = GetComponent < Rigidbody2D >();
        groundDetection = GetComponent<GroundDetection>();
    }

    void Update()
    {
        if (isRightDirection && groundDetection.isGrounded)
        {
            rb2d.velocity = Vector2.right * speed;
            
        }
        else if (!isRightDirection && groundDetection.isGrounded)
        {
            rb2d.velocity = Vector2.left * speed;
            
        }
    }

    private void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject.CompareTag("left")|| col.gameObject.CompareTag("right"))
        {
            isRightDirection = !isRightDirection;
            transform.Rotate(0, 180, 0);
        }
    }
}
