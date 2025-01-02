using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TriggerDamage : MonoBehaviour
{
    [SerializeField] public int damage;
    [SerializeField] private bool mustDestroying;
    [SerializeField] private GameObject parent;

    public GameObject Parent
    {
        get { return parent; }
        set { parent = value; }
    }

    private void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject == parent)
        {
            return;
        }

        if (GameManager.Instance.healthContainer.ContainsKey(col.gameObject))
        {
            var health = GameManager.Instance.healthContainer[col.gameObject];
            health.SubstractHealth(damage);
        }


        Destroy(gameObject);
    

    }
}
