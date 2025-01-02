using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Player : MonoBehaviour
{
    public float speed;
    public Text LivesUIText;
    const int MaxLives = 10;
    int lives;


    public void Init()
    {
        lives = MaxLives;
        LivesUIText.text = lives.ToString();

        gameObject.SetActive(true); // set this player game obj to active
    }

   
    void Start()
    {
        
    }

    
    void Update()
    {
        float x = Input.GetAxisRaw("Horizontal"); //the valuie will be -1 0 or 1 (for left and rigght)
        float y = Input.GetAxisRaw("Vertical"); //the valuie will be -1 0 or 1 (for down and up)

        Vector2 dir = new Vector2(x, y).normalized;

        Move(dir);

    }

     void Move(Vector2 dir)
    {
        Vector2 min = Camera.main.ViewportToWorldPoint(new Vector2(0, 0));
        Vector2 max = Camera.main.ViewportToWorldPoint(new Vector2(1, 1));

        max.x = max.x - 0.225f;
        min.x = min.x - 0.225f;

        max.y = max.y - 0.285f;
        min.y = min.y - 0.285f;

        Vector2 pos = transform.position;
        pos += dir * speed * Time.deltaTime;
        pos.x = Mathf.Clamp(pos.x, min.x, max.x);
        pos.y = Mathf.Clamp(pos.y, min.y, max.y);
        transform.position = pos;
    }
}
