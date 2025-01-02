using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DamageDetected : MonoBehaviour
{
    //public int damage;
    //public string damageTargetTag;
    //public bool shouldReloadPlayer;

    //private void OnCollisionEnter2D(Collision2D col)
    //{
    //if (col.gameObject.CompareTag(damageTargetTag))
    //{
    //    Health health = GameManager.Instance.AddHealth(col.gameObject);
    //    if (health)
    //    {
    //        health.SubstractHealth(damage);

    //        if (shouldReloadPlayer)
    //        {
    //            ReloadStartPosition reloadPosition = GameManager.Instance.GetReloadPosition(col.gameObject);
    //            if (reloadPosition)
    //            {
    //                reloadPosition.ReloadPosition();
    //            }
    //        }
    //    }
    //}
    //}


    public int damage;
    public string damageTargetTag;


    private void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject.CompareTag(damageTargetTag))
        {
            Health health = col.gameObject.GetComponent<Health>();
            if (health)
            {
                health.SubstractHealth(damage);
            }


        }


    }
}

