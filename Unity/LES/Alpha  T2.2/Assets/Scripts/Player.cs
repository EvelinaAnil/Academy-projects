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
    private bool isJumping;

    [SerializeField] private GameObject fireball = null;
    [SerializeField] private Transform fireballSpawnpoint = null;
    [SerializeField] private float schootForce = 5f;
    
    private bool isReloading = false;
    public float reloadTime = 2.0f;

    private void Start()
    {
    }

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

    void Update()
    {
        animator.SetBool("isGrounded", groundDetection.isGrounded);

        if (!isJumping && !groundDetection.isGrounded)
        {
            animator.SetTrigger("StartFall");
        }

        isJumping = isJumping && !groundDetection.isGrounded;

        direction = Vector2.zero;

        if (Input.GetKey(KeyCode.A))
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
            if (!isReloading)
            {
                animator.SetTrigger("Fire");
            }
            
            
        }

    }

    void CreateFireball()
    {
       
            GameObject bullet = Instantiate(fireball, fireballSpawnpoint.position, Quaternion.identity);

        bullet.GetComponent<FireBall>().SetImpulse(
            Vector2.right,
            spriteRenderer.flipX ? -schootForce : schootForce
            ,gameObject
            );

        StartCoroutine(ReloadCoroutine());//Запуск корутины перезаряд.

    }

    IEnumerator ReloadCoroutine()
    {
       
        isReloading = true; // состояния перезарядки
        yield return new WaitForSeconds(reloadTime);//Ожидание времени перезарядки
        isReloading = false;//Сброс состояния перезарядки
    }
}
