using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Checkpoint : MonoBehaviour
{
    
    [SerializeField] Rigidbody2D rb2d;


    public void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.CompareTag("Checkpoint"))
        {
            if (collision.CompareTag("Player"))
            {
                ReloadStartPosition reloadStartPosition = collision.GetComponent<ReloadStartPosition>();
                if (reloadStartPosition != null)
                {
                    reloadStartPosition.startX = transform.position.x;
                    reloadStartPosition.startY = transform.position.y + 1; // Добавляем 1 к Y, чтобы не респауниться в текстуре
                }
                
                gameObject.tag = "UsedCheckpoint";
            }
           
        }
    }
}
