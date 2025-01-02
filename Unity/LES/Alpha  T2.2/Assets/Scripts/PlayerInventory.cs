using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerInventory : MonoBehaviour
{
    public Text CoinsText;
    public Text GemText;
    public int totalAmountofGemAtLevel;

    public int curGemCount;
    
    public int money;

    private void OnTriggerEnter2D(Collider2D col)
    {
        
        if (col.gameObject.CompareTag("gem"))
        {
            Destroy(col.gameObject);
            curGemCount++;
            GemUpdate();
        }

        if (col.gameObject.CompareTag("door"))
        {
            if (curGemCount >= totalAmountofGemAtLevel)
            {
                Destroy(col.gameObject);
            
                Debug.Log("Well done! You passed this level!");
                
            }

        }

        if (col.gameObject.CompareTag("coinGold"))
        {
            
            money +=10;
            col.gameObject.GetComponent<DestroyCoin>().StartDestroy();
            CoinsUpdate();
        }

        if (col.gameObject.CompareTag("coinSilver"))
        {
            
            money +=5;
            col.gameObject.GetComponent<DestroyCoin>().StartDestroy();
            CoinsUpdate();
        }

        if (col.gameObject.CompareTag("coinBronze"))
        {
            
            money++;
            col.gameObject.GetComponent<DestroyCoin>().StartDestroy();
            CoinsUpdate();
        }

    }

   public void CoinsUpdate()
    {
        CoinsText.text = money.ToString();
    }

    public void GemUpdate()
    {
        GemText.text = curGemCount.ToString();
    }

}

