using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerInventory : MonoBehaviour
{
    public int coinsCount;
    [SerializeField] private Text coinsText;

    private void Start()
    {
        coinsText.text = "0";
    }

    private void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject.CompareTag("Coin"))
        {
            coinsCount++;
            coinsText.text = coinsCount.ToString();
            col.gameObject.GetComponent<DestroyCoin>().StartDestroy();
        }
    }
}
