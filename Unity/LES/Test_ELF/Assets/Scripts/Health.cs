using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Health : MonoBehaviour
{
    public int health;

    private void Start()
    {
        GameManager.Instance.healthContainer.Add(gameObject, this);
    }

    public void TakeHit(int damage)
    {
        health -= damage;
        if (health<=0)
        {
            // Програш/знищення об'єкта
            Destroy(gameObject);
        }
    }

    public void SetHealth(int health)
    {
        this.health = health;
        if (this.health > 100)
        {
            this.health = 100;
        }
    }
}
