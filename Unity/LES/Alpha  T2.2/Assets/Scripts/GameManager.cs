using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    public GameObject gameOverCanvas;
    public static GameManager Instance { get; private set; }
    public Dictionary<GameObject, Health> healthContainer;

    private void Awake()
    {
        Instance = this;
        healthContainer = new Dictionary<GameObject, Health>();
    }

    private void Start()
    {
       

        var healthObject = FindObjectsOfType<Health>();

        foreach (var healthComponent in healthObject)
        {
           // healthContainer.Add(healthComponent.gameObject, healthComponent);
        }

        gameOverCanvas.SetActive(false);
    }

  

    public void ShowGameOver()
    {
        gameOverCanvas.SetActive(true); 
        Time.timeScale = 0f; // Остановить время
    }

    public void OnRetryButtonClick()
    {
        Time.timeScale = 1f; // Возобновить время
        SceneManager.LoadScene(SceneManager.GetActiveScene().name); 
    }

    public void OnMenuButtonClick()
    {
        Time.timeScale = 1f; // Возобновить время
        SceneManager.LoadScene("menu");
    }


   
}
