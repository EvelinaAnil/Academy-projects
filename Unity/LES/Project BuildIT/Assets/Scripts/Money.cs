using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Money : MonoBehaviour
{
    public int coin;
    public bool IsGreen = false;
    public SpriteRenderer spriteRenderer;
    public Player player;

    private void Start()
    {
        GameObject[] moneyObjects = GameObject.FindGameObjectsWithTag("Money");
        if (moneyObjects.Length > 1)
        {
            int randomIndex = Random.Range(0, moneyObjects.Length);
            while (moneyObjects[randomIndex] == gameObject)
            {
                // Щоб вибрати інший об'єкт, який не є поточним
                randomIndex = Random.Range(0, moneyObjects.Length);
            }
            moneyObjects[randomIndex].GetComponent<Money>().ColorGreen();
        }

    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.gameObject.CompareTag("Player") && IsGreen)
        {
             player.coins += coin++;
            ColorYellow();
        }
    }

    public void ColorYellow()
    {
        spriteRenderer.color = Color.yellow;
        IsGreen = false;
    }

    public void ColorGreen()
    {
        spriteRenderer.color = Color.green;
        IsGreen = true;
    }

    //public int coin = 0; // Початкова кількість монет
    //private bool isCollected = false; // Прапорець, чи зібрано монету
    //private SpriteRenderer spriteRenderer; // Силует об'єкта


    //private void Start()
    //{
    //    // Отримуємо компоненти
    //    spriteRenderer = GetComponent<SpriteRenderer>();
    //    // Зберігаємо початковий колір
    //}

    //private void OnTriggerEnter2D(Collider2D other)
    //{
    //    if (other.CompareTag("Player") && !isCollected)
    //    {
    //        // Зберігаємо інформацію про те, що монета зібрана
    //        isCollected = true;

    //        // Змінюємо колір на зелений
    //         spriteRenderer.color = Color.green;

    //        // Додаємо монету
    //        coin++;

    //        // Виводимо повідомлення в консоль
    //        Debug.Log("Coin collected! Total coins: " + coin);

    //        // Затримка перед вибором наступного об'єкта

    //        ResetColorAndFindNew();
    //    }
    //}

    //// Метод для скидання коліру на початковий та пошук нового об'єкта монети
    //private void ResetColorAndFindNew()
    //{
    //    // Повертаємо колір на початковий
    //    spriteRenderer.color = Color.yellow;

    //    // Знаходимо інший об'єкт монети та повторюємо процес
    //    FindNewMoneyObject();
    //}

    //// Метод для пошуку нового об'єкта монети
    //private void FindNewMoneyObject()
    //{
    //    // Отримуємо всі об'єкти з тегом "Money" у сцені
    //    GameObject[] moneyObjects = GameObject.FindGameObjectsWithTag("Money");

    //    // Вибираємо рандомно інший об'єкт, якщо їх більше одного
    //    if (moneyObjects.Length > 1)
    //    {
    //        int randomIndex = Random.Range(0, moneyObjects.Length);
    //        while (moneyObjects[randomIndex] == gameObject)
    //        {
    //            // Щоб вибрати інший об'єкт, який не є поточним
    //            randomIndex = Random.Range(0, moneyObjects.Length);
    //        }
    //        moneyObjects[randomIndex].GetComponent<Money>().StartColorChange();
    //    }
    //}

    //// Метод для початку зміни коліру об'єкта
    //private void StartColorChange()
    //{
    //    isCollected = false;
    //    spriteRenderer.color = Color.green;
    //    ResetColorAndFindNew();
    //}
}