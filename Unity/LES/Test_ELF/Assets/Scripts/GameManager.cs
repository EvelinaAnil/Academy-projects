using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }
    public Dictionary<GameObject, Health> healthContainer;

    private void Awake()
    {
        Instance = this;
        healthContainer = new Dictionary<GameObject, Health>();
    }

    private void Start()
    {
        //var healthObjects = FindObjectsOfType<Health>();

        //foreach (var healthComponent in healthObjects)
        //{
        //    healthContainer.Add(healthComponent.gameObject, healthComponent);
        //}


    }

    public void OnClickPause()
    {
        if (Time.timeScale > 0)
        {
            Time.timeScale = 0;
        }
        else
        {
            Time.timeScale = 1;
        }

    }

}
