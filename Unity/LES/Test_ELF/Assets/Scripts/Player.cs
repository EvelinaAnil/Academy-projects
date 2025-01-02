using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    [SerializeField] private float speed = 2;
    [SerializeField] private float force = 7;
    [SerializeField] private float shotForce = 3;
    [SerializeField] Rigidbody2D rb2d;
    [SerializeField] GroundDetection groundDetection;
    private Vector2 direction;
    public Animator animator;
    public SpriteRenderer spriteRenderer;
    private bool isJumping;

    [SerializeField] private GameObject arrow;
    [SerializeField] private Transform arrowSpawnPoint;

    public float Speed
    {
        get { return speed; }
        set { speed = value; }
    }

    public static Player Instance { get; private set; }

    private void Awake()
    {
       Instance = this;
    }

    // Awake - Start - Update - FixedUpdate - LateUpdate

    private void Start()
    {
        if (!groundDetection)
        {
            Debug.Log("Component!!!!");
            groundDetection = GetComponent<GroundDetection>();            
        }       
    }


    void Update()
    {
        animator.SetBool("isGrounded", groundDetection.isGrounded);

        if (!isJumping && !groundDetection.isGrounded)
        {
            animator.SetTrigger("StartFall");
        }

        isJumping = isJumping && !groundDetection.isGrounded;

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
            animator.SetTrigger("StartJump");
            isJumping = true;
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

        Fire();
    }

    void Fire()
    {
        if (Input.GetMouseButtonDown(0))
        {
            GameObject bullet = Instantiate(arrow, arrowSpawnPoint.position, Quaternion.identity);

            bullet.GetComponent<Arrow>().SetImpulse(
                Vector2.right, 
                spriteRenderer.flipX? -shotForce:shotForce, 
                gameObject);
        }
    }


    
}
