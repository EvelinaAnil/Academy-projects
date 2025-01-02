using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    [SerializeField] private float speed = 3;
    [SerializeField] Rigidbody2D rb2d;
    private Vector2 direction;
    private Money money;
    public int coins = 0;
    //public SpriteRenderer spriteRenderer;

    

    void Update()
    {
        direction.x = Input.GetAxis("Horizontal");
        //код получает значение оси "Horizontal" из ввода пользователя и присваивает его переменной "direction.x".
        direction.y = Input.GetAxis("Vertical");
        //код получает значение оси "Vertical" из ввода пользователя и присваивает его переменной "direction.y"
        rb2d.MovePosition(rb2d.position + direction * speed * Time.deltaTime); //спользуется для перемещения объекта на сцене
        //(текущая позиция объекта  +  вектор направления *  скорость, с которой объект должен перемещаться  * время, прошедшее с последнего кадра)


        //if (direction.x > 0)
        //{
        //    spriteRenderer.flipX = false;
        //}
        //else if (direction.x < 0)
        //{
        //    spriteRenderer.flipX = true;
        //}

    }

    //private void OnTriggerEnter2D(Collider2D col)
    //{
    //    if (col.gameObject.CompareTag("Money") && money.IsGreen)
    //    {
    //        coins++;
    //    }
    //}

    //private void OnTriggerEnter2D(Collider2D col)
    //{
    //    if (col.gameObject.CompareTag("Money"))
    //    {
    //        coins++;
    //    }
    //}
}
