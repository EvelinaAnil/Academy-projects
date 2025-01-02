using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    [SerializeField] private float speed = 2;
    [SerializeField] private float force = 7;
    [SerializeField] Rigidbody2D rb2d;
    [SerializeField] GroundDetection groundDetection;
    private Vector2 direction;
    public Animator animator;
    public SpriteRenderer spriteRenderer;

    private void Start()
    {           
    }

    void FixedUpdate()
    {
        direction = Vector2.zero;   

        if(Input.GetKey(KeyCode.A))
        {
            direction = Vector2.left;
        }

        if (Input.GetKey(KeyCode.D))
        {
            direction = Vector2.right;
        }

        direction *= speed;
        direction.y = rb2d.velocity.y;
        rb2d.velocity = direction;

        if (Input.GetKeyDown(KeyCode.Space) && groundDetection.isGrounded)
        {
            rb2d.AddForce(Vector2.up * force, ForceMode2D.Impulse);
        }

        animator.SetFloat("Speed", Mathf.Abs(direction.x));

        if (direction.x > 0)
        {
            spriteRenderer.flipX = false;
        }
        else if (direction.x < 0)
        {
            spriteRenderer.flipX = true;
        }

    }
}
