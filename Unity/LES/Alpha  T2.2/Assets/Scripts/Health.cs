using System.Collections;
using System.Collections.Generic;
using UnityEngine;

    

public class Health : MonoBehaviour
{
    public int health;
    private GameManager gameManager ;

    public void SubstractHealth(int damage)
    {
        health -= damage;
        if (health <= 0)
        {
            if (gameObject.tag == "Player")
            {
                gameManager.ShowGameOver();

                
            }
            else if  (gameObject.tag != "Player")
            {
                 //Disappear/kill object
                 Destroy(gameObject);
            }
           
            
        }
    }

    public void AddHealth(int add)
    {
        health = add;
        if (health > 100)
        {
            health = 100;
        }
    }
}
