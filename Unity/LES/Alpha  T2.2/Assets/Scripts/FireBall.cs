using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FireBall : MonoBehaviour
{
    [SerializeField] private SpriteRenderer spriteRenderer;
    [SerializeField] private Rigidbody2D rb2d;
    [SerializeField] private float lifeTime; //5
    [SerializeField] private TriggerDamage triggerDamage;

    public void SetImpulse(Vector2 direction, float forceDirection, GameObject parent)
    {
        if (forceDirection < 0)
        {
            transform.rotation = Quaternion.Euler(-2, 180, 0);
        }
        triggerDamage.Parent = parent; 
        rb2d.AddForce(direction * forceDirection, ForceMode2D.Impulse);
        StartCoroutine(StartLife());

    }

    IEnumerator StartLife()
    {

        yield return new WaitForSeconds(lifeTime);
        Destroy(gameObject);


        yield return null;

    }

}
